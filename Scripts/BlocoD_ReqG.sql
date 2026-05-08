CREATE PROCEDURE SP_GRAVAR_CLIENTE 
      @Codigo_Cliente INT OUTPUT, 
      @CGC_CPF_Cliente VARCHAR(18), 
      @Nome VARCHAR(150), 
      @Telefone VARCHAR(15), 
      @Email VARCHAR(100), 
      @CEP VARCHAR(10),       -- Modificação: Ajustado para suportar máscaras (ex: 00000-000)
      @Codigo_Cidade INT 
AS 
BEGIN     
    -- 1. Modificação: Melhora performance e evita mensagens extras de contagem de linhas
    SET NOCOUNT ON; 

    -- 2. Modificação: Bloco para tratamento de exceções
    BEGIN TRY
        
        -- 3. Modificação: Validação de existência para evitar erros de chave duplicada
        IF EXISTS (SELECT 1 FROM Clientes WHERE CGC_CPF_Cliente = @CGC_CPF_Cliente)
        BEGIN
            RAISERROR('Erro: Este CPF/CNPJ já está cadastrado.', 16, 1);
            RETURN;
        END

        -- 4. Modificação: Início da Transação para garantir atomicidade (Tudo ou Nada)
        BEGIN TRANSACTION
            
            INSERT INTO Clientes (CGC_CPF_Cliente, Nome, Telefone, Email, CEP, Codigo_Cidade) 
            VALUES (@CGC_CPF_Cliente, @Nome, @Telefone, @Email, @CEP, @Codigo_Cidade);

            -- 5. Modificação: SCOPE_IDENTITY é mais seguro que @@IDENTITY
            SET @Codigo_Cliente = SCOPE_IDENTITY(); 

            -- 6. Modificação: Removido o update que fazia na tabela cidades que estava sem where e tambem não fazia sentido ela estar aqui
           

        -- Confirma as alterações
        COMMIT TRANSACTION
        
        SELECT 'OK' AS Mensagem;

    END TRY
    BEGIN CATCH
        -- Se houver erro, desfaz qualquer alteração no banco
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;
        
        -- Retorna o erro real para a aplicação
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END