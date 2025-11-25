<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="E_CommerceFood.FrmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../css/style.css" rel="stylesheet" />
</head>
<body style="background: url('../img/fundo-login.jpg') no-repeat center center; background-size: cover; background-attachment: fixed;">
    <form id="form1" runat="server">

        <!-- NAVBAR-->
  <section>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="Default.aspx">Pizza's Food</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              
            </div>
        </div>
    </nav>
</section>
        <!--FIM DO NAVBAR-->

        <main class="d-flex justify-content-center align-items-center vh-100" background-size: cover;">
            <!--LOGIN-->
            <section>
   <div class="p-4 rounded shadow login-box">
    <h3 class="text-center mb-4">Acesse sua conta</h3>

    <div class="text-center mt-5">

    </div>

    <div class="form-group mb-3">
        <label for="txtLogin" class="fw-bold">Login</label>
        <input runat="server" id="txtLogin" class="form-control input-pequeno" />
        <small class="form-text text-white fw-bold">Nunca compartilhe seu login com ninguém!</small>
    </div>
    <div class="form-group mb-3">
        <label for="txtSenha" class="fw-bold">Senha</label>
        <input runat="server" id="txtSenha" type="password" class="form-control input-pequeno" />
    </div>
    <div class="form-group form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1" />
        <label class="form-check-label fw-bold" for="exampleCheck1">Lembrar-me</label>
    </div>
    <asp:Button ID="btnLogin" Text="Acessar" runat="server" CssClass="btn btn-primary fw-bold" OnClick="btnLogin_Click" />

    <p class="text-center mt-3 text-white fw-bold">
        Não tem conta? 
        <a href="FrmUsuarios.aspx" class="text-info fw-bold">Faça seu cadastro aqui</a>.
    </p>
       <asp:Label ID="lblMensagem" runat="server" CssClass="text-danger fw-bold mt-2 d-block" />
</div>
            </section>
            <!--FIM DO LOGIN-->
        </main>

        <section>
            <!--FOOTER-->
            <div class="container" id="footer-dark">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                         <li class="nav-item"><a href="#" class="nav-link px-2 text-body-white">Início</a></li>
 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-white">Sobre Nós</a></li>
 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-white">Equipe</a></li>
                    </ul>
                    <p class="text-center">© 2025 Pizza's Food</p>
                </footer>
            </div>
            <!--FIM DO FOOTER-->
        </section>


    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
 window.onload = function () {
     alert("Atenção! O primeiro cadastro criado no sistema deve ser o ADMIN.");
 };
    </script>

</body>
</html>
