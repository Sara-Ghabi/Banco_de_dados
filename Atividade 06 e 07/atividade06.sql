CREATE DATABASE EmpresaDB;
GO


USE EmpresaDB;
GO
-- Criação da tabela Departamentos
CREATE TABLE Departamentos (
    DepartamentoID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Funcionarios
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL,
    Salario money NOT NULL,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Criação da tabela LogAlteracoes
CREATE TABLE LogAlteracoes (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    FuncionarioID INT NOT NULL,
    DataAlteracao DATETIME NOT NULL DEFAULT GETDATE(),
    SalarioAntigo money,
    SalarioNovo money,
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

INSERT INTO Departamentos (Nome) VALUES ('Recursos Humanos');
INSERT INTO Departamentos (Nome) VALUES ('Tecnologia da Informação');
INSERT INTO Departamentos (Nome) VALUES ('Financeiro');
INSERT INTO Departamentos (Nome) VALUES ('Marketing');
INSERT INTO Departamentos (Nome) VALUES ('Vendas');

SELECT * FROM Departamentos;

INSERT INTO Funcionarios (Nome, Idade, Salario, DepartamentoID) VALUES ('João Silva', 30, 5000.00, 1);
INSERT INTO Funcionarios (Nome, Idade, Salario, DepartamentoID) VALUES ('Maria Oliveira', 25, 4500.00, 2);
INSERT INTO Funcionarios (Nome, Idade, Salario, DepartamentoID) VALUES ('Carlos Souza', 40, 6000.00, 3);
INSERT INTO Funcionarios (Nome, Idade, Salario, DepartamentoID) VALUES ('Ana Costa', 35, 5500.00, 4);
INSERT INTO Funcionarios (Nome, Idade, Salario, DepartamentoID) VALUES ('Pedro Rocha', 28, 4800.00, 5);

SELECT * FROM Funcionarios;


-- CRIE SUAS TRIGGERS AQUI 

-- TR01
CREATE TRIGGER TR_SalarioAlterado
ON Funcionarios
AFTER UPDATE
AS
BEGIN
	DECLARE @salarioAntigo MONEY, @salarioNovo MONEY, @idFuncionario INT;
	SELECT @salarioAntigo = Salario FROM deleted;
	SELECT @salarioNovo = Salario FROM inserted;
	SELECT @idFuncionario = FuncionarioID FROM inserted;

	INSERT INTO LogAlteracoes(FuncionarioID,SalarioAntigo,SalarioNovo) 
	VALUES(@idFuncionario,@salarioAntigo,@salarioNovo);
END;

UPDATE Funcionarios SET Salario = 5000.00 WHERE FuncionarioID = 2;
SELECT * FROM LogAlteracoes;

-- TR02
-- Crie uma trigger que impeça a inserção de funcionários com idade inferior a 18 anos e envie uma
-- mensagem de erro personalizada ao usuário.

CREATE TRIGGER TR_Menor18
ON Funcionarios
FOR INSERT
AS
BEGIN
	DECLARE @idade INT;
	SELECT @idade = Idade FROM inserted;

	IF(@idade < 18)
	BEGIN
		ROLLBACK TRANSACTION;
		RAISERROR('Erro! Funcionário menor de 18 anos',1,1);
	END
END;

INSERT INTO Funcionarios(Nome, Idade, Salario, DepartamentoID) VALUES('Gustavo Lima', 17, 1200.00, 3);
SELECT * FROM Funcionarios;

-- TR03
-- Crie uma trigger que, ao excluir um funcionário, verifique se o departamento dele não possui mais
-- nenhum funcionário vinculado e, se sim, exclua também o departamento.

CREATE TRIGGER TR_ExcluirFuncionario
ON Funcionarios
AFTER DELETE
AS
BEGIN
	DECLARE @idDepartamento INT;
	SELECT @idDepartamento = DepartamentoID FROM deleted;

	IF((SELECT COUNT(FuncionarioID) FROM Funcionarios WHERE DepartamentoID = @idDepartamento) = 0)
	BEGIN
		DELETE FROM Departamentos WHERE DepartamentoID = @idDepartamento;
	END
END;

DELETE FROM Funcionarios WHERE FuncionarioID = 1;
SELECT * FROM Departamentos;
select * from Funcionarios;

-- PROCEDURES

CREATE PROCEDURE ST_SelectFuncionarios
AS
BEGIN
	SELECT * FROM Funcionarios;
END;

EXEC ST_SelectFuncionarios;

-- PROCURAR FUNCIONÁRIO POR NOME
CREATE PROCEDURE ST_PesquisarFuncionario
@Nome VARCHAR(100)
AS
BEGIN
	SELECT * FROM Funcionarios WHERE Nome LIKE '%' + @Nome + '%';
END;

EXEC ST_PesquisarFuncionario 'Ana';

 -- PROCEDURE PARA INSERIR NOVO DEPARTAMENTO
CREATE PROCEDURE ST_CadastrarDepartamento
@Departamento VARCHAR(100)
AS
BEGIN
	IF EXISTS(SELECT * FROM Departamentos WHERE Nome LIKE @Departamento)
	BEGIN
		RAISERROR('Erro! departamento já existe!',16,1);
	END
	ELSE
	BEGIN
		INSERT INTO Departamentos VALUES(@Departamento);
	END
END;

EXEC ST_CadastrarDepartamento 'logistica';

SELECT * FROM Departamentos;

-- procedure para cadastrar funcionarios
CREATE PROCEDURE ST_CadatrarFuncionario
@Nome VARCHAR(100),
@Idade INT,
@Salario MONEY,
@DepartamentoID INT
AS
BEGIN
	INSERT INTO Funcionarios VALUES (@Nome,@Idade,@Salario,@DepartamentoID);
END;



EXEC ST_CadatrarFuncionario 'Aghata Nunes',21,3000,5;


-- 1 - Crie uma Stored procedure que receba o DepartamentoID como parâmetro e retorne todos os funcionários pertencentes a esse departamento.  
CREATE PROCEDURE ST_FuncionarioDepartamento
@departamento INT
AS
BEGIN
	SELECT 
		Nome AS 'Funcionários'
	FROM Funcionarios WHERE DepartamentoID = @departamento;
END;

EXEC ST_FuncionarioDepartamento 1;

-- 2 -Crie uma procedure que receba o FuncionarioID e o novo salário como parâmetros e atualize o salário do funcionário correspondente. 
CREATE PROCEDURE ST_SalarioNovo
@idFuncionario INT,
@salario MONEY
AS
BEGIN
	UPDATE Funcionarios SET Salario = @salario WHERE FuncionarioID = @idFuncionario;
END;

EXEC ST_SalarioNovo 4,6000;
SELECT * FROM Funcionarios;

-- 3 - Crie uma procedure que receba os seguintes parâmetros: Nome, Idade, Salario e DepartamentoID.
-- A procedure deve verificar se o DepartamentoID informado existe antes de inserir o novo funcionário. 
-- Se o departamento não existir, a inserção deve ser impedida, e uma mensagem de erro deve ser exibida.

CREATE PROCEDURE ST_VerificarDepartamento
@nome VARCHAR(100),
@idade INT,
@salario MONEY,
@departamentoID INT
AS
BEGIN
	IF NOT EXISTS(SELECT DepartamentoID FROM Departamentos WHERE DepartamentoID = @departamentoID)
	BEGIN
		RAISERROR('Erro! O departamento informado não existe!',1,1)
	END
	ELSE
	BEGIN
		INSERT INTO Funcionarios(Nome,Idade,Salario,DepartamentoID) VALUES(@nome,@idade,@salario,@departamentoID);
	END
END;

EXEC ST_VerificarDepartamento 'Ygonah',20,3500,10;