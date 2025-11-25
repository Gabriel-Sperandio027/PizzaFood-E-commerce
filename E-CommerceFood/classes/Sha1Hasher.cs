using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace E_CommerceFood
{
    // Classe utilitária pra criptografar as senhas antes de salvar no banco.
    // É uma medida de segurança básica pra não deixar a senha em texto puro (plain text) na tabela.
    public class Sha1Hasher
    {
        public static string ComputeSha1Hash(string input)
        {
            // O using aqui garante que o objeto de criptografia libere a memória do Windows assim que terminar
            using (SHA1Managed sha1 = new SHA1Managed())
            {
                // Criptografia trabalha com bits, então converto a string da senha pra um array de bytes
                byte[] inputBytes = Encoding.UTF8.GetBytes(input);

                // Aqui a mágica acontece: ele embaralha os bytes gerando o hash
                byte[] hashBytes = sha1.ComputeHash(inputBytes);

                // Agora preciso transformar esse hash (que é um monte de bytes ilegíveis)
                // numa string hexadecimal limpa pra gente conseguir salvar no banco de dados
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hashBytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }
    }
}