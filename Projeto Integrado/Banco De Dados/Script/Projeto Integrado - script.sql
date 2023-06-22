-- Projeto Integrado --
-- Nome e matricula, respectivamente: --
-- Matheus Endlich Silveira, 202305392. --
-- Maria Luiza Franzotti Loureiro de Melo, 202305413. --
-- João Henrique Alves Silva, 202305582. --
-- Marcos Vinicius Silva Torres, 202305406.--

-- Criando a tabela diploma --

CREATE TABLE diplomas (
                curso 		VARCHAR(255) NOT NULL,
                local_de_estudo VARCHAR(512) NOT NULL,
                nivel 		VARCHAR(255) NOT NULL,
                area_do_estudo 	VARCHAR(255) NOT NULL,
                complemento 	VARCHAR(512),
                status 		VARCHAR(255) NOT NULL,
                CONSTRAINT diplomas_pk PRIMARY KEY (curso)
);

-- Comentando na tabela diploma --

COMMENT ON TABLE diplomas 			IS 
'Tabela que representa o diploma dos funcionarios.';
COMMENT ON COLUMN diplomas.curso 		IS 
'Representa o Nome do curso que a pessoa pode ser formada.';
COMMENT ON COLUMN diplomas.local_de_estudo 	IS 
'Representa o local onde o curso foi realizado.';
COMMENT ON COLUMN diplomas.nivel 		IS 
'Representa o nivel do diploma que ele possui. Esse atributo possui uma checagem onde so permite receber: "Bacharelado", "Mestrado", "Doutorado" e outros mas seguindo o mesmo conceito.';
COMMENT ON COLUMN diplomas.area_do_estudo 	IS 
'Atributo que representa a area que o curso pertence. Ele possui uma restrição de so poder receber: "Humanas", "Exatas" e outros semelhantes.';
COMMENT ON COLUMN diplomas.complemento 		IS 
'Atributo que representa o complemento do curso.';
COMMENT ON COLUMN diplomas.status 		IS 
'Representa o status do curso. Esse atributo possui uma condição que so pode receber valores de: "Cursando", "Largado" e "Finalizado".';

-- Criando as constantes de checagem da tabela diploma --

-- Constante que limita so permite receber: "Bacharelado", "Mestrado", "Doutorado" e outros mas seguindo o mesmo conceito. --
ALTER TABLE diplomas
ADD CONSTRAINT diploma_nivel
CHECK (nivel = 'Mestrado' 			 OR 
       nivel = 'Bacharelado'   			 OR 
       nivel = 'Doutorado' 			 OR 
       nivel = 'Especialização' 		 OR 
       nivel = 'Pós-graduação' 			 OR 
       nivel = 'Técnico' 			 OR 
       nivel = 'Tecnólogo' 			 OR 
       nivel = 'Ensino Médio' 			 OR 
       nivel = 'Ensino Fundamental'		 OR 
       nivel = 'Curso Profissionalizante' 	 OR 
       nivel = 'Certificação Profissional'	 OR 
       nivel = 'MBA'
);

-- Constante que limita so poder receber: "Humanas", "Exatas" e outros semelhantes. --

ALTER TABLE diplomas
ADD CONSTRAINT diploma_area_do_estudo
CHECK (area_do_estudo = 'Ciências Humanas'    OR
       area_do_estudo = 'Ciências Exatas'     OR
       area_do_estudo = 'Ciências Sociais'    OR
       area_do_estudo = 'Ciências Biológicas' OR
       area_do_estudo = 'Ciências da Saúde'   OR
       area_do_estudo = 'Ciências Agrárias'   OR
       area_do_estudo = 'Ciências Ambientais' OR
);

-- Constante que limita so pode receber valores de: "Cursando", "Largado" e "Finalizado".';

ALTER TABLE diplomas
ADD CONSTRAINT diploma_status
CHECK ( status = 'Cursando'    	OR 
	status = 'Largado'   	OR
	status = 'Finalizado'
);

-- Criando a tabela cargo --

CREATE TABLE cargo (
                cargo 			VARCHAR(255) NOT NULL,
                departamento 		VARCHAR      NOT NULL,
                nivel hierarquico 	VARCHAR(255) NOT NULL,
                permissoes 		VARCHAR(512) NOT NULL,
                requisitos 		VARCHAR      NOT NULL,
                curso 			VARCHAR(255),
                CONSTRAINT cargo_pk PRIMARY KEY (cargo, departamento)
);

-- Comentando na tabela cargo --

COMMENT ON TABLE cargo 				IS 
'Tabela que demonstra cada cargo que o funcionario possui';
COMMENT ON COLUMN cargo.cargo 			IS 
'Representa o cargo do funcionario na empresa fortes e que aparecera no banco de talentos.';
COMMENT ON COLUMN cargo.departamento 		IS 
'representa o departamento que o cargo atua.';
COMMENT ON COLUMN cargo.nivel hierarquico 	IS 
'Representa o nivel de inportancia do cargo com a impresa e departamento.';
COMMENT ON COLUMN cargo.permissoes 		IS 
'Atributo que representa cada permisação que uma pessoa possa ter.';
COMMENT ON COLUMN cargo.requisitos 		IS 
'Os requisitos de qualificação ou experiência necessários para ocupar o cargo.';
COMMENT ON COLUMN cargo.curso 			IS 
'Representa o Nome do curso que a pessoa pode ser formada.';

-- Criando a tabela interesses --

CREATE TABLE interesses (
                interesses_id NUMERIC(38) NOT NULL,
                descricao VARCHAR NOT NULL,
                notificacao_1 VARCHAR(3),
                notificacao_2 VARCHAR(3),
                CONSTRAINT interesses_pk PRIMARY KEY (interesses_id)
);

-- Comentando na tabela interesses --

COMMENT ON TABLE interesses 			IS 
'Tabela que representa os interresses dos funcionarios';
COMMENT ON COLUMN interesses.interesses_id 	IS 
'Atributo que representa o id dos interesses .';
COMMENT ON COLUMN interesses.descricao 		IS 
'Representa a descrição do interesse que um funcionario pode ter.';
COMMENT ON COLUMN interesses.notificacao_1 	IS 
'Atributo que representa a notificação 1. Esse atributo possui uma checagem que so pode receber valores de "Sim" ou "Não".';
COMMENT ON COLUMN interesses.notificacao_2 	IS 
'Atributo que representa a notificação 2. Esse atributo possui uma checagem que so pode receber valores de "Sim" ou "Não".';

-- Criando As contande de checagem na tabela interesses --

-- Criando a contade de chegagem na notificação 1 so pode receber valores de "Sim" ou "Não". --

ALTER TABLE interesses
ADD CONSTRAINT notificacao_1_check
CHECK (notificacao_1 = 'Sim' OR 
       notificacao_1 = 'Não'
);

-- Criando a contade de chegagem na notificação 2 so pode receber valores de "Sim" ou "Não". --

ALTER TABLE interesses
ADD CONSTRAINT notificacao_2_check
CHECK (notificacao_2 = 'Sim' OR 
       notificacao_2 = 'Não'
);

-- Criando a tabela funcionarios --

CREATE TABLE funcionarios (
                funcionario_id 		NUMERIC(38)  NOT NULL,
                nome 			VARCHAR(255) NOT NULL,
                senha 			VARCHAR(512) NOT NULL,
                idioma 			VARCHAR(255) NOT NULL,
                gerente_id 		NUMERIC(38)  NOT NULL,
                gerente_nome 		VARCHAR(255) NOT NULL,
                drescricao 		VARCHAR(512),
                CONSTRAINT funcionarios_pk PRIMARY KEY (funcionario_id, nome)
);

-- Comentando na tabela funcionarios --

COMMENT ON TABLE funcionarios 			IS 
'Tabela que representa os funcionarios na inpresa fortes';
COMMENT ON COLUMN funcionarios.funcionario_id 	IS 
'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN funcionarios.nome 		IS 
'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN funcionarios.senha 		IS 
'Representa a senha de cada funcionario usada na hora de entrar no banco de talentos.';
COMMENT ON COLUMN funcionarios.idioma 		IS 
'Representa o idioma que o funcionario escolheu para o site.';
COMMENT ON COLUMN funcionarios.gerente_id 	IS 
'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN funcionarios.gerente_nome 	IS 
'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN funcionarios.drescricao 	IS 
'Representa a descrição de perfil de cada funcionario.';

-- Criando a tabela posts --

CREATE TABLE posts (
                post_id 	NUMERIC(38)  NOT NULL,
                funcionario_id 	NUMERIC(38)  NOT NULL,
                nome 		VARCHAR(255) NOT NULL,
                assunto 	VARCHAR(255) NOT NULL,
                data_do_post 	DATE         NOT NULL,
                CONSTRAINT posts_pk PRIMARY KEY (post_id)
);

-- Comentando na tabela posts --

COMMENT ON TABLE posts 			IS 
'Tabela que representa os posts realizados pelos funcionarios.';
COMMENT ON COLUMN posts.post_id 	IS 
'Atributo que representa o id do post que vai ser feito.';
COMMENT ON COLUMN posts.funcionario_id 	IS 
'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN posts.nome 		IS 
'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN posts.assunto 	IS 
'Atributo que representa o assunto que vai ser falado no post.';
COMMENT ON COLUMN posts.data_do_post 	IS 
'Atributo que representa o dia que um post foi lançado. Possui uma restrição de validação onde a data do post só pode ser a data atual ou uma data anterior, não permitindo datas futuras.';

-- Criando as constantes de checagem na tabela  --

-- Constante que o post so pode só pode ser a data atual ou uma data anterior, não permitindo datas futuras. --

ALTER TABLE posts
ADD CONSTRAINT data_do_post_check
CHECK ( data_do_post <= current_timestamp
);

-- Criando a tabela comentarios --

CREATE TABLE comentarios (
                post_id 	NUMERIC(38)  NOT NULL,
                funcionario_id 	NUMERIC(38)  NOT NULL,
                nome 		VARCHAR(255) NOT NULL,
                comentario 	VARCHAR(512),
                CONSTRAINT comentarios_pk PRIMARY KEY (post_id, funcionario_id, nome)
);

-- Comentando na tabela comentarios --

COMMENT ON TABLE comentarios 			IS 
'Representa a tabela dos funcionarios  que fizeram comentarios na publicação.';
COMMENT ON COLUMN comentarios.post_id 		IS 
'Atributo que representa o id do post que vai ser feito.';
COMMENT ON COLUMN comentarios.funcionario_id 	IS 
'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN comentarios.nome 		IS 
'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN comentarios.comentario 	IS 
'Representa o comentario realizado em um post.';

-- Criando criando a tabela funcionarios_participantes --

CREATE TABLE funcionarios_participantes (
                post_id 	NUMERIC(38)  NOT NULL,
                funcionario_id 	NUMERIC(38)  NOT NULL,
                nome 		VARCHAR(255) NOT NULL,
                CONSTRAINT funcionarios_participantes_pk PRIMARY KEY (post_id, funcionario_id, nome)
);

-- Comentando na tabela funcionarios_participantes --

COMMENT ON TABLE funcionarios_participantes 			IS 
'Tabela que representa os funcionarios participantes e tambem é uma tabela intermediaria N:N com ponts e funcionarios';
COMMENT ON COLUMN funcionarios_participantes.post_id 		IS 
'Atributo que representa o id do post que vai ser feito.';
COMMENT ON COLUMN funcionarios_participantes.funcionario_id 	IS 
'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN funcionarios_participantes.nome 		IS 
'Representa o nome dos funcionarios no banco de talentos.';

-- Criando a tabela categoria --

CREATE TABLE categoria (
                post_id 	NUMERIC(38)  NOT NULL,
                categoria_post 	VARCHAR(255) NOT NULL,
                CONSTRAINT categoria_pk PRIMARY KEY (post_id, categoria_post)
);

-- Comentando na tabela categoria --

COMMENT ON TABLE categoria 			IS 
'Tabela que representa as categorias de um post. Exemplo: um post com a tematica comedia';
COMMENT ON COLUMN categoria.post_id 		IS 
'Atributo que representa o id do post que vai ser feito.';
COMMENT ON COLUMN categoria.categoria_post 	IS 
'Atributo que representa a categoria que um post possa possuir.';








CREATE TABLE gerente (
                gerente_id NUMERIC(38) NOT NULL,
                gerente_nome VARCHAR(255) NOT NULL,
                CONSTRAINT gerente_pk PRIMARY KEY (gerente_id, gerente_nome)
);
COMMENT ON TABLE gerente IS 'Tabela que representa o gerente e suas caracteristcas.';
COMMENT ON COLUMN gerente.gerente_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN gerente.gerente_nome IS 'Representa o nome dos funcionarios no banco de talentos.';


CREATE TABLE Talentos (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                interesses_id NUMERIC(38),
                curso VARCHAR(255),
                CONSTRAINT talentos_pk PRIMARY KEY (funcionario_id, nome)
);
COMMENT ON TABLE Talentos IS 'Tabela de ligação N:N entre funcionarios, interesses, notificações e Diplomas. Alem de agregar qual essas coisas ao funcionario.';
COMMENT ON COLUMN Talentos.funcionario_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN Talentos.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN Talentos.interesses_id IS 'Atributo que representa o id dos interesses .';
COMMENT ON COLUMN Talentos.curso IS 'Representa o Nome do curso que a pessoa pode ser formada.';


CREATE TABLE amigos (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                amigo_id NUMERIC(38),
                amigo_nome VARCHAR(255),
                CONSTRAINT amigos_pk PRIMARY KEY (funcionario_id, nome)
);
COMMENT ON TABLE amigos IS 'Tabela que representa cada amigo que o  funcionario possa possuir no banco de talentos.';
COMMENT ON COLUMN amigos.funcionario_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN amigos.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN amigos.amigo_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN amigos.amigo_nome IS 'Representa o nome dos funcionarios no banco de talentos.';


CREATE TABLE endereco (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                latitude NUMERIC NOT NULL,
                longitude NUMERIC NOT NULL,
                cep VARCHAR(15) NOT NULL,
                pais VARCHAR(512) NOT NULL,
                complemento VARCHAR(512),
                CONSTRAINT endereco_pk PRIMARY KEY (funcionario_id, nome)
);
COMMENT ON TABLE endereco IS 'Tabela que representa o endereço do funcionario.';
COMMENT ON COLUMN endereco.funcionario_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN endereco.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN endereco.latitude IS 'Representa a latitude que fica localizada a residencia da pessoa. Possui uma restrição de so poder ir de "-90" a "90" graus.';
COMMENT ON COLUMN endereco.longitude IS 'Representa a longitude que esta localizada a  casa do funcionario. Ele possui uma restrição que os valores so podem ir de "-180"  a "180" graus.';
COMMENT ON COLUMN endereco.cep IS 'Representa o CEP do funcionario.';
COMMENT ON COLUMN endereco.pais IS 'Representa o país em que a casa do funcionario esta localizada.';
COMMENT ON COLUMN endereco.complemento IS 'Representa o complemento para ajudar a identifição da casa do funcionario. Exemplo: Casa amarela na frente da igreja, na esquina e por ai vai.';


CREATE TABLE telefones (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone VARCHAR(10) NOT NULL,
                ddd NUMERIC(3) NOT NULL,
                CONSTRAINT telefones_pk PRIMARY KEY (funcionario_id, nome, telefone, ddd)
);
COMMENT ON TABLE telefones IS 'Tabela que representa os telefones dos funcionarios.';
COMMENT ON COLUMN telefones.funcionario_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN telefones.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN telefones.telefone IS 'Representa o telefone dos funcionarios.';
COMMENT ON COLUMN telefones.ddd IS 'Representa o DDD do telefone do funcionario.';


CREATE TABLE fotos (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                imagem BYTEA,
                imagem_mine_type VARCHAR(512),
                logo_charset VARCHAR(512),
                imagem_arquivo VARCHAR,
                imagem_ultima_atualizacao DATE,
                CONSTRAINT fotos_pk PRIMARY KEY (funcionario_id, nome)
);
COMMENT ON TABLE fotos IS 'Tabela que representa as fotos que vão ser usadas tanto como foto de perfil quanto como imagens dos posts.';
COMMENT ON COLUMN fotos.funcionario_id IS 'Representa o id do funcionario no banco de talentos';
COMMENT ON COLUMN fotos.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN fotos.imagem IS 'Atributo que Representa a foto de perfil ou imagem de um post.';
COMMENT ON COLUMN fotos.imagem_mine_type IS 'Representa o tipo do formato da imagem. Exemplo: JPEG, PNG e outros.';
COMMENT ON COLUMN fotos.logo_charset IS 'Conjunto de caracteres usados para codificar ou representar a imagem.';
COMMENT ON COLUMN fotos.imagem_arquivo IS 'Representa o caminho ate a imagem.';
COMMENT ON COLUMN fotos.imagem_ultima_atualizacao IS 'Representa a data registrada da ultima atualização feita na foto de perfil ou no post.';


CREATE TABLE emails (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                email VARCHAR(254) NOT NULL,
                CONSTRAINT emails_pk PRIMARY KEY (funcionario_id, nome, email)
);
COMMENT ON TABLE emails IS 'Tabela de emails dos funcionarios.';
COMMENT ON COLUMN emails.funcionario_id IS 'Representa o id do funcionario no banco de talentos, tambem é a chave primaria da tabela funcionarios.';
COMMENT ON COLUMN emails.nome IS 'Representa o nome dos funcionarios no banco de talentos.';
COMMENT ON COLUMN emails.email IS 'Representa a emails na tabela, ela possui uma restrição de ter no minino um "@" e um "." .';


ALTER TABLE Talentos ADD CONSTRAINT diplomas_talentos_fk
FOREIGN KEY (curso)
REFERENCES diplomas (curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cargo ADD CONSTRAINT diplomas_cargo_fk
FOREIGN KEY (curso)
REFERENCES diplomas (curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Talentos ADD CONSTRAINT interesses_interesse_dos_funcionarios_fk
FOREIGN KEY (interesses_id)
REFERENCES interesses (interesses_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE emails ADD CONSTRAINT funcionarios_emails_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fotos ADD CONSTRAINT funcionarios_fotos_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE telefones ADD CONSTRAINT funcionarios_telefones_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE endereco ADD CONSTRAINT funcionarios_endereco_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE amigos ADD CONSTRAINT funcionarios_amigos_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE amigos ADD CONSTRAINT funcionarios_amigos_fk1
FOREIGN KEY (amigo_id, amigo_nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Talentos ADD CONSTRAINT funcionarios_talentos_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE gerente ADD CONSTRAINT funcionarios_gerente_fk
FOREIGN KEY (gerente_id, gerente_nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE posts ADD CONSTRAINT funcionarios_posts_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE comentarios ADD CONSTRAINT funcionarios_comentarios_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios_participantes ADD CONSTRAINT funcionarios_amigos_participantes_fk
FOREIGN KEY (funcionario_id, nome)
REFERENCES funcionarios (funcionario_id, nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE categoria ADD CONSTRAINT posts_categoria_fk
FOREIGN KEY (post_id)
REFERENCES posts (post_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios_participantes ADD CONSTRAINT posts_amigos_participantes_fk
FOREIGN KEY (post_id)
REFERENCES posts (post_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE comentarios ADD CONSTRAINT posts_comentarios_fk
FOREIGN KEY (post_id)
REFERENCES posts (post_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios ADD CONSTRAINT gerente_funcionarios_fk
FOREIGN KEY (gerente_id, gerente_nome)
REFERENCES gerente (gerente_id, gerente_nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
