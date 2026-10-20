CREATE TABLE posts (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
    description TEXT,
    author VARCHAR(255) NOT NULL,
	body JSONB NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);

---------------------------------------
/* 
Função e gatilho para atualização automática do campo updated_at na tabela
posts.
*/

CREATE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER posts_updated_at
BEFORE UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

---------------------------------------

-- POSTs padrões
INSERT INTO posts (title, description, author, body)
VALUES
(
    'Introdução ao PostgreSQL',
    'Conheça o PostgreSQL, um sistema gerenciador de banco de dados relacional de código aberto, reconhecido por sua confiabilidade, flexibilidade e recursos avançados.',
    'Guilherme Pedroso',
    '[
        {
            "type": "lead-paragraph",
            "content": "Conheça o PostgreSQL, um sistema gerenciador de banco de dados relacional de código aberto, reconhecido por sua confiabilidade, flexibilidade e recursos avançados."
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "subtitle",
            "content": "O que é PostgreSQL?"
        },
        {
            "type": "paragraph",
            "content": "O PostgreSQL é um banco de dados objeto-relacional que permite armazenar, consultar e manipular informações utilizando SQL. Ele oferece recursos como transações, integridade referencial, extensões e suporte a documentos JSON."
        },
        {
            "type": "image",
            "content": {
                "url": "https://www.postgresql.org/media/img/about/press/elephant.png",
                "alt": "Símbolo visual do PostgreSQL",
                "caption": "O elefante é o símbolo tradicional do PostgreSQL."
            }
        },
        {
            "type": "subtitle",
            "content": "Principais vantagens"
        },
        {
            "type": "paragraph",
            "content": "O PostgreSQL oferece recursos que o tornam adequado para aplicações de diferentes tamanhos e complexidades."
        },
        {
            "type": "list",
            "content": {
                "ordered": false,
                "items": [
                    "É um software de código aberto.",
                    "Oferece suporte a transações e propriedades ACID.",
                    "Permite armazenar e consultar dados JSONB.",
                    "Possui mecanismos de controle de acesso e permissões.",
                    "Suporta índices e consultas complexas."
                ]
            }
        },
        {
            "type": "quote",
            "content": {
                "text": "A escolha de um banco de dados deve considerar os requisitos da aplicação, a consistência dos dados e as necessidades de manutenção.",
                "author": "Equipe de desenvolvimento"
            }
        },
        {
            "type": "tip",
            "content": {
                "title": "Dica",
                "text": "Antes de criar índices, analise as consultas mais frequentes da aplicação e utilize EXPLAIN para entender como o PostgreSQL executa cada consulta."
            }
        },
        {
            "type": "warning",
            "content": {
                "title": "Atenção",
                "text": "Utilizar um banco de dados confiável não elimina a necessidade de backups periódicos e testes de restauração."
            }
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "paragraph",
            "content": "O PostgreSQL é uma opção versátil para projetos que precisam de confiabilidade, recursos avançados e flexibilidade no armazenamento de dados."
        }
    ]'::jsonb
),
(
    'Fundamentos do JavaScript',
    'JavaScript é uma linguagem de programação amplamente utilizada no desenvolvimento web, permitindo criar interfaces interativas e aplicações que executam tanto no navegador quanto no servidor.',
    'Guilherme Pedroso',
    '[
        {
            "type": "lead-paragraph",
            "content": "JavaScript é uma linguagem de programação amplamente utilizada no desenvolvimento web, permitindo criar interfaces interativas e aplicações que executam tanto no navegador quanto no servidor."
        },
        {
            "type": "subtitle",
            "content": "O que é JavaScript?"
        },
        {
            "type": "paragraph",
            "content": "JavaScript é uma linguagem de programação multiparadigma, com suporte a programação orientada a objetos, funcional e imperativa. No navegador, ela permite manipular elementos HTML, responder a eventos e atualizar o conteúdo das páginas."
        },
        {
            "type": "image",
            "content": {
                "url": "https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png",
                "alt": "Logotipo do JavaScript",
                "caption": "O JavaScript é uma das principais tecnologias utilizadas no desenvolvimento web."
            }
        },
        {
            "type": "subtitle",
            "content": "Onde a linguagem pode ser utilizada?"
        },
        {
            "type": "paragraph",
            "content": "Com o ecossistema JavaScript, é possível desenvolver diferentes partes de uma aplicação utilizando a mesma linguagem."
        },
        {
            "type": "list",
            "content": {
                "ordered": true,
                "items": [
                    "Desenvolver interfaces interativas para páginas web.",
                    "Criar APIs e servidores com Node.js.",
                    "Construir aplicações com bibliotecas como React.",
                    "Implementar validações e regras de negócio.",
                    "Automatizar tarefas de desenvolvimento."
                ]
            }
        },
        {
            "type": "quote",
            "content": {
                "text": "Aprender uma linguagem de programação envolve compreender seus conceitos e praticar a resolução de problemas.",
                "author": "Equipe de desenvolvimento"
            }
        },
        {
            "type": "tip",
            "content": {
                "title": "Dica para iniciantes",
                "text": "Pratique variáveis, funções, arrays e objetos antes de avançar para bibliotecas e frameworks. Esses fundamentos aparecem constantemente em projetos reais."
            }
        },
        {
            "type": "warning",
            "content": {
                "title": "Atenção",
                "text": "Não confie exclusivamente nas validações executadas no navegador. Dados recebidos pelo servidor também precisam ser validados."
            }
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "subtitle",
            "content": "Conclusão"
        },
        {
            "type": "paragraph",
            "content": "O JavaScript oferece uma base sólida para quem deseja trabalhar com desenvolvimento web. Com prática e domínio dos fundamentos, fica mais fácil aprender ferramentas como React e Express."
        }
    ]'::jsonb
),
(
    'Boas práticas para desenvolver APIs REST',
    'Desenvolver uma API REST vai além de criar rotas e retornar dados. Uma boa API precisa oferecer consistência, validação, segurança e respostas previsíveis para seus consumidores.',
    'Guilherme Pedroso',
    '[
        {
            "type": "lead-paragraph",
            "content": "Desenvolver uma API REST vai além de criar rotas e retornar dados. Uma boa API precisa oferecer consistência, validação, segurança e respostas previsíveis para seus consumidores."
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "subtitle",
            "content": "Organize os recursos"
        },
        {
            "type": "paragraph",
            "content": "Uma API REST normalmente representa seus recursos por meio de URLs e utiliza métodos HTTP para indicar as operações desejadas. Por exemplo, um recurso chamado posts pode ser acessado por meio de uma rota como /posts."
        },
        {
            "type": "image",
            "content": {
                "url": "https://upload.wikimedia.org/wikipedia/commons/6/64/Expressjs.png",
                "alt": "Logotipo do Express.js",
                "caption": "Express.js é um framework utilizado para desenvolver aplicações web e APIs com Node.js."
            }
        },
        {
            "type": "subtitle",
            "content": "Utilize os métodos HTTP adequadamente"
        },
        {
            "type": "paragraph",
            "content": "Cada método HTTP possui uma finalidade. Utilizá-los de maneira consistente facilita a compreensão e a manutenção da API."
        },
        {
            "type": "list",
            "content": {
                "ordered": false,
                "items": [
                    "GET: consultar recursos.",
                    "POST: criar recursos.",
                    "PUT: substituir um recurso existente.",
                    "PATCH: atualizar parcialmente um recurso.",
                    "DELETE: remover um recurso."
                ]
            }
        },
        {
            "type": "subtitle",
            "content": "Trate erros de maneira consistente"
        },
        {
            "type": "paragraph",
            "content": "Uma API deve retornar códigos HTTP apropriados e mensagens que ajudem o consumidor a compreender o resultado da requisição. Erros inesperados devem ser registrados no servidor sem expor informações internas sensíveis."
        },
        {
            "type": "quote",
            "content": {
                "text": "Uma API bem projetada deve ser previsível para quem a utiliza e fácil de manter para quem a desenvolve.",
                "author": "Equipe de desenvolvimento"
            }
        },
        {
            "type": "tip",
            "content": {
                "title": "Dica",
                "text": "Centralize o tratamento de erros no Express quando isso fizer sentido para a arquitetura do projeto. Assim, você reduz a duplicação de código e padroniza as respostas."
            }
        },
        {
            "type": "warning",
            "content": {
                "title": "Segurança",
                "text": "Nunca exponha senhas, tokens, credenciais de banco de dados ou detalhes internos de exceções nas respostas enviadas aos clientes."
            }
        },
        {
            "type": "subtitle",
            "content": "Valide os dados recebidos"
        },
        {
            "type": "paragraph",
            "content": "Valide parâmetros de rota, query strings e corpos das requisições antes de executar operações no banco de dados. Também utilize consultas parametrizadas para reduzir o risco de injeção de SQL."
        },
        {
            "type": "list",
            "content": {
                "ordered": true,
                "items": [
                    "Verifique os campos obrigatórios.",
                    "Valide os tipos e formatos dos dados.",
                    "Confira os limites de tamanho dos valores recebidos.",
                    "Utilize consultas parametrizadas.",
                    "Implemente autenticação e autorização quando necessário."
                ]
            }
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "paragraph",
            "content": "Seguindo essas práticas, você poderá desenvolver APIs mais seguras, organizadas e previsíveis, facilitando sua integração com aplicações frontend e outros serviços."
        }
    ]'::jsonb
);


