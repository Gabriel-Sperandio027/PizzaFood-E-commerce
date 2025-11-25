<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmUsuarios.aspx.cs" Inherits="E_CommerceFood.FrmUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cadastro de Usuário</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>

    <!-- NAVBAR-->
    <section class="mb-3">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="FrmLogin.aspx">Pizza's Food</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                </div>
            </div>
        </nav>
    </section>
    <!--FIM DO NAVBAR-->


    <!--Formulário de Cadastro de usuário-->
    <main class="px-3">
        <form id="formUser" runat="server" class="frm-usuario">
            <h1 class="text-center">Cadastro de Usuário</h1>
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
            </select>


            <p>
                <asp:Button Text="Cadastrar Usuário" runat="server" CssClass="btn btn-success fw-bold" OnClick="btnCadastrar_Click" />
                <asp:Button ID="btnLimparCampos" Text="Limpar Campos" runat="server" CssClass="btn btn-danger fw-bold" OnClick="btnLimparCampos_Click" />
            </p>

            <p>
                <label id="lblMensagem" runat="server"></label>
            </p>
        </form>
    </main>

    <script src="js/bootstrap.bundle.js"></script>

</body>
</html>
