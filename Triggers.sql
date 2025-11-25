-- Trigger usada para verificação de Disponibilidade de Produtos (Criar junto com a
tabela Produtos)
CREATE TRIGGER trg_AtualizarDisponibilidade
ON Produtos
AFTER INSERT, UPDATE
AS
BEGIN
SET NOCOUNT ON;
UPDATE Produtos
SET Disponibilidade =
CASE
WHEN i.Estoque > 0 THEN 'Em estoque'
ELSE 'Esgotado'
END
FROM Produtos p
INNER JOIN inserted i ON p.Id = i.Id;
END;
