<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeusPedidos.aspx.cs" Inherits="E_CommerceFood.MeusPedidos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Meus Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!--NAVBAR USUÁRIO LOGADO-->
        <section id="navbarLogado" runat="server">
            <nav class="navbar navbar-dark bg-dark fixed-top">
                <div class="container-fluid">

                    <a class="navbar-brand fw-bold text-white" href="Default.aspx">Pizza's Food</a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
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
                                            <img src="img/inicio-icon.svg" alt="Logo Inicio" />
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
                                            <img src="img/usuário-icon.svg" alt="Logo Usuario" />
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


        <!--Exibi uma tabela com todos os pedidos feitos pelo usuário com suas informações, sendo as principais, status do pedido, valor total e etc...-->
        <div class="container mt-5 pt-4">
            <h2>Meus Pedidos</h2>

            <asp:Button ID="btnExcluirPedidos" 
                Text="Excluir Todos os Pedidos" runat="server" 
                CssClass="btn btn-danger mb-3 fw-bold" OnClick="btnExcluirPedidos_Click" 
                OnClientClick="return confirm('Deseja realmente excluir todos os pedidos?');" />

            <asp:Repeater ID="rptPedidos" runat="server" OnItemCommand="rptPedidos_ItemCommand" OnItemDataBound="rptPedidos_ItemDataBound">
                <HeaderTemplate>
                    <div class="accordion" id="accordionPedidos">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id='heading<%# Eval("Id") %>'>
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%# Eval("Id") %>" aria-expanded="false" aria-controls="collapse<%# Eval("Id") %>">
                                Pedido #<%# Eval("Id") %> - <small class="text-muted"><%# Eval("DataPedido") %></small> - <strong><%# Eval("Status") %></strong> - R$ <%# Eval("ValorTotal", "{0:F2}") %>
                            </button>
                        </h2>
                        <div id='collapse<%# Eval("Id") %>' class="accordion-collapse collapse" aria-labelledby='heading<%# Eval("Id") %>' data-bs-parent="#accordionPedidos">
                            <div class="accordion-body">
                                <div class="mb-3">
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar Pedido" 
                                        CommandName="CancelarPedido" CommandArgument='<%# Eval("Id") %>' 
                                        CssClass="btn btn-danger fw-bold" OnClientClick="return confirm('Deseja realmente cancelar este pedido?');" />
                                </div>
                                <h5>Itens</h5>
                                <asp:Repeater ID="rptItens" runat="server">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Produto</th>
                                                    <th>Quantidade</th>
                                                    <th>Preço Unit.</th>
                                                    <th>Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Produtos.Nome") %></td>
                                            <td><%# Eval("Quantidade") %></td>
                                            <td>R$ <%# Eval("PrecoUnitario", "{0:F2}") %></td>
                                            <td>R$ <%# (Convert.ToDecimal(Eval("PrecoUnitario")) * Convert.ToInt32(Eval("Quantidade"))).ToString("F2") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
 </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <!-- Footer (user) -->
        <section>
            <div class="container">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Início</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Sobre Nós</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Equipe</a></li>
                    </ul>
                    <p class="text-center text-body-secondary">©2025 Pizza's Food</p>
                </footer>
            </div>
        </section>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
