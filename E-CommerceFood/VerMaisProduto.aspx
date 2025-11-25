<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerMaisProduto.aspx.cs" Inherits="E_CommerceFood.VerMaisProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Visualização de Produto</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <!-- NAVBAR-->
        <section>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand fw-bold" href="Default.aspx">Pizza's Food</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="#navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    </div>
                </div>
            </nav>
        </section>
        <!--FIM DO NAVBAR-->

        <!--Ao clicar no botão Ver Mais é redirecionado para a página com todos os detalhes do produto-->
        <section>
            <div class="container mt-5">
                <div class="card shadow">
                    <div class="row g-0">
                        <div class="col-md-5">
                            <asp:Image ID="imgProduto" runat="server" CssClass="img-fluid rounded-start"></asp:Image>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h3 class="card-title">
                                    <asp:Label ID="lblNome" runat="server"></asp:Label></h3>
                                <p class="card-text mt-3">
                                    <asp:Label ID="lblDescricao" runat="server"></asp:Label></p>
                                <h4 class="text-success mt-3">
                                    <asp:Label ID="lblPreco" runat="server"></asp:Label></h4>

                                <a href="Default.aspx" class="btn btn-danger fw-bold">Voltar</a>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--FIM DO DETALHE DO PRODUTO-->

        <!--FOOTER-->
        <section>
            <div class="container">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Início</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Sobre Nós</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Equipe</a></li>
                    </ul>
                    <p class="text-center text-body-secondary">
                        &copy;2025 Pizza's Food

                    </p>
                </footer>
            </div>
        </section>
        <!--FIM DO FOOTER-->

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

