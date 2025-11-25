<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcessoNegado.aspx.cs" Inherits="E_CommerceFood.AcessoNegado" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acesso Negado</title>

    <!--Página criada com o propósito de se um usuário sem permissão tnetar acessar a área destinada para os admin's ser redirecionado para essa página de acesso negado-->
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
            background-color: #f8d7da;
            color: #721c24;
        }
        .container {
            background-color: #f5c6cb;
            display: inline-block;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        a {
            display: block;
            margin-top: 20px;
            color: #721c24;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Acesso Negado</h1>
        <p>Você não tem permissão para acessar esta área.</p>
        <a href="FrmLogin.aspx">Voltar para Login</a>
    </div>
</body>
</html>
