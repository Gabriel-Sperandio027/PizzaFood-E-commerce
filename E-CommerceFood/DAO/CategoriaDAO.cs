using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_CommerceFood.DAO
{
    // DAO (Data Access Object) responsável por buscar os dados de Categorias.
    // Separei isso aqui para não deixar código de banco misturado com o código da tela (Code Behind).
    public class CategoriaDAO
    {
        // Criamos o método como static para não precisar ficar dando "new CategoriaDAO()" toda vez que precisar usar.
        // Como é apenas uma consulta simples de leitura, facilita a chamada nas páginas.
        public static List<Categorias> ListarCategorias()
        {
            // O bloco 'using'  garante que a conexão com o banco (via Entity Framework)
            // seja aberta e, fechada e descartada da memória assim que a consulta terminar.
            using (pizzafoodEntities ctx = new pizzafoodEntities())
            {
                // O Entity Framework faz o "SELECT * FROM Categorias" 
                // e já converte o resultado em uma lista de objetos pra eu usar no C#.
                return ctx.Categorias.ToList();
            }
        }
    }
}