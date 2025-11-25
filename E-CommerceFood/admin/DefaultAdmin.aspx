<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultAdmin.aspx.cs" Inherits="E_CommerceFood.admin.DefaultAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Administrador</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <link href="../css/style.css" rel="stylesheet" />

</head>
<body style="padding-top: 40px;">
    <form id="form1" runat="server">

        <!-- NAVBAR ADMIN -->
        <section>
            <nav class="navbar navbar-dark bg-dark fixed-top">
                <div class="container-fluid">
                    <h1 class="text-center fw-bold text-white">Painel do Administrador</h1>
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="offcanvas offcanvas-end text-bg-dark d-flex flex-column" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel fw-bold">Controle Geral</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>

                        <div class="offcanvas-body d-flex flex-column">
                            <hr class="text-white">
                            <!-- Links no topo -->
                            <div>
                                <ul class="navbar-nav pe-3">

                                   <!--Links de navegação para as funcionalidades do admin-->
                                    <li>
                                        <a href="#" class="nav-link text-white fw-bold">
                                            <img src="../img/inicio-icon.svg" alt="Logo Início" />
                                            Início
                                        </a>
                                    </li>

                                    <li>
                                        <a href="FrmProdutos.aspx" target="iframeConteudo" class="nav-link text-white fw-bold">
                                            <img src="../img/produtos-icon.svg" alt="Logo Produtos" />
                                            Produtos
                                        </a>
                                    </li>

                                    <li>
                                        <a href="FrmGerenciadorClientes.aspx" target="iframeConteudo" class="nav-link text-white fw-bold">
                                            <img src="../img/usuário-icon.svg" alt="Logo Usuários" />
                                            Usuários
                                        </a>
                                    </li>

                                    <li>
                                        <a href="GerenciadorPedidos.aspx" target="iframeConteudo" class="nav-link text-white fw-bold">
                                            <img src="../img/logo-pedidos.svg" alt="Logo Pedidos" />
                                            Pedidos
                                        </a>
                                    </li>

                                </ul>
                            </div>

                            <!-- Dropdown do usuário no final -->
                            <div class="dropup mt-auto">
                                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown">
                                    <img src="/img/logo-admin.png" alt="" width="32" height="32" class="rounded-circle me-2" />
                                    <strong id="lblNomeUsuario" runat="server">Olá, Administrador</strong>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser2">
                                    <li>
                                        <a class="dropdown-item" href="../Logout.aspx" onmouseover="this.style.backgroundColor='darkred'; this.style.color='white';"
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
        <!--FIM DO NAVBAR-->

 <!--FOOTER-->
        <div class="container-fluid bg-dark text-white mt-5">
            <footer class="py-3 my-4">
                <p class="text-center text-white mb-0 fw-bold">©2025 Pizza Food</p>
            </footer>
        </div>
        <!--FIM DO FOOTER-->
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
