<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrinho.aspx.cs" Inherits="E_CommerceFood.Carrinho" ResponseEncoding="utf-8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Carrinho de Pedidos</title>

    <!-- BOOTSTRAP 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!--CSS-->
    <link href="../css/style.css" rel="stylesheet" />
    
    <!-- FIM DO BOOTSTRAP -->
</head>
<body style="padding-top: 60px;">
    <form id="form1" runat="server">

        <!--NAVBAR USUÁRIO LOGADO-->
        <section id="navbarLogado" runat="server">
            <nav class="navbar navbar-dark bg-dark fixed-top">
                <div class="container-fluid">

                    <a class="navbar-brand fw-bold text-white" href="Default.aspx">Pizza's Food</a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar" aria-controls="#offcanvasDarkNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="offcanvas offcanvas-end text-bg-dark d-flex flex-column"
                        tabindex="-1" id="offcanvasDarkNavbar"
                        aria-labelledby="offcanvasDarkNavbarLabel">

                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title fw-bold" id="offcanvasDarkNavbarLabel">Pizza's Food</h5>
                            <button type="button" class="btn-close btn-close-white"
                                data-bs-dismiss="offcanvas" aria-label="Close">
                            </button>
                        </div>

                        <div class="offcanvas-body d-flex flex-column">
                            <hr class="text-white">

                            <!-- Links principais -->
                            <div>
                                <ul class="navbar-nav pe-3">

                                    <li>
                                        <a href="Default.aspx" class="nav-link text-white fw-bold">
                                            <img src="../img/inicio-icon.svg" alt="Logo Início" />
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
                                            <img src="../img/usuário-icon.svg" alt="Meus Pedidos" />
                                            Meus Pedidos
                                        </a>
                                    </li>

                                    <li>
                                        <a href="Carrinho.aspx" class="nav-link text-white fw-bold position-relative">
                                            <img src="../img/logo-carrinho.svg" alt="Logo Carrinho" />
                                            Carrinho
                                        </a>
                                    </li>

                                </ul>
                            </div>

                            <!-- Dropdown do usuário -->
                            <div class="dropup mt-auto">
                                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                                    id="dropdownUser2" data-bs-toggle="dropdown">

                                    <img src="/img/logo-admin.png" alt="" width="32" height="32"
                                        class="rounded-circle me-2" />

                                    <strong id="lblNomeUsuario" runat="server">Olá, Usuário</strong>

                                </a>

                                <ul class="dropdown-menu dropdown-menu-dark text-small shadow"
                                    aria-labelledby="dropdownUser2">
                                    <li>
                                        <a class="dropdown-item" href="Logout.aspx"
                                            onmouseover="this.style.backgroundColor='darkred'; this.style.color='white';"
                                            onmouseout="this.style.backgroundColor=''; this.style.color='';">Sair
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </nav>
        </section>
        <!--FIM DO NAVBAR USUÁRIO LOGADO-->

        <!--Após o cliente clicar em Adicionar+ ele é redirecionado pro carrinho onde ele tem as informações do produto que ele selecionou, preço e etc... tendo opções de adicionar mais um ou quantos quiser e também remover ou simplesmente finalizar o pedido-->
        <div class="container mt-4">
            <asp:Label ID="lblMensagem" runat="server" CssClass="text-danger fw-bold mb-3 d-block"></asp:Label>
            <asp:Repeater ID="rptCarrinho" runat="server" OnItemCommand="rptCarrinho_ItemCommand">
                <ItemTemplate>
                    <div class="row mb-3 p-3 border rounded shadow-sm cart-item">
                        <div class="col-2">
                            
                           <img src='<%# ResolveUrl(Eval("Imagem").ToString()) %>' class="img-fluid" />
                        </div>

                        <div class="col-4">
                            <h5 class="product-name"><%# Eval("Nome") %></h5>
                            <p class="product-price">R$ <%# Eval("Preco","{0:F2}") %></p>
                        </div>
                        <!--Quantidade com botões de aumentar e diminuir-->
                        <div class="col-3 d-flex align-items-center quantity-controls">
                            <asp:Button runat="server" CssClass="btn btn-sm btn-dark" Text="-" CommandName="Diminuir" CommandArgument='<%# Eval("IdProduto") %>' />
                            <span class="mx-2"><%# Eval("Quantidade") %></span>
                            <asp:Button runat="server" CssClass="btn btn-sm btn-dark" Text="+" CommandName="Aumentar" CommandArgument='<%# Eval("IdProduto") %>' />
                        </div>

                        <div class="col-2">
                            <p class="cart-subtotal">Subtotal: R$ <%# (Convert.ToDecimal(Eval("Preco")) * Convert.ToInt32(Eval("Quantidade"))).ToString("F2") %></p>
                        </div>

                        <div class="col-1">
                            <asp:Button ID="btnRemoverProduto" Text="Remover" runat="server"
                                CommandArgument='<%# Eval("IdProduto") %>' CommandName="Remover"
                                CssClass="btn btn-danger fw-bold" OnClientClick="return confirm('Tem certeza que deseja remover este produto do carrinho?');" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <h3>Total: R$
                <asp:Label ID="lblTotal" runat="server"></asp:Label></h3>

            <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-secondary fw-bold" Text="Voltar ao Cardápio" OnClick="btnVoltar_Click" />

            <asp:Button ID="btnFinalizar" Text="Finalizar Pedido" runat="server" CssClass="btn btn-success fw-bold" OnClick="btnFinalizar_Click" />
        </div>

        <!--Footer-->
        <section>
            <div class="container">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Início</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Sobre Nós</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Equipe</a></li>
                    </ul>
                    <p class="text-center text-body-secondary">©2025</p>
                </footer>
            </div>
        </section>

    </form>

    <!-- JS DO BOOTSTRAP -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
