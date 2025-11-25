--insert de categorias
INSERT INTO Categorias
(IdCategoria, NomeCategoria)
VALUES(1, N'Pizzas');
INSERT INTO Categorias
(IdCategoria, NomeCategoria)
VALUES(2, N'Bebidas');
INSERT INTO Categorias
(IdCategoria, NomeCategoria)
VALUES(3, N'Sobremesas');

--insert de usuarios
INSERT INTO Usuario
(IdUsuario, NomeUsuario, [Login], Senha, DataCadastro, DataUltimoAcesso, Email, Perfil, Status)
VALUES(1, N'gabriel sathler', N'gabriel', N'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2025-11-25 19:43:31.547', NULL, N'gabriel@gmail.com', 1, 0);
INSERT INTO Usuario
(IdUsuario, NomeUsuario, [Login], Senha, DataCadastro, DataUltimoAcesso, Email, Perfil, Status)
VALUES(2, N'joao', N'joao', N'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2025-11-25 19:53:15.030', NULL, N'joao@gmail.com', 0, 0);

--inserrt de produto 
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(1, N'Pizza Calabresa', 44.99, N'Molho de tomate, mussarela, calabresa e orégano.', N'img/pizza-calabresa.jpg', '2025-11-25 19:45:38.297', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(2, N'Pizza Portuguesa', 44.99, N'Molho de tomate, mussarela, presunto, cebola, ovos, azeitonas, ervilha e orégano.
', N'img/pizza-portuguesa.jpg', '2025-11-25 19:57:59.833', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(3, N'Pizza Calabresa Acebolada', 44.99, N'Molho de tomate, mussarela, calabresa, cebola, azeitona preta e orégano.', N'img/pizza-calabresa-cebola.jpg', '2025-11-25 19:59:15.340', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(4, N'Pizza 4 Queijos', 44.99, N'Molho de tomate, mussarela, provolone, parmesão, requeijão cremoso  e orégano.', N'img/pizza-quatro-queijos-1.jpg', '2025-11-25 19:59:51.983', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(5, N'Pizza Bacon', 44.99, N'Molho de tomate, mussarela, bacon e orégano.', N'img/pizza-bacon.jpg', '2025-11-25 20:00:24.557', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(6, N'Pizza Alho e Óleo', 44.99, N'Molho de tomate, mussarela, alho, óleo e orégano.', N'img/pizza-alho-oleo.jpg', '2025-11-25 20:02:06.923', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(7, N'Pizza Apreciata', 44.99, N'Molho de tomate, mussarela, milho, bacon e orégano.
', N'img/pizza-apreciata.jpg', '2025-11-25 20:02:52.373', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(8, N'Pizza Baiana', 44.99, N'Molho de tomate, mussarela, calabresa, ovos, molho de pimenta e orégano.', N'img/pizza-baiana.jpg', '2025-11-25 20:03:22.167', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(9, N'Pizza Marguerita', 44.99, N'Molho de tomate, mussarela, tomate, manjericão e orégano.', N'img/pizza-marguerita.jpg', '2025-11-25 20:03:52.507', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(10, N'Pizza Mussarela', 44.99, N'Molho de tomate, mussarela e orégano. ', N'img/pizza-mussarela.jpg', '2025-11-25 20:04:18.183', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(11, N'Pizza Vegetariana', 44.99, N'Molho de tomate, mussarela, brócolis, ervilha, palmito, milho e orégano.
', N'img/pizza-vegetariana.jpg', '2025-11-25 20:04:55.970', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(12, N'Pizza Havaiana', 44.99, N'Molho de tomate, mussarela, bacon e abacaxi. 
', N'img/pizza-havaiana.jpg', '2025-11-25 20:05:25.100', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(13, N'Pizza Frango Cremoso', 44.99, N'Molho de tomate, mussarela, frango desfiado, requeijão cremoso  e orégano.', N'img/pizza-frango-cremoso.jpg', '2025-11-25 20:06:03.887', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(14, N'Pizza Lombinho', 44.99, N'Molho de tomate, mussarela, lombinho e orégano.', N'img/pizza-lombinho.jpg', '2025-11-25 20:06:34.180', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(15, N'Pizza Lombinho ao Creme', 44.99, N'Molho de tomate, mussarela, lombinho, creme de leite, milho e orégano.', N'img/pizza-lombinho-creme.jpg', '2025-11-25 20:07:03.630', 15, N'Em estoque', 1);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(16, N'Coca-Cola 2L', 15.00, N'Coca-Cola 2 Litros', N'img/coca2l.png', '2025-11-25 20:08:15.087', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(17, N'Coca-Cola 2L Zero', 15.00, N'Coca-Cola 2 Litros Zero', N'img/coca02l.png', '2025-11-25 20:08:40.773', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(18, N'Guaraná Antarctica 2L', 15.00, N'Guaraná Antarctica 2 Litros', N'img/guarana2l.png', '2025-11-25 20:09:15.607', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(19, N'Guaraná Antarctica 600ML', 10.00, N'Guaraná Antarctica 600ML', N'img/guaranapet.png', '2025-11-25 20:09:39.527', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(20, N'Coca-Cola Lata 350ML', 7.50, N'Coca-Cola Lata 350ML', N'img/coca.png', '2025-11-25 20:10:04.593', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(21, N'Coca-Cola Lata Zero 350ML', 7.50, N'Coca-Cola Lata Zero 350ML', N'img/coca0.png', '2025-11-25 20:10:19.407', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(22, N'Guaraná Antarctica Lata 350ML', 7.50, N'Guaraná Antarctica Lata 350ML', N'img/guarana.png', '2025-11-25 20:10:41.917', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(23, N'Fanta-Uva Lata 350ML', 7.50, N'Fanta-Uva Lata 350ML', N'img/fantauva.png', '2025-11-25 20:10:58.727', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(24, N'Fanta-Laranja Lata 350ML', 7.50, N'Fanta-Laranja Lata 350ML', N'img/fantalaranja.png', '2025-11-25 20:11:18.053', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(25, N'Pepsi Lata 350ML', 7.50, N'Pepsi Lata 350ML', N'img/pepsi.png', '2025-11-25 20:12:09.087', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(26, N'Suco Maracujá Lata 290ML', 10.00, N'Suco Maracujá Lata 290ML', N'img/sucomaracuja.png', '2025-11-25 20:12:29.210', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(27, N'Suco Uva Lata 290ML', 10.00, N'Suco Uva Lata 290ML', N'img/sucouvalata.png', '2025-11-25 20:12:52.053', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(28, N'Sprite Lata 350ML', 7.50, N'Sprite Lata 350ML', N'img/sprite.png', '2025-11-25 20:13:18.180', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(29, N'Schweppes Lata 350ml', 7.50, N'Schweppes Lata 350ml', N'img/schweppes.png', '2025-11-25 20:13:32.233', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(30, N'Suco Laranja Garrafa 250ML', 15.00, N'Suco Laranja Garrafa 250ML', N'img/sucolaranja.png', '2025-11-25 20:14:06.277', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(31, N'Suco Uva Garrafa 250ML', 15.00, N'Suco Uva Garrafa 250ML', N'img/sucouva.png', '2025-11-25 20:14:26.167', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(32, N'Suco Manga Lata 290ML', 7.50, N'Suco Manga Lata 290ML', N'img/sucomanga.png', '2025-11-25 20:15:08.593', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(33, N'Água Mineral 310ML', 5.00, N'Água Mineral 310ML', N'img/aguasemgas.png', '2025-11-25 20:15:51.797', 30, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(34, N'Água com Gás 310ML', 5.00, N'Água com Gás 310ML', N'img/aguacomgas.png', '2025-11-25 20:16:31.317', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(35, N'Pizza Banoffe', 44.99, N'Creme de leite, banana e doce de leite. 
', N'img/pizza-banana-doce-leite.jpg', '2025-11-25 20:18:09.690', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(36, N'Pizza Beijinho', 44.99, N'Creme de leite, chocolate branco, leite condensado e coco ralado.', N'img/pizza-beijinho.jpg', '2025-11-25 20:18:40.040', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(37, N'Pizza Sensação Branco', 44.99, N'Creme de leite, chocolate ao leite ou branco, morango. 
', N'img/pizza-sensacao-branco.jpg', '2025-11-25 20:19:17.647', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(38, N'Pizza Chocolate', 44.99, N'Creme de leite, chocolate ao leite.
', N'img/pizza-chocolate.jpg', '2025-11-25 20:19:40.437', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(39, N'Pizza MM''S', 44.99, N'Creme de leite, chocolate ao leite e mms®. 
', N'img/pizza-mms.jpg', '2025-11-25 20:20:20.677', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(40, N'Bolo Morango', 25.00, N'Bolo de massa branca, recheios de mousse de leite Ninho® com morangos e creme gelado com morangos, cobertura de mousse branca, trufado branco, calda de chocolate e morangos.', N'img/bolomorango.png', '2025-11-25 20:20:56.487', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(41, N'Bolo Delícia de Chocolate', 25.00, N'Bolo de massa de chocolate, recheio de trufado de chocolate ao leite, cobertura de mousse de chocolate, raspas de chocolate ao leite e cerejas.', N'img/DelíciadeChocolate.png', '2025-11-25 20:21:32.860', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(42, N'Bolo Cenoura', 25.00, N'Bolo de cenoura com recheios de trufado de Nutella® e creme de Nutella® com cobertura de mousse de chocolate, farelo de massa de cenoura e Nutella®', N'img/sem-imagem.jpg', '2025-11-25 20:21:55.747', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(43, N'Bolo Pistache', 25.00, N'Bolo de massa branca, recheios de trufado e aerado de pistache, cobertura de trufado de pistache e pistache granulado.
', N'img/BoloPistache.png', '2025-11-25 20:22:18.510', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(44, N'Bolo Red Velvet', 25.00, N'Bolo de massa red velvet, recheios de Leite Moça®, mousse de cream cheese, cobertura de mousse branca, Leite Moça®, massa red velvet e cerejas decorativas.', N'img/RedVelvet.png', '2025-11-25 20:22:42.713', 15, N'Em estoque', 3);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(45, N'Bebida H2O Limoneto 500ML', 10.00, N'Bebida H2O Limoneto 500ML', N'img/h2ohlimoneto.png', '2025-11-25 20:23:09.117', 100, N'Em estoque', 2);
INSERT INTO Produtos
(Id, Nome, Preco, Descricao, Imagem, DataCadastro, Estoque, Disponibilidade, CategoriaId)
VALUES(46, N'Bebida H2O Limão 500ML', 10.00, N'Bebida H2O Limão 500ML', N'img/h2oh.png', '2025-11-25 20:23:33.213', 100, N'Em estoque', 2);
