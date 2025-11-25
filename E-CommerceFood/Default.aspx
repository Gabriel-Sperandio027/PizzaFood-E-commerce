<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_CommerceFood.Default" ResponseEncoding="utf-8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Pizza's Food</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/style.css?v=2" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">

        <!-- NAVBAR VISITANTE -->
        <section id="navbarVisitante" runat="server">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand fw-bold" href="Default.aspx">Pizza's Food</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
                        <div class="d-flex">
                            <a href="FrmLogin.aspx" class="btn btn-outline-light fw-bold">Acesse sua Conta</a>

                            <a href="FrmLogin.aspx" class="btn btn-outline-light ms-2 position-relative fw-bold" role="button">Carrinho
                            </a>
                        </div>
                    </div>
                </div>
            </nav>
        </section>

        <!-- NAVBAR LOGADO -->
        <section id="navbarLogado" runat="server">
            <nav class="navbar navbar-dark bg-dark fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand fw-bold text-white" href="Default.aspx">Pizza's Food</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="offcanvas offcanvas-end text-bg-dark d-flex flex-column" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title fw-bold" id="offcanvasDarkNavbarLabel">Pizza's Food</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>

                        <div class="offcanvas-body d-flex flex-column">
                            <hr class="text-white" />
                            <!-- Links principais -->
                            <div>
                                <ul class="navbar-nav pe-3">
                                    <li>
                                        <a href="Default.aspx" class="nav-link text-white fw-bold">
                                            <img src="img/inicio-icon.svg" alt="Logo Início" />
                                            Início
                                        </a>
                                    </li>
                                    <li>
                                        <a href="Cardapio.aspx" class="nav-link text-white fw-bold">
                                            <img src="img/cardapio-icon.svg" alt="Logo Cardápio" />
                                            Cardápio
                                        </a>
                                    </li>
                                    <li>
                                        <a href="MeusPedidos.aspx" class="nav-link text-white fw-bold">
                                            <img src="img/usuário-icon.svg" alt="Meus Pedidos" />
                                            Meus Pedidos
                                        </a>
                                    </li>
                                    <li>
                                        <a href="Carrinho.aspx" class="nav-link text-white fw-bold position-relative">
                                            <img src="img/logo-carrinho.svg" alt="Logo Carrinho" />
                                            Carrinho
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <!-- Dropdown do usuário -->
                            <div class="dropup mt-auto">
                                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown">
                                    <img src="/img/logo-admin.png" alt="" width="32" height="32" class="rounded-circle me-2" />

                                    <strong id="lblNomeUsuario" runat="server">Olá, Usuário</strong>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser2">
                                    <li>
                                        <a class="dropdown-item" href="Logout.aspx" onmouseover="this.style.backgroundColor='darkred'; this.style.color='white';" onmouseout="this.style.backgroundColor=''; this.style.color='';">Sair</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </section>
        <!--FIM DO NAVBAR USUÁRIO LOGADO-->


        <!--CAROUSEL-->
        <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/img-carousel.jpeg" class="d-block w-100 carousel-img" alt="CarouselFirst">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>A Verdadeira Pizza Artesanal </h5>
                        <p>
                        Massa fresca aberta na hora e ingredientes selecionados.
           
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/img-carousell.jpeg" class="d-block w-100 carousel-img" alt="CarouselSecond">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Deu Fome de Pizza? </h5>
                        <p>Não passe vontade. Peça agora e receba quentinha na sua porta.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/img-carouselll.jpeg" class="d-block w-100 carousel-img" alt="CarouselThirdy">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Combo Família </h5>
                        <p>2 Pizzas Grandes + Refrigerante. A partir de R$ 64,90.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!--FIM DO CAROUSEL-->



        <!--Mostra apenas 8 produtos de cada categoria, tendo a opção de ver mais clicando no botão, PS.:Apenas usuários que efetuaram o login conseguirão acessar o cardápio-->
        <div class="container mt-4">
            <div class="row" id="produtos">

                <asp:Repeater ID="rptCategorias" runat="server" OnItemDataBound="rptCategorias_ItemDataBound">
                    <ItemTemplate>
                        <h2 class="categoria-titulo text-center fw-bold"><%# Eval("Key.NomeCategoria") %></h2>
                        <hr class="text-danger opacity-100 border-4">

                        <div class="row">
                            <asp:Repeater ID="rptProdutos" runat="server" OnItemCommand="rptProdutos_ItemCommand">
                                <ItemTemplate>
                                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                                        <div class="card h-100 shadow-sm">
                                            <img src='<%# Eval("Imagem") %>' class="card-img-top" alt='<%# Eval("Nome") %>' />
                                            <div class="card-body d-flex flex-column">
                                                <h5 class="card-title"><%# Eval("Nome") %></h5>
                                                <p class="card-text flex-grow-1"><%# Eval("Descricao") %></p>
                                                <p class="fw-bold">R$ <%# Eval("Preco", "{0:F2}") %></p>
                                                <div class="d-flex justify-content-between align-items-center">

                                                    <asp:Button ID="btnVerMais" Text="Ver Mais" runat="server"
                                                        CommandArgument='<%# Eval("Id") %>' CommandName="VerMais"
                                                        CssClass="btn btn-primary fw-bold" />

                                                    <asp:Button ID="btnAdicionarAoCarrinho" Text="Adicionar+" runat="server"
                                                        CommandArgument='<%# Eval("Id") %>' CommandName="AdicionarAoCarrinho"
                                                        CssClass="btn btn-success fw-bold" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:LinkButton ID="btnVerTodos" Text="Ver Todos os Produtos" runat="server" CssClass="btn btn-danger btn-lg fw-bold mt-3" OnClick="btnVerTodos_Click" />
            </div>
        </div>
        <!--FIM DO CARD-->

        <!--FOOTER-->
        <section>
            <div class="container">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Início</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Sobre Nós</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Equipe</a></li>
                    </ul>
                    <p class="text-center text-body-secondary">© 2025</p>
                </footer>
            </div>
        </section>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
