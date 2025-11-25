using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_CommerceFood.Security;

namespace E_CommerceFood.admin
{
    public partial class FrmProdutos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {// Verifica se o usuário tem acesso de administrador
            VerificacaoAcesso.VerificarAcessoAdmin(this);
            // Carrega a lista de produtos apenas na primeira carga da página
            if (!Page.IsPostBack)
            {// Carrega a lista de produtos no ListView
                AtualizarLvProdutos(ProdutoDAO.ListarProdutos());
                // Verifica se há um código de produto na query string para visualização
                string cod = Request.QueryString["cod"];
                if (cod != null)
                {// Carrega os dados do produto para visualização
                    int id = int.Parse(cod);
                    Produtos produto = ProdutoDAO.VisualizarProdutos(id);
                    MostrarDadosProdutos(produto, true);
                }
                CarregarCategorias();
                // Define o nome do usuário na barra de navegação
                if (Session["NomeUsuario"] != null)
                {
                    lblNomeUsuario.InnerText = "Olá, " + Session["NomeUsuario"].ToString();
                }

            }

        }
        // Carrega as categorias no DropDownList
        private void CarregarCategorias()
        {
            // Usamos o Entity Framework diretamente aqui para carregar as categorias
            using (var db = new pizzafoodEntities())
            {
                // Consulta para obter todas as categorias ordenadas por nome
                var categorias = db.Categorias
                                   .OrderBy(c => c.NomeCategoria)
                                   .ToList();
                // Define a fonte de dados do DropDownList
                ddlCategoria.DataSource = categorias;
                ddlCategoria.DataTextField = "NomeCategoria";  
                ddlCategoria.DataValueField = "IdCategoria"; 
                ddlCategoria.DataBind();
            }
            // Adiciona um item padrão no início da lista
            ddlCategoria.Items.Insert(0, new ListItem("Selecione...", ""));
        }
        // Manipulador do evento de clique do botão Cadastrar
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {// Verifica se estamos alterando ou cadastrando um novo produto
            bool alterando = btnCadastrar.Text == "Alterar";
            Produtos produto = null;
            // Se não estiver alterando, cria um novo objeto Produtos
            if (!alterando)
            {
                produto = new Produtos();
                produto.DataCadastro = DateTime.Now;
            }
            // Se estiver alterando, busca o produto existente pelo ID
            else
            {
                int id = Int32.Parse(txtId.Value);
                produto = ProdutoDAO.VisualizarProdutos(id);
            }

            // Preenche os dados do produto com os valores do formulário           
            produto.Nome = txtNome.Value;
            produto.Descricao = txtDescricao.Value;
            produto.Preco = Convert.ToDecimal(txtPreco.Value);
            produto.CategoriaId = int.Parse(ddlCategoria.SelectedValue);

            produto.Estoque = Convert.ToInt32(txtEstoque.Value);
            

            //Upload da imagem
            if (fuImagem.HasFile)
            {
                string pasta = Server.MapPath("~/img/");
                string nomeArquivo = Path.GetFileName(fuImagem.FileName);
                string caminhoCompleto = Path.Combine(pasta, nomeArquivo);

                // Salva o arquivo na pasta /img/
                fuImagem.SaveAs(caminhoCompleto);

                // Caminho relativo para o banco
                produto.Imagem = "img/" + nomeArquivo;

                // Mostra o nome do arquivo no campo txtImagem (opcional)
                txtImagem.Text = produto.Imagem;
            }
            else if (!alterando)
            {
                // Se for cadastro novo e não tiver imagem, define uma padrão
                produto.Imagem = "img/sem-imagem.jpg";
            }

            string mensagem = "";
            // Chama o método adequado do DAO
            if (!alterando)
            {
                mensagem = ProdutoDAO.CadastrarProduto(produto);
            }
            // Se estiver alterando, chama o método de alteração
            else
            {
                mensagem = ProdutoDAO.AlterarProdutos(produto);
                Response.Redirect("~/admin/FrmProdutos.aspx");
            }
            LimparCampos(mensagem);
            AtualizarLvProdutos(ProdutoDAO.ListarProdutos());
        }
        // Atualiza o ListView com a lista de produtos
        private void AtualizarLvProdutos(List<Produtos> produtos)
        {// Ordena os produtos por nome antes de exibir
            var lista = produtos.OrderBy(p => p.Nome);
            lvProdutos.DataSource = lista;
            lvProdutos.DataBind();
        }

        // Limpa os campos do formulário
        private void LimparCampos(string mensagem)
        {
            lblMensagem.InnerText = mensagem;
            txtDescricao.Value = "";
            txtImagem.Text = "";
            txtNome.Value = "";
            txtPreco.Value = "";
            ddlCategoria.SelectedIndex = 0;
            txtEstoque.Value = "";
            
        }
        // Manipulador do evento de comando do ListView
        protected void lvProdutos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {// Obtém o comando e o ID do produto a partir do evento
            string comando = e.CommandName;
            int id = Convert.ToInt32(e.CommandArgument);
            // Executa a ação correspondente ao comando
            if (comando == "Deletar")
            {
                //Iremos excluir o Produto
                string mensagem = ProdutoDAO.ExcluirProduto(id);
                AtualizarLvProdutos(ProdutoDAO.ListarProdutos());
                lblMensagem.InnerText = mensagem;
            }

            // Se o comando for Visualizar, redireciona para a página de visualização
            else if (comando == "Visualizar")
            {
                Response.Redirect("~/admin/FrmProdutos.aspx?cod=" + id);
            }
            // Se o comando for Editar, carrega os dados do produto para edição
            else if (comando == "Editar")
            {
                Produtos produto = ProdutoDAO.VisualizarProdutos(id);
                MostrarDadosProdutos(produto, false);
                txtId.Value = id.ToString();
            }
        }

        // Mostra os dados do produto nos campos do formulário
        private void MostrarDadosProdutos(Produtos produto, bool visualizar)
        {// Preenche os campos com os dados do produto
            txtDescricao.Value = produto.Descricao;
            txtNome.Value = produto.Nome;
            txtImagem.Text = produto.Imagem;
            txtPreco.Value = produto.Preco.ToString();
            ddlCategoria.SelectedValue = produto.CategoriaId.ToString();
            btnAddProduto.Visible = true;
            txtEstoque.Value = produto.Estoque.ToString();  
            if (visualizar)
            {
                Visualizar();
            }
            else
            {
                Alterar();
            }
        }
        // Configura a interface para alteração de produto
        private void Alterar()
        {
            btnCadastrar.Text = "Alterar";
            txtDescricao.Disabled = false;
            txtNome.Disabled = false;
            fuImagem.Enabled = true;
            // Desabilita o campo de texto que mostra o caminho da imagem
            txtImagem.Enabled = true;
            ddlCategoria.Enabled = false;
            txtPreco.Disabled = false;
            txtEstoque.Disabled = false;
            
            btnCadastrar.Visible = false;
            btnAlterarProduto.Visible = true;
            btnLimparCampos.Visible = false;
            btnLimparCampos.Visible = false;
            

        }

        // Configura a interface para visualização de produto
        private void Visualizar()
        {
            txtDescricao.Disabled = true;
            txtNome.Disabled = true;
            ddlCategoria.Enabled = false;
            txtPreco.Disabled = true;
            // Desabilita o campo de texto que mostra o caminho da imagem
            txtImagem.Enabled = false;
            txtEstoque.Disabled = true;
           

            // Desabilita o controle de upload de arquivo
            fuImagem.Enabled = false;
            btnCadastrar.Visible = false;
            btnLimparCampos.Visible = false;
            btnLimparCampos.Visible = false;
            btnAddProduto.InnerText = "Voltar ao Cadastro";
        }
        // Manipulador do evento de clique do botão Limpar
        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparCampos("Campos Limpos com sucesso!");
        }

        // Manipulador do evento de clique do botão Alterar Produto
        protected void btnAlterarProduto_Click(object sender, EventArgs e)
        {// Obtém o ID do produto a ser alterado
            int id = int.Parse(txtId.Value);
            Produtos produto = ProdutoDAO.VisualizarProdutos(id);

            // Atualiza os dados do produto com os valores do formulário
            produto.Nome = txtNome.Value;
            produto.Descricao = txtDescricao.Value;
            produto.Preco = Convert.ToDecimal(txtPreco.Value);
            produto.Estoque = Convert.ToInt32(txtEstoque.Value);

            // Atualiza a imagem se houver novo upload
            if (fuImagem.HasFile)
            {
                string pasta = Server.MapPath("~/img/");
                string nomeArquivo = Path.GetFileName(fuImagem.FileName);
                string caminhoCompleto = Path.Combine(pasta, nomeArquivo);
                fuImagem.SaveAs(caminhoCompleto);
                produto.Imagem = "img/" + nomeArquivo;
            }
            // Chama o método de alteração do DAO
            string mensagem = ProdutoDAO.AlterarProdutos(produto);

            // Exibe a mensagem de sucesso ou erro
            lblMensagem.InnerText = mensagem;
            AtualizarLvProdutos(ProdutoDAO.ListarProdutos());
            LimparCampos("Produto alterado com sucesso!");
        }


    }
}