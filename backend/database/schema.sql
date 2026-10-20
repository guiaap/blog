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

-- POST padrão
INSERT INTO posts (title, description, author, body)
VALUES (
    'Introdução ao PostgreSQL',
    'O PostgreSQL é um poderoso sistema gerenciador de banco de dados relacional, conhecido por sua confiabilidade, extensibilidade e conformidade com padrões SQL.',
    'Guilherme Pedroso',
    '[
        {
            "type": "lead-paragraph",
            "content": "O PostgreSQL é um poderoso sistema gerenciador de banco de dados relacional, conhecido por sua confiabilidade, extensibilidade e conformidade com padrões SQL."
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "subtitle",
            "content": "1. O que é PostgreSQL?"
        },
        {
            "type": "paragraph",
            "content": "O PostgreSQL é um sistema gerenciador de banco de dados objeto-relacional de código aberto. Ele permite armazenar, consultar e manipular dados utilizando SQL, além de oferecer recursos avançados para aplicações modernas."
        },
        {
            "type": "image",
            "content": {
                "url": "https://www.postgresql.org/media/img/about/press/elephant.png",
                "alt": "Elefante, símbolo visual do PostgreSQL",
                "caption": "O elefante é o símbolo tradicional do PostgreSQL."
            }
        },
        {
            "type": "subtitle",
            "content": "2. Principais características"
        },
        {
            "type": "paragraph",
            "content": "Entre os recursos oferecidos pelo PostgreSQL, podemos destacar:"
        },
        {
            "type": "list",
            "content": {
                "ordered": false,
                "items": [
                    "Suporte a transações e propriedades ACID.",
                    "Integridade referencial por meio de chaves estrangeiras.",
                    "Armazenamento de documentos JSON e JSONB.",
                    "Suporte a índices e consultas complexas.",
                    "Extensibilidade por meio de funções e extensões."
                ]
            }
        },
        {
            "type": "subtitle",
            "content": "3. Exemplo de consulta SQL"
        },
        {
            "type": "paragraph",
            "content": "Podemos utilizar uma consulta SELECT para recuperar os artigos armazenados na tabela posts."
        },
        {
            "type": "code",
            "content": {
                "language": "sql",
                "code": "SELECT id, title, created_at FROM posts ORDER BY created_at DESC;"
            }
        },
        {
            "type": "quote",
            "content": {
                "text": "Um bom banco de dados deve oferecer confiabilidade, consistência e flexibilidade para atender às necessidades da aplicação.",
                "author": "Equipe de desenvolvimento"
            }
        },
        {
            "type": "tip",
            "content": {
                "title": "Dica",
                "text": "Utilize JSONB quando precisar armazenar documentos JSON com suporte a operadores e indexação do PostgreSQL."
            }
        },
        {
            "type": "warning",
            "content": {
                "title": "Atenção",
                "text": "Embora JSONB seja flexível, valide a estrutura dos dados na aplicação. O tipo JSONB, por si só, não garante que cada bloco tenha as propriedades esperadas."
            }
        },
        {
            "type": "subtitle",
            "content": "4. Consultando dados JSONB"
        },
        {
            "type": "paragraph",
            "content": "Como o conteúdo do artigo está armazenado em JSONB, podemos consultar os blocos diretamente no PostgreSQL. Por exemplo, a consulta abaixo recupera o conteúdo completo do primeiro bloco."
        },
        {
            "type": "code",
            "content": {
                "language": "sql",
                "code": "SELECT body -> 0 AS primeiro_bloco FROM posts WHERE title = ''Introdução ao PostgreSQL'';"
            }
        },
        {
            "type": "list",
            "content": {
                "ordered": true,
                "items": [
                    "O banco de dados armazena o conteúdo do artigo.",
                    "A aplicação Node.js recupera os dados por meio de uma consulta SQL.",
                    "O React percorre o array de blocos.",
                    "Cada componente renderiza o conteúdo correspondente ao seu tipo."
                ]
            }
        },
        {
            "type": "divider",
            "content": null
        },
        {
            "type": "paragraph",
            "content": "Com essa abordagem, podemos criar artigos com diferentes estruturas sem precisar desenvolver um componente de página exclusivo para cada publicação."
        }
    ]'::jsonb
);
