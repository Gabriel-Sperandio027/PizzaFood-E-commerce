<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmProdutos.aspx.cs" Inherits="E_CommerceFood.admin.FrmProdutos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gerenciamento dos Produtos</title>

    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link href="../css/style.css" rel="stylesheet" />

</head>

<body>
    <!-- NAVBAR-->
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

                                <li>
                                    <a href="DefaultAdmin.aspx" class="nav-link text-white fw-bold">
                                        <img src="../img/inicio-icon.svg" alt="Logo Início" />
                                        Início
                                    </a>
                                </li>

                                <li>
                                    <a href="#" target="iframeConteudo" class="nav-link text-white fw-bold">
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

    <!--Gerenciador de Produtos-->
    <main class="px-3" style="margin-top: 100px;">
        <h1 class="ttl-produtos">Gerenciamento dos Produtos</h1>

        <form id="form1" runat="server" class="frm-cadastro">
            <div class="frm-txt">
                <div>
                    <div>
                        <div>
                            <input type="hidden" id="txtId" runat="server" />
                            <label>Nome do Produto</label>
                            <span class="required text-danger">*</span>
                        </div>
                        <div>
                            <input type="text" id="txtNome" runat="server" />

                        </div>

                        <div>
                            <label>Descrição</label>
                            <span class="required text-danger">*</span>
                        </div>
                        <div>
                            <textarea runat="server" id="txtDescricao" rows="3"></textarea>

                        </div>
                    </div>

                    <div>
                        <label>Caminho da Imagem</label>
                        <span class="required text-danger">*</span>
                    </div>

                    <div>
                        <asp:FileUpload ID="fuImagem" runat="server" CssClass="form-control form-control-custom-width-2" />
                        <asp:TextBox ID="txtImagem" runat="server" CssClass="form-control form-control-custom-width" ReadOnly="true" />
                    </div>

                    <div>
                        <label>Preço</label>
                        <span class="required text-danger">*</span>
                    </div>

                    <div>
                        <input type="text" id="txtPreco" runat="server" />
                    </div>

                    <div>
                        <label for="categoria">Escolha a categoria</label>
                        <span class="required text-danger">*</span>

                        <asp:DropDownList
                            ID="ddlCategoria"
                            runat="server" Width="120px"
                            CssClass="form-control">
                        </asp:DropDownList>

                        <div>
                            <label>Quantidade no Estoque</label>
                            <span class="required text-danger">*</span>
                        </div>
                        <div>
                            <input type="text" id="txtEstoque" runat="server" />
                        </div>
                    </div>


                    <p class="btn-container">
                        <asp:Button ID="btnCadastrar" runat="server" CssClass="btn btn-success" Text="Cadastrar" OnClick="btnCadastrar_Click" />

                        <asp:Button ID="btnLimparCampos" runat="server" CssClass="btn btn-danger fw-bold" Text="Limpar Campos" OnClick="btnLimpar_Click" />

                        <asp:Button ID="btnAlterarProduto" Text="Alterar Produto" runat="server" CssClass="btn btn-success fw-bold" Visible="false" OnClick="btnAlterarProduto_Click" />

                    </p>

                    <p>
                        <a href="FrmProdutos.aspx"
                            id="btnAddProduto"
                            runat="server"
                            visible="false"
                            class="btn btn-primary">Adicionar Produto
                        </a>
                    </p>

                    <p>
                        <label id="lblMensagem" runat="server"></label>
                    </p>

                </div>


                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nome do Produto</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Preço</th>
                            <th scope="col">Data do Cadastro</th>
                            <th scope="col">Disponibilidade</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>

                    <asp:ListView runat="server" ID="lvProdutos" OnItemCommand="lvProdutos_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <th scope="row"><%#Eval("Id") %>#</th>
                                <td><%# Eval("Nome") %></td>
                                <td><%# Eval("CategoriaId") %></td>
                                <td><%#Eval("Preco")%></td>
                                <td><%#Eval("DataCadastro")%></td>
                                <td>
                                    <span class='<%# Eval("Disponibilidade").ToString() == "Em estoque" ? "em-estoque" : "esgotado" %>'>
                                        <%# Eval("Disponibilidade") %>
                                    </span>
                                </td>
                                <td>
                                    <asp:ImageButton ImageUrl="../img/view.svg" runat="server"
                                        CommandName="Visualizar"
                                        CommandArgument='<%# Eval("Id")%>'
                                        AlternateText="Visualizar Produto" />

                                    <asp:ImageButton ImageUrl="../img/edit.svg" runat="server"
                                        CommandName="Editar"
                                        CommandArgument='<%# Eval("Id") %>'
                                        AlternateText="Editar Produto" />

                                    <asp:ImageButton ImageUrl="../img/delete.svg" runat="server"
                                        CommandName="Deletar"
                                        CommandArgument='<%# Eval("Id") %>'
                                        AlternateText="Deletar Produto" />
                                </td>

                            </tr>
                        </ItemTemplate>
                    </asp:ListView>

                </table>
    </main>
    </form>

 <div class="container-fluid bg-dark text-white mt-5">
     <footer class="py-3 my-4">
         <p class="text-center text-white mb-0 fw-bold">©2025 Pizza's Food</p>
     </footer>
 </div>
    <!--FIM DO FOOTER-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
