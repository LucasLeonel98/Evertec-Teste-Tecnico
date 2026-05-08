BEGIN TRANSACTION;

DECLARE @i INT = 1;
DECLARE @CpfBase BIGINT = 10000000000; -- CPF base para incremento
DECLARE @CidadeID INT;

WHILE @i <= 400
BEGIN
    -- Alterna o código da cidade entre 4, 5, 6 e 7
    SET @CidadeID = 4 + (@i % 4); 

    INSERT INTO CLIENTES (
        CPF_CNPJ, 
        NOME, 
        ENDERECO, 
        BAIRRO, 
        COMPLEMENTO, 
        EMAIL, 
        TELEFONE, 
        COD_CIDADE
    )
    VALUES (
        CAST(@CpfBase + @i AS VARCHAR(11)),         -- Gera um CPF sequencial
        'CLIENTE TESTE NUMERO ' + CAST(@i AS VARCHAR(10)), -- Nome dinâmico
        'RUA FICTICIA, ' + CAST(@i AS VARCHAR(10)), -- Endereço dinâmico
        'BAIRRO TESTE', 
        'CASA', 
        'cliente' + CAST(@i AS VARCHAR(10)) + '@provedor.com', 
        '1899' + CAST(1000000 + @i AS VARCHAR(20)), -- Telefone dinâmico
        @CidadeID
    );

    SET @i = @i + 1;
END;

COMMIT TRANSACTION;