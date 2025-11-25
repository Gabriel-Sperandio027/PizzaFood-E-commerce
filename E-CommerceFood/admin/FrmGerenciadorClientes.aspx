<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGerenciadorClientes.aspx.cs" Inherits="E_CommerceFood.admin.FrmGerenciadorClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gerenciador de Clientes</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>
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
                            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Controle Geral</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>

                        <div class="offcanvas-body d-flex flex-column">
                            <hr class="text-white">
                            <!-- Links no topo -->
                            <div>
                                <ul class="navbar-nav pe-3">

                                    <li>
                                        <a href="DefaultAdmin.aspx" class="nav-link text-white fw-bold">
                                            <img src="../img/inicio-icon.svg" alt="Logo Início" />
                                            Início
                                        </a>
                                    </li>

                                    <li>
                                        <a href="FrmProdutos.aspx" target="_self" class="nav-link text-white fw-bold">
                                            <img src="../img/produtos-icon.svg" alt="Logo Produtos" />
                                            Produtos
                                        </a>
                                    </li>

                                    <li>
                                        <a href="FrmGerenciadorClientes.aspx" target="_self" class="nav-link text-white fw-bold">
                                            <img src="../img/usuário-icon.svg" alt="Logo Usuários" />
                                            Usuários
                                        </a>
                                    </li>

                                    <li>
                                        <a href="GerenciadorPedidos.aspx" target="_self" class="nav-link text-white fw-bold">
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
                                        <a class="dropdown-item" href="../Logout.aspx" onmouseover="this.style.backgroundColor='darkred'; this.style.color='white';" onmouseout="this.style.backgroundColor=''; this.style.color='';">Sair
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

        <section style="margin-top: 100px;" class="px-3">
            <h2>Cadastro de Usuários</h2>

            <p>
                <label>Nome Usuário</label><br />
                <input type="text" id="txtNomeUsuario" runat="server" />
                <span class="required text-danger">*</span>
            </p>

            <p>
                <label>Login</label><br />
                <input type="text" id="txtLogin" runat="server" />
                <span class="required text-danger">*</span>
            </p>

            <p>
                <label>Senha</label><br />
                <input type="password" id="txtSenha" runat="server" />
                <span class="required text-danger">*</span>
            </p>

            <p>
                <label>Repetir Senha</label><br />
                <input type="password" id="txtRepetirSenha" runat="server" />
                <span class="required text-danger">*</span>
            </p>

            <p>
                <label>E-mail</label><br />
                <input type="email" id="txtEmail" runat="server" />
                <span class="required text-danger">*</span>
            </p>

            <select id="ddlPerfil" runat="server" class="mb-3">
                <option value="0">Usuário</option>
                <option value="1">Administrador</option>
            </select><br />

            <asp:Button ID="btnCadastrarUsuario" runat="server" Text="Cadastrar Usuário" CssClass="btn btn-success fw-bold" OnClick="btnCadastrarUsuario_Click" />
            <button type="reset" class="btn btn-danger fw-bold">Limpar Campos</button>

        </section>
        <br />
        <h2 class="px-3">Gerenciar Usuários</h2>

        <table class="table px-3">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Login</th>
                    <th scope="col">Data de Cadastro</th>
                    <th scope="col">Perfil</th>
                    <th scope="col">Status</th>
                    <th scope="col">Ações</th>
                </tr>
            </thead>

            <asp:ListView ID="lvUsuarios" runat="server" OnItemCommand="lvUsuarios_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <th scope="row"><%#Eval("IdUsuario") %>#</th>
                        <td><%# Eval("NomeUsuario") %></td>
                        <td><%# Eval("Login") %></td>
                        <td><%# Eval("DataCadastro") %></td>
                        <td><%# Eval("Perfil") %></td>
                        <td><%# Convert.ToBoolean(Eval("Ativo")) ? "Ativo" : "Bloqueado" %></td>

                        <td>
                            <asp:Button ID="btnBloquearUsuario" Text="Bloquear Usuário"
                                CommandArgument='<%# Eval("IdUsuario") %>' runat="server"
                                CssClass="btn btn-warning fw-bold" OnCommand="btnBloquearUsuario_Command" />

                            <asp:Button ID="btnAtivarUsuario" Text="Ativar Usuário"
                                CommandArgument='<%# Eval("IdUsuario") %>' runat="server"
                                CssClass="btn btn-success fw-bold" OnCommand="btnAtivarUsuario_Command" />

                            <asp:Button ID="btnExcluirUsuario" Text="Excluir Usuário"
                                CommandArgument='<%# Eval("IdUsuario") %>' runat="server"
                                CssClass="btn btn-danger fw-bold" OnCommand="btnExcluirUsuario_Command" />

                            <asp:Button ID="btnEditarUsuario" Text="Editar Usuário"
                                CommandArgument='<%# Eval("IdUsuario") %>' runat="server"
                                CssClass="btn btn-primary fw-bold" OnCommand="btnEditarUsuario_Command" />

                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </table>

        <!--FOOTER-->
        <div class="container-fluid bg-dark text-white mt-5">
            <footer class="py-3 my-4">
                <p class="text-center text-white mb-0 fw-bold">©2025 Pizza's Food</p>
            </footer>
        </div>
        <!--FIM DO FOOTER-->

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
