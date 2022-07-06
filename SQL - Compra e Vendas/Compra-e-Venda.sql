
DROP DATABASE bd_vendas;

/* CRIAÇÃO DO BANCO DE DADOS BD_VENDAS - TLBD III */

CREATE DATABASE bd_vendas;

/* HABILITANDO O BANCO DE DADOS PARA USO */

USE bd_vendas;

/* CRIAÇÃO DA TABELA DE PRODUTOS */

CREATE TABLE tbl_produto (
	cod_produto 	INT UNSIGNED AUTO_INCREMENT,
    nome_produto 	VARCHAR(100) NOT NULL,
    desc_produto 	VARCHAR(100) NOT NULL,
    unid_medida 	VARCHAR(2) NOT NULL,
    estoque_atual 	INT DEFAULT 0,
    estoque_min 	INT DEFAULT 0,
    estoque_max 	INT DEFAULT 0,
    valor 			DECIMAL(10,2) NOT NULL,
    
    PRIMARY KEY (cod_produto)
);

/* CRIAÇÃO DA TABELA DE ENDEREÇO - CEP */

CREATE TABLE tbl_endereco (
	id 			INT(10) NOT NULL,
    cep 		INT(9) NOT NULL,
    logradouro 	VARCHAR(90) NOT NULL,
    bairro 		VARCHAR(50) NOT NULL,
    cidade 		VARCHAR(50) NOT NULL,
    estado 		CHAR(2) NOT NULL,
    
    PRIMARY KEY (cep)
);


/* CRIAÇÃO DA TABELA DE CLIENTES */

CREATE TABLE tbl_cliente (
	cod_cliente 	INT UNSIGNED AUTO_INCREMENT,
    nome_cliente 	VARCHAR(45) NOT NULL,
    cpf 			VARCHAR(11) DEFAULT '',
    data_nasc 		DATE,
    cep 			INT(9) DEFAULT 0,
    numero 			VARCHAR(10) DEFAULT '',
    complemento 	VARCHAR(20) DEFAULT '',
    
    PRIMARY KEY (cod_cliente),
    CONSTRAINT fk_clientecep FOREIGN KEY (cep) REFERENCES tbl_endereco(cep)
);

/* CRIAÇÃO DA TABELA DE PEDIDOS */

CREATE TABLE tbl_pedido (
	cod_pedido 		INT UNSIGNED AUTO_INCREMENT,
    data_pedido 	DATE,
    data_entrega 	DATE,
    cod_cliente 	INT UNSIGNED NOT NULL,
    
    PRIMARY KEY (cod_pedido),
    CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente(cod_cliente)
);

/* CRIAÇÃO DA TABELA DE ITENS DO PEDIDO */

CREATE TABLE tbl_itempedido (
	qtde 			INT UNSIGNED NOT NULL,
    i_cod_pedido 	INT UNSIGNED NOT NULL,
    i_cod_produto 	INT UNSIGNED NOT NULL,
    i_valor 		DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT fk_pedido1 		FOREIGN KEY (i_cod_pedido) REFERENCES tbl_pedido (cod_pedido),
    CONSTRAINT fk_tbl_produto1 	FOREIGN KEY (i_cod_produto) REFERENCES tbl_produto (cod_produto)
);

INSERT INTO tbl_endereco (id, cep, logradouro, bairro, cidade, estado) VALUES
(605531, 6780230, 'Rua Abel da Silva Pina', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(605532, 6780235, 'Rua Abel da Silva Pina', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605533, 6790020, 'Rua AbÍlio José Espinola', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605534, 6753420, 'Rua das Acácias', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605535, 6790000, 'Rua Acácio Ferreira', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605536, 6757130, 'Rua Acre', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605537, 6767300, 'Rua Acylino Ventino de Moraes', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605538, 6753250, 'Rua Adalberto Bueno', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(605539, 6763350, 'Rua Adélio Gonçalves', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605540, 6773310, 'Rua Ademir de Jesus', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605541, 6753230, 'Rua Adília Augusta Ramos', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605542, 6763180, 'Rua Adolfino Arruda Castanho', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(605543, 6753150, 'Rua Adolfo Lutz', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(605544, 6785130, 'Rua Adriano dos Santos Pinto', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605545, 6766180, 'Rua Adriano Félix', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605546, 6795040, 'Rua Afonso Desidério', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605547, 6774290, 'Rua Afonso Rodrigues Ferreira', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(605548, 6756430, 'Rua Ãfrica', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605549, 6756440, 'Rua Agadir', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605550, 6795060, 'Rua Agostinho Marcelino de Souza', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605551, 6763250, 'Rua Agrindus', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(605552, 6756230, 'Rua Águas Marinhas', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605553, 6783110, 'Rua Águas Mornas', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605554, 6783390, 'Rua Agudos do Sul', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(605555, 6760020, 'Rua Agueda Gonçalves', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(605556, 6795006, 'Avenida Ayrton Senna', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605557, 6766320, 'Rua Alália Vilar Álvares', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605558, 6780110, 'Avenida Albert Einstein', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(605559, 6787370, 'Rua Alberto José', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605560, 6775260, 'Rua Alcides Luizetto', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(605561, 6770280, 'Rua Aldomaro Pereira', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605562, 6765250, 'Rua Alexandre de Gusmãoo', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605563, 6784330, 'Rua Alfredo Argemiro do Nascimento', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605564, 6780160, 'Rua Alfredo Schultz', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(605565, 6763110, 'Rua Alfredo Wolf', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605566, 6755370, 'Rua Alice Vazami', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605567, 6773130, 'Rua Alípio Domingues Mandu', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(605568, 6785180, 'Rua Almir Ribeiro', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605569, 6790100, 'Rua João Meneghette', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605570, 6773020, 'Rua Álvaro de Souza', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605571, 6784080, 'Rua Alvorada', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605572, 6775100, 'Rua Alzira Rosa', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(605573, 6755320, 'Praça América do Sul', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605574, 6755400, 'Rua Americana', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(605575, 6786150, 'Rua Américo da Silva', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605576, 6755410, 'Rua Amparo', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(605577, 6765420, 'Travessa Ana Gomes de Godói', 'Vila das Oliveiras', 'Taboão da Serra', 'SP'),
(605578, 6755090, 'Rua Ana Maria da Conceiçãoo', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605579, 6790210, 'Rua Ana Martins Ribeiro', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(605580, 6767100, 'Rua Ana Rodrigues Oliveira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605581, 6763220, 'Rua Anália Andrade Miranda', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(605582, 6785100, 'Rua Ananias Carmerindo Pires', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605583, 6783220, 'Rua André Cassiano Pirozzi', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605584, 6783100, 'Rua André da Silva Pina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605585, 6765180, 'Rua Andréia Teixeira de Almeida', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(605586, 6795070, 'Rua Ângela Maria Cardoso', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605587, 6780040, 'Rua Angelina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605588, 6753020, 'Alameda Angelina Caner Pazini', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(605589, 6784370, 'Rua Angelina Passi Caroli', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605590, 6783320, 'Rua Angelo Ferreira Fagundes', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(605591, 6773320, 'Rua Angelo Martins', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605592, 6760070, 'Rua Aníbal de Jesus', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(605593, 6773200, 'Rua Anita de Souza', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(605594, 6784335, 'Praça Anízia Paulino Saraiva', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605595, 6765260, 'Rua Antenor', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605596, 6773100, 'Rua Antolim Munhoz', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605597, 6790030, 'Rua Antônio Antenor Nogueira', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605598, 6766210, 'Rua Antônio Carlos Torres', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605599, 6783115, 'Rua Antônio da Silva Pina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605600, 6775470, 'Rua Antônio de Oliveira Salazar', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(605601, 6764470, 'Rua Antônio do Nascimento', 'Jardim Henriqueta', 'Taboão da Serra', 'SP'),
(605602, 6755310, 'Rua Antônio Fazio Perri', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605603, 6767110, 'Rua Sylvio Zanelato', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605604, 6770220, 'Rua Antônio Henrique Filho', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(605605, 6757030, 'Rua Antônio Maciel de Oliveira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605606, 6785050, 'Rua Antônio Marcos Torres', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(605607, 6775110, 'Rua Antônio Mathias', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(605608, 6783150, 'Rua Antônio Moura da Silva', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605609, 6775230, 'Rua Antônio Pedrãoo', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(605610, 6753300, 'Rua Antônio Pinto Cardoso', 'Jardim Virgínia', 'Taboão da Serra', 'SP'),
(605611, 6765390, 'Rua Antônio Rodrigues', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605612, 6765300, 'Rua Antônio Sílvio Cunha Bueno', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605613, 6786310, 'Rua Antônio Soares de Abreu', 'Jardim Elizabete', 'Taboão da Serra', 'SP'),
(605614, 6783450, 'Avenida Antônio Soares de Azevedo', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(605615, 6784360, 'Rua Antônio Teixeira Lima', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605616, 6764300, 'Rua Antônio Teixeira Pinto', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(605617, 6774270, 'Rua Anunciata Ademaro Gentile', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(605618, 6773250, 'Rua Anunciata Bugelli Marques', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605619, 6770260, 'Rua Aparecida Guerini Cruz', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605620, 6766270, 'Rua Aparecido Gomes da Silva', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605621, 6785410, 'Rua Arábia', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(605622, 6780060, 'Rua Araçatuba', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605623, 6755420, 'Rua Araraquara', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(605624, 6784000, 'Rua Aratiba', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605625, 6756010, 'Rua Antônio Pestana', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605626, 6756330, 'Rua Argentina', 'Jardim América', 'Taboão da Serra', 'SP'),
(605627, 6753040, 'Alameda Arlindo Farias', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(605628, 6783050, 'Avenida Arlindo Genário de Freitas', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(605629, 6754210, 'Avenida Armando de Andrade', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(605630, 6786170, 'Rua Armando Poci', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605631, 6753310, 'Rua Armezinda de Jesus Pereira', 'Jardim Virgínia', 'Taboão da Serra', 'SP'),
(605632, 6785270, 'Rua Ary Barroso', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605633, 6785310, 'Rua Ãsia', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(605634, 6780290, 'Rua Assaji Yokoyama', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605635, 6775050, 'Rua Assembléia de Deus', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(605636, 6786420, 'Rua Assuero Bernardes de Pádua', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605637, 6773390, 'Rua Atalanta', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(605638, 6785240, 'Rua Ataulfo Alves', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605639, 6765440, 'Rua Ãurea Tavares', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(605640, 6786220, 'Rua Aurélio Pasi', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605641, 6785400, 'Rua Austrália', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(605642, 6786380, 'Rua Avaí', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605643, 6785320, 'Rua Avaré', 'Parque Industrial Taboão da Serra', 'Taboão da Serra', 'SP'),
(605644, 6767290, 'Rua Avelina da Silva Nunes', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605645, 6755325, 'Rua Avelina Nogueira do Prado', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605646, 6757060, 'Rua Bahia', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605647, 6787290, 'Avenida Balbina Rodrigues de Borba', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605648, 6770000, 'Rua Bárbara Cristi Leite', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605649, 6784100, 'Rua Bariri', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605650, 6784005, 'Rua Barra do Carapa', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605651, 6784010, 'Rua Barueri', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605652, 6787190, 'Rua Basile', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605653, 6786290, 'Rua Batalha', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(605654, 6755430, 'Rua Bauru', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605655, 6765030, 'Rua Beatriz Antônia', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605656, 6764360, 'Rua Beatriz Aparecida', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605657, 6764350, 'Rua Beatriz Augusta', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605658, 6765040, 'Rua Beatriz Eugênia', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605659, 6764380, 'Rua Beatriz Inês', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605660, 6764490, 'Rua Beatriz Regina', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605661, 6765050, 'Rua Beatriz Terezinha', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605662, 6786390, 'Rua Belo Monte', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(605663, 6773350, 'Rua Benedita Helena Rodrigues', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605664, 6755290, 'Rua Benedita Joana Franco', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605665, 6757260, 'Rua Benedita Aparecida Nogueira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605666, 6755080, 'Rua Benedito Carneiro de Freitas', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605667, 6766040, 'Rua Benedito Henrique Pedreira', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605668, 6753170, 'Rua Benedito José de Oliveira', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605669, 6786130, 'Rua Benedito Marcelino Braga', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605670, 6774210, 'Rua Benedito Marinonio Filho', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(605671, 6770290, 'Rua Benedito Marques de Souza', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605672, 6753280, 'Rua Benedito Nunes Vieira', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(605673, 6764375, 'Rua Benedito Prestes Ferras', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(605674, 6757250, 'Rua Benedito Procópio', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605675, 6787310, 'Rua Bernardo Joaquim de Moraes', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605676, 6755190, 'Praça Big Valley', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605677, 6780070, 'Rua Botucatu', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605678, 6756370, 'Avenida Brasil', 'Jardim América', 'Taboão da Serra', 'SP'),
(605679, 6774240, 'Rua Brasil para Cristo', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(605680, 6760030, 'Rua Brigadeiro Faria Lima', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(605681, 6773010, 'Rua Brígida Oliveira Ferreira', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605682, 6785330, 'Rua Brilhante', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605683, 6756250, 'Rua Brilhante', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605684, 6784400, 'Rua Cachoeirinha', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605685, 6763460, 'Avenida Caetano Barrella', 'Jardim da Glória', 'Taboão da Serra', 'SP'),
(605686, 6756090, 'Rua Cairo', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605687, 6794000, 'Alameda Calíope', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(605688, 6783091, 'Rua Cambuci', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605689, 6754110, 'Rua das CAmélias', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605690, 6787180, 'Rua Camilo Peçanha', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605691, 6780200, 'Avenida Campinas', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605692, 6783060, 'Rua Campos Sales', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(605693, 6764170, 'Praça Canadá', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605694, 6780080, 'Rua Canelinha', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605695, 6756260, 'Rua Caramuru', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605696, 6764160, 'Rua Carapicuíba', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605697, 6787470, 'Rua Cardoso de Almeida', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605698, 6774080, 'Rua Carlos Fernandes', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605699, 6770170, 'Rua Carlos Ferreira Lino', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(605700, 6753080, 'Praça Carlos Gomes', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605701, 6765460, 'Rua Carlos Grotte', 'Vila Sônia do Taboão', 'Taboão da Serra', 'SP'),
(605702, 6786230, 'Rua Carlos Marques Teixeira', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605703, 6763370, 'Rua Carmem Aguilar Perez', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605704, 6765270, 'Rua Carneiro Leão', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605705, 6756400, 'Rua Casablanca', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605706, 6753190, 'Praça Cáspio', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605707, 6774310, 'Rua Castro Alves', 'Jardim Flórida', 'Taboão da Serra', 'SP'),
(605708, 6755230, 'Rua Catarina de Oliveira Moraes', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605709, 6784110, 'Rua Catuire', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605710, 6774060, 'Rua Caviúna', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605711, 6774020, 'Rua Cedro', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605712, 6774085, 'Rua Centenário do Sul', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(605713, 6784122, 'Rua Cerro Largo', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605714, 6764480, 'Avenida César Simões', 'Jardim Henriqueta', 'Taboão da Serra', 'SP'),
(605715, 6763080, 'Rua CeSário Dau', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605716, 6775450, 'Rua CeSário Verde', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605717, 6787400, 'Rua Cezária Camargo de Oliveira', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605718, 6756340, 'Rua Chile', 'Jardim América', 'Taboão da Serra', 'SP'),
(605719, 6790160, 'Rua Reginaldo Nascimento da Silva', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605720, 6787360, 'Avenida Cid Nelson Jordano', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605721, 6790230, 'Travessa das Cigarreiras', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(605722, 6785520, 'Rua Alícia Francisca de Oliveira', 'Jardim São Luiz', 'Taboão da Serra', 'SP'),
(605723, 6755150, 'Rua Ciro Monteiro', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605724, 6783030, 'Rua Clara Muchini Costa', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(605725, 6786180, 'Rua Cláudio Domingues de Moraes', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605726, 6767200, 'Rua Cláudio Righetti', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605727, 6753140, 'Rua Clemente Ferreira', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(605728, 6755360, 'Rua Clemente Rodrigues da Silva', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605729, 6794130, 'Alameda Clio', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(605730, 6786030, 'Rua Coimbra', 'Jardim Altos do Taboao', 'Taboão da Serra', 'SP'),
(605731, 6756380, 'Rua Colombia', 'Jardim América', 'Taboão da Serra', 'SP'),
(605732, 6783160, 'Passagem Confraternizaçãoo', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605733, 6756270, 'Rua Congo', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605734, 6770050, 'Rua Conrado Caim', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605735, 6784350, 'Rua Constância Glória do Nascimento', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605736, 6787420, 'Rua Constantino Dias Lopes', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605737, 6756220, 'Rua Coral', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605738, 6753290, 'Avenida Coripheu de Azevedo Marques', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(605739, 6784130, 'Rua Andradina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605740, 6753430, 'Travessa dos Cravos', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605741, 6784140, 'Rua Criciumal', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605742, 6753130, 'Rua do Cristo', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(605743, 6785080, 'Rua Dalira Maria de Jesus', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605744, 6753320, 'Rua Danlino Ramos Cruz', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(605745, 6756130, 'Rua Daomé', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605746, 6770160, 'Rua David da Silva Meireles', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(605747, 6794020, 'Alameda Delfos', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(605748, 6770250, 'Rua Deputado João Sussumo Hirata', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605749, 6767270, 'Rua Desidério Ferreira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605750, 6775370, 'Rua Dez de Março', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(605751, 6770095, 'Rua Dezenove de Fevereiro', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(605752, 6774230, 'Rua Digenir Pedro de Campos', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(605753, 6766010, 'Rua Diva Inez Gutieres', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(605754, 6784020, 'Rua Dois Irmãoos', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605755, 6755050, 'Rua Dolival de Moraes', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(605756, 6785190, 'Rua Dolores Duran', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605757, 6774180, 'Rua Dolores Garcia Busto', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605758, 6774170, 'Rua Dolores Romero', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605759, 6763010, 'Rua Domingos Valente', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(605760, 6786400, 'Rua Dona Ana', 'Vila Francisco Remeikis', 'Taboão da Serra', 'SP'),
(605761, 6753005, 'Praça Dona Dely', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(605762, 6767130, 'Rua Donaria Moraes de Freitas', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605763, 6755140, 'Rua Dosolina Ferlin Politano', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605764, 6766200, 'Rua Doutor Carlos Siqueira Neto', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605765, 6763270, 'Avenida Doutor José Maciel - até 899/900', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605766, 6764005, 'Avenida Doutor José Maciel - de 901/902 ao fim', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605767, 6767330, 'Rua Doutor Mário Augusto Pereira', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605768, 6764130, 'Rua Dulce dos Santos Marques', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605769, 6766400, 'Rua Durvalina Firmino Alves', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(605770, 6787200, 'Rua Eça de Queiroz', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605771, 6766150, 'Rua Echaporão', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605772, 6783290, 'Rua Edgar Alves Figueiredo', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(605773, 6753380, 'Rua Edília Souza Lima', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(605774, 6760040, 'Rua Edit Piaf', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(605775, 6753390, 'Rua Edite Pinho Souza', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(605776, 6787000, 'Rua Edson da Silva Coelho', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605777, 6757280, 'Rua Eduardo Moreira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605778, 6764425, 'Rua Edval de Souza', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(605779, 6785340, 'Rua Eliza Maria da Conceiçãoo', 'Jardim São João', 'Taboão da Serra', 'SP'),
(605780, 6763160, 'Rua Elpídio José de Oliveira', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605781, 6764060, 'Rua Elvira Teixeira Pinto', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605782, 6765450, 'Rua Elza Feres', 'Vila Sônia do Taboão', 'Taboão da Serra', 'SP'),
(605783, 6770210, 'Rua Elza Marina Dohoczki', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(605784, 6755120, 'Avenida Embaixador Assis Chateaubriand', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605785, 6765200, 'Avenida Emerito Arbulu', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(605786, 6763090, 'Rua Emília Garrido', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605787, 6773300, 'Rua Emília Martins Rulo', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605788, 6753100, 'Rua Emílio Ribas', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(605789, 6773290, 'Rua Enaura Maria da Conceiçãoo', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(605790, 6773120, 'Rua Enedite Maria Jatobá', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(605791, 6763480, 'Rua Engenheiro Wilson Houk', 'Jardim da Glória', 'Taboão da Serra', 'SP'),
(605792, 6785160, 'Rua Enus Araújo', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605793, 6783340, 'Rua Epitácio Pessoa', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(605794, 6794120, 'Alameda Erato', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(605795, 6784150, 'Rua Erechim', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605796, 6785350, 'Rua Érico Veríssimo', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605797, 6786490, 'Rua Érico Veríssimo', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605798, 6767150, 'Rua Ermelino José de Oliveira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605799, 6754060, 'Rua Ernesto Capelari', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(605800, 6767020, 'Rua Ernesto Rosa da Fonseca', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605801, 6757070, 'Rua Espírito Santo', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605802, 6783180, 'Rua Esplanada', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605803, 6783170, 'Travessa Esplanada', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605804, 6784160, 'Rua Estância Velha', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605805, 6755335, 'Rua Estanislau Belisqui', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605806, 6784170, 'Rua Esteio', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605807, 6756080, 'Rua Etiópia', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605808, 6775490, 'Rua Euclides Pagani Martins', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(605809, 6770340, 'Rua Eugênia Botelho Ascenso', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605810, 6765380, 'Rua Eugênia Felizarda da Silva', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605811, 6753270, 'Rua Eunice Maria de Souza', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(605812, 6783380, 'Rua Eurico Gaspar Dutra', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(605813, 6785360, 'Rua Europa', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(605814, 6794030, 'Alameda Euterpe', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(605815, 6773210, 'Rua Evaristo Perez', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(605816, 6757000, 'Avenida Felício Barutti', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605817, 6764110, 'Rua Félicio Montagna', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605818, 6786370, 'Rua Felipe Del Paggio', 'Vila Francisco Remeikis', 'Taboão da Serra', 'SP'),
(605819, 6786260, 'Rua Fernando Pessoa', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(605820, 6784380, 'Rua Fideralina Gomes de Almeida', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(605821, 6774120, 'Rua Firmino Vieira Gonçalves', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(605822, 6753060, 'Rua Flamengo', 'Jardim Virgínia', 'Taboão da Serra', 'SP'),
(605823, 6780270, 'Rua Fortunato de Luca', 'Jardim Bonanza', 'Taboão da Serra', 'SP'),
(605824, 6775150, 'Rua Francisca Cirilo Lotito', 'Jardim Pirajussara', 'Taboão da Serra', 'SP'),
(605825, 6763000, 'Rua Francisca de Carvalho', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605826, 6765470, 'Rua Francisca Roncada Parolise', 'Jardim Wanda', 'Taboão da Serra', 'SP'),
(605827, 6760010, 'Rua Francisco Alves', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(605828, 6763060, 'Rua Francisco Andugar Espinosa', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(605829, 6763500, 'Rua Francisco Armando Abbondanza', 'Centro', 'Taboão da Serra', 'SP'),
(605830, 6765430, 'Rua Francisco Celso', 'Vila das Oliveiras', 'Taboão da Serra', 'SP'),
(605831, 6753210, 'Rua Francisco Coelho dos Santos Filho', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605832, 6787390, 'Rua Francisco Comino', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605833, 6785290, 'Rua Francisco D''Amico', 'Parque Industrial Taboão da Serra', 'Taboão da Serra', 'SP'),
(605834, 6753000, 'Avenida Francisco Ettore Pedro Mari - até 1001/1002', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(605835, 6753001, 'Avenida Francisco Ettore Pedro Mari - de 1003/1004 ao fim', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(605836, 6787060, 'Rua Francisco Fernandes Sanches', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605837, 6763100, 'Rua Francisco Gonçalves', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605838, 6767090, 'Rua Francisco Honorato de Medeiros', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605839, 6755020, 'Rua Francisco José da Cruz', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(605840, 6756280, 'Rua Francisco Leitão', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605841, 6785140, 'Rua Francisco Marcelino', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605842, 6787210, 'Rua Francisco Marins', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605843, 6780130, 'Rua Francisco Meneghette', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(605844, 6786485, 'Vila Francisco Peixoto do Nascimento', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605845, 6755270, 'Rua Francisco Perez', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605846, 6787040, 'Rua Francisco Salatino', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605847, 6766110, 'Rua Frederico Correa', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(605848, 6764080, 'Rua Frederico Friedler', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605849, 6783400, 'Rua Freitas Júnior', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605850, 6775300, 'Rua Gabriel da Hora do Nascimento', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(605851, 6773220, 'Rua Gabriel de Paula', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605852, 6766300, 'Rua Gabriel Madri', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605853, 6753450, 'Rua das Gardênias', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605854, 6780140, 'Rua Geraldina Carlos dos Santos', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(605855, 6760025, 'Rua Geraldo Costa Manso Junior', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(605856, 6765020, 'Rua Geraldo de Araújo Santos', 'Jardim Helena', 'Taboão da Serra', 'SP'),
(605857, 6755070, 'Rua Geraldo José de Almeida', 'Jardim Paraíso', 'Taboão da Serra', 'SP'),
(605858, 6783070, 'Rua Gertulina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605859, 6784410, 'Rua Getulina', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605860, 6754030, 'Rua Getúlio Vargas', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(605861, 6755030, 'Rua Gilda de Abreu', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(605862, 6755280, 'Rua Gilda Maria dos Santos', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(605863, 6773230, 'Rua Gilson Gasparini', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(605864, 6790010, 'Rua Giovana Motta', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605865, 6757125, 'Avenida Goiás', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605866, 6785380, 'Rua Gonçalo Parada', 'Jardim São João', 'Taboão da Serra', 'SP'),
(605867, 6786270, 'Rua Gonçalves Dias', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(605868, 6787410, 'Rua Goreti', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605869, 6765140, 'Rua Gotaru Suzuki', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605870, 6753180, 'Rua Grace Casseb', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605871, 6787100, 'Rua Graciliano Ramos', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605872, 6780090, 'Rua Gravatal', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605873, 6785090, 'Rua Graziela Cunha Campos', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(605874, 6757010, 'Rua Gregório Figueira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605875, 6793010, 'Rua Guaíra', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605876, 6757160, 'Rua Guanabara', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605877, 6753325, 'Rua Tenente Edson da Silva Rodrigues', 'Jardim Taboão', 'Taboão da Serra', 'SP'),
(605878, 6785010, 'Rua Guilherme Busto', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(605879, 6787440, 'Rua Guilherme de Almeida', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605880, 6756410, 'Rua Guiné', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(605881, 6785210, 'Rua Hamilton Fernandes', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605882, 6787120, 'Rua Havaí', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605883, 6785280, 'Rua Heitor Villa Lobos', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605884, 6763330, 'Rua Helena Antônia Schiavo', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605885, 6767390, 'Rua Helena Moraes de Oliveira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605886, 6765190, 'Rua Hélio Moraes de Oliveira', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(605887, 6767070, 'Rua Helmut Strobel', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605888, 6767320, 'Rua Henrique de Moraes Camargo', 'Jardim Santa Cecília', 'Taboão da Serra', 'SP'),
(605889, 6790170, 'Rua Henrique Robba', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(605890, 6755000, 'Rua Hermelindo Branco', 'Jardim Paraíso', 'Taboão da Serra', 'SP'),
(605891, 6757270, 'Rua Érmerson da Silva Fagundes', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605892, 6766390, 'Passagem Himalaia', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605893, 6787130, 'Rua Hortelândia', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605894, 6767000, 'Rua Hortência Albuquerque Orlandino', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605895, 6753350, 'Rua das Hortências', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605896, 6764280, 'Rua Humberto da Silva Rodarte', 'Parque Albina', 'Taboão da Serra', 'SP'),
(605897, 6785300, 'Avenida Ibirama', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(605898, 6790060, 'Rua Ibitinga', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605899, 6780210, 'Rua Ibiúna', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(605900, 6795000, 'Rua Ida Romussi Gasparinetti', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605901, 6790080, 'Rua Iguape', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605902, 6780050, 'Rua Imarui', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605903, 6783250, 'Rua Imbituba', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605904, 6774190, 'Rua Imbuia', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(605905, 6763420, 'Praça Inglaterra', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605906, 6757020, 'Avenida Intercap', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605907, 6753435, 'Travessa Ipó', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605908, 6763340, 'Rua Iracema de Jesus Marquesine', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605909, 6757240, 'Rua Iracema Sena Cerqueira Santos', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605910, 6783330, 'Rua Irati', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(605911, 6784280, 'Rua Irmão Ana de Lourdes Franca', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(605912, 6784270, 'Rua Irmão Maria Celeste Ribeiro', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(605913, 6784290, 'Rua Irmão Olímpia da Apresentaçãoo Carvalho', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(605914, 6784260, 'Rua Irmão Paula Loebensteim', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(605915, 6787140, 'Rua Isa', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605916, 6753260, 'Rua Isabel de Freitas Sassi', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(605917, 6787110, 'Rua Isabel Soria Mainardes', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605918, 6786210, 'Rua Iside Betro Lupo Issa', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605919, 6775310, 'Rua Ismael Pena', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(605920, 6786190, 'Rua Isolina Maria do Prado', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605921, 6765330, 'Rua Isolina Rizzi do Nascimento', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605922, 6786110, 'Rua Issao Onuma', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605923, 6783130, 'Rua Itacolomi', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605924, 6767380, 'Praça Itajaí', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605925, 6787150, 'Rua Itanhaém', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605926, 6790110, 'Rua Itu', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605927, 6784180, 'Rua Ivoti', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605928, 6767310, 'Rua Izaura da Silva Camargo', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605929, 6790040, 'Rua Izidro Gonçalves', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(605930, 6764220, 'Rua J B Madureira', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605931, 6787220, 'Rua Jaciara', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605932, 6765170, 'Estrada Jaguaré', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(605933, 6784190, 'Rua Japira', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605934, 6753440, 'Rua dos Jasmins', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605935, 6786010, 'Avenida Javan Lessa Ribeiro', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(605936, 6766015, 'Rua Jerônimo de Albuquerque', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605937, 6753120, 'Alameda Jerônimo Ferreira Menezes', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(605938, 6765060, 'Rua Jiro Maruyama', 'Jardim Helena', 'Taboão da Serra', 'SP'),
(605939, 6770150, 'Rua Joana Vera Maldonado', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(605940, 6766190, 'Rua João Antônio da Fonseca', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605941, 6766075, 'Rua João Antônio da Silva', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605942, 6753400, 'Rua João Antônio de Andrade', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(605943, 6766073, 'Rua João Antônio dos Santos', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605944, 6767010, 'Rua João Batista da Fonseca', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605945, 6760050, 'Rua João CaFé Filho', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(605946, 6763130, 'Rua João Queiroz', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605947, 6773080, 'Rua João Del Porto', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(605948, 6765510, 'Rua João Duarte', 'Jardim Wanda', 'Taboão da Serra', 'SP'),
(605949, 6786330, 'Rua João Estribita de Almeida', 'Jardim Elizabete', 'Taboão da Serra', 'SP'),
(605950, 6763400, 'Rua João Faria Leite', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605951, 6774200, 'Rua João Fernandes', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(605952, 6755130, 'Rua João Fischer Júnior', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(605953, 6770030, 'Rua João Francisco Barbosa', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(605954, 6766410, 'Rua João José Carreiro', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(605955, 6766280, 'Rua João Monteiro de Brito', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(605956, 6790190, 'Rua João Parmissano', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(605957, 6790240, 'Rua João Pires de Camargo', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(605958, 6775010, 'Rua João Rojas Fernandes', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(605959, 6754090, 'Rua João Santucci', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(605960, 6763470, 'Rua João Slaviero', 'Jardim da Glória', 'Taboão da Serra', 'SP'),
(605961, 6767385, 'Rua Joaquim Faustino de Camargo', 'Jardim São Paulo', 'Taboão da Serra', 'SP'),
(605962, 6764230, 'Rua Joaquim Gomes dos Reis', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605963, 6786250, 'Rua Joaquim Ival de Jesus', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605964, 6757300, 'Rua Joaquim José da Silva Xavier', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(605965, 6775190, 'Rua Joaquim Lucas Filho', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(605966, 6764120, 'Rua Joaquim Rodrigues dos Santos', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605967, 6775080, 'Rua Joaquim Soares de Lima', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(605968, 6780120, 'Avenida Jorge Rodrigues Pascoaline', 'Jardim Record', 'Taboão da Serra', 'SP'),
(605969, 6753195, 'Rua José Amâncio Ferreira', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605970, 6755260, 'Avenida José André de Moraes', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605971, 6790250, 'Rua José Antônio Greco', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(605972, 6755275, 'Rua José Azzar', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(605973, 6770130, 'Rua José Barreto da Silva', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(605974, 6753220, 'Rua José Bellum', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(605975, 6763240, 'Rua José Carlos de Macedo Soares', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(605976, 6764390, 'Rua José Copazi', 'Parque Albina', 'Taboão da Serra', 'SP'),
(605977, 6785370, 'Rua José de Alencar', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(605978, 6765120, 'Rua José de Castro de Faria Filho', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605979, 6786440, 'Rua José de Oliveira Dias', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605980, 6795010, 'Rua José de Souza Costa', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(605981, 6755060, 'Rua José Dias dos Santos', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(605982, 6763015, 'Avenida José Dini', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(605983, 6765100, 'Rua José Domingues de Moraes', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(605984, 6764330, 'Rua José Firmo de Oliveira', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(605985, 6765080, 'Rua José Francisco dos Santos', 'Jardim Helena', 'Taboão da Serra', 'SP'),
(605986, 6783270, 'Rua José Gonçalves do Espírito Santo', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(605987, 6787230, 'Rua José Linhares', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(605988, 6786450, 'Rua Brazilina Beu', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(605989, 6767360, 'Rua José Lourenço de Moraes', 'Jardim Santa Cecília', 'Taboão da Serra', 'SP'),
(605990, 6764040, 'Rua José Maciel Neto', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605991, 6754140, 'Rua José Mari', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(605992, 6786350, 'Rua José Maria de Melo', 'Vila Francisco Remeikis', 'Taboão da Serra', 'SP'),
(605993, 6787030, 'Rua José Maria de Oliveira Lima', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(605994, 6766230, 'Rua José Maria Gulias Fernandes', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(605995, 6763150, 'Rua José Maria Mamblona', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605996, 6764115, 'Rua José Mariano de Jesus', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605997, 6763380, 'Rua José Menotti', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(605998, 6787380, 'Rua José Micheloni Filho', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(605999, 6783240, 'Rua José Mielle', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606000, 6770320, 'Rua José Miguel Arcanjo', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606001, 6766420, 'Rua José Milani', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(606002, 6753070, 'Rua José Nunes de Oliveira', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(606003, 6784310, 'Avenida José Paris', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(606004, 6790200, 'Rua José Paulino Almeida', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(606005, 6775280, 'Rua José Pedro Nogueira Filho', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606006, 6763200, 'Rua José Pestana', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606007, 6786500, 'Rua José Rodrigues Filho', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606008, 6765490, 'Rua José Ruscitto', 'Vila das Oliveiras', 'Taboão da Serra', 'SP'),
(606009, 6764010, 'Praça José Salvador Silva', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606010, 6754020, 'Rua José Soares de Azevedo', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606011, 6773360, 'Rua José Tibúrcio da Cunha', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606012, 6784340, 'Rua José Tobias Costa', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(606013, 6767190, 'Rua José Vaz de Oliveira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606014, 6766125, 'Rua Josefa Maria de Jesus', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606015, 6773040, 'Rua Josefina Fonseca', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606016, 6755300, 'Rua Josefina Santoro D''Amico', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606017, 6754200, 'Rua Jovina de Carvalho Dau', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(606018, 6773180, 'Rua Júlio César Acosta Chimenez', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606019, 6773170, 'Rua Júlio Fernandes', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606020, 6780260, 'Rua Jundiaí', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606021, 6755405, 'Rua Jundiaí', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606022, 6794040, 'Alameda Júpiter', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606023, 6764180, 'Rua Juquiá', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606024, 6774070, 'Rua Jurandir Cabelho', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(606025, 6753370, 'Rua Juscelino Kubitschek de Oliveira', 'Jardim Frei Galvão', 'Taboão da Serra', 'SP'),
(606026, 6767260, 'Rua Jussane Cristina Leite', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606027, 6786120, 'Rua Kaoru Maruyama', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606028, 6775510, 'Rua Kiku Takeuti', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606029, 6775000, 'Estrada Kizaemon Takeuti - até 899/900', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606030, 6775001, 'Estrada Kizaemon Takeuti - de 901/902 a 1501/1502', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606031, 6775002, 'Estrada Kizaemon Takeuti - de 1503/1504 a 2091/2092', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(606032, 6775003, 'Estrada Kizaemon Takeuti - de 2093/2094 ao fim', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606033, 6775160, 'Rua Kossei Hamati', 'Jardim Pirajussara', 'Taboão da Serra', 'SP'),
(606034, 6783120, 'Rua Kyo Tsuno', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606035, 6790130, 'Rua Lages', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606036, 6785230, 'Rua Lamartine Babo', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606037, 6770140, 'Rua Laudelina Pereira da Silva', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(606038, 6770100, 'Rua Laudelino Gomes Ribeiro', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(606039, 6766360, 'Avenida Laurita Ortega Mari - até 1289/1290', 'Vila das Oliveiras', 'Taboão da Serra', 'SP'),
(606040, 6766361, 'Avenida Laurita Ortega Mari - de 1291/1292 ao fim', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606041, 6766100, 'Rua Lauro da Silva', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606042, 6767240, 'Rua Lázaro Coelho dos Santos', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606043, 6765520, 'Rua Leonardo Jerônimo da Silva', 'Jardim Wanda', 'Taboão da Serra', 'SP'),
(606044, 6766030, 'Rua Leonor Florinda Barutti', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606045, 6757050, 'Rua Leonor Lagreca Faysano', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606046, 6783410, 'Rua Leópolis', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606047, 6763170, 'Rua Levi de Souza e Silva', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(606048, 6790175, 'Rua Doutor Moacyr Rodrigues Filho', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(606049, 6756020, 'Rua Líbia', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606050, 6755327, 'Rua Limeira', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606051, 6755440, 'Avenida Lins', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606052, 6754170, 'Travessa dos Lírios', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606053, 6786040, 'Rua Lisboa', 'Jardim Altos do Taboao', 'Taboão da Serra', 'SP'),
(606054, 6765130, 'Rua Lourdes Mandu da Silva', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606055, 6754000, 'Rua Luciana Mari', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606056, 6765340, 'Rua Luciano Marcos Saturnino', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606057, 6770110, 'Rua Luiz Bartholomeu Antunes', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(606058, 6787020, 'Rua Luiz Batinga de Vasconcelos', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606059, 6786060, 'Rua Luiz Carlos Freitas', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606060, 6784262, 'Rua Luiz Carlos Prestes', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606061, 6775270, 'Rua Luiz Carlos Ventura', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606062, 6774280, 'Rua Luiz Carmine Arcieri', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(606063, 6787240, 'Rua Luiz de Camões', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606064, 6774150, 'Praça Luiz Gonzaga', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606065, 6786000, 'Rua Luiz José da Paixãoo', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606066, 6773190, 'Avenida Luiz Santos Silva', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606067, 6787010, 'Rua Luiz Vaz de Camões', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606068, 6785200, 'Rua Lupicínio Rodrigues', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606069, 6756120, 'Rua Madagascar', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606070, 6784240, 'Rua Madre Abadessa Gertrudes Cecília da Silva Prado', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606071, 6784250, 'Rua Madre Abadessa Rosa de Queiróz Ferreira', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606072, 6765310, 'Rua Mafalda Deolinda Frangolente da Costa', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606073, 6754100, 'Rua das Magnólias', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606074, 6783420, 'Rua Mallet', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606075, 6754120, 'Travessa dos Manacás', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606076, 6775040, 'Rua Manoel Antônio Ferreira', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606077, 6787250, 'Rua Manoel Bandeira', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606078, 6785020, 'Rua Manoel Cassiano de Moraes', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(606079, 6787330, 'Rua Manoel de Nóbrega', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606080, 6773370, 'Rua Manoel Ferreira Granje', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606081, 6773000, 'Rua Manoel Ferreira Júnior', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606082, 6786460, 'Rua Manoel Francisco da Silva', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606083, 6766370, 'Rua Manoel Gonçalves', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606084, 6773090, 'Rua Manoel Leite da Cunha', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606085, 6786300, 'Rua Manoel Maria Fernandes', 'Jardim Elizabete', 'Taboão da Serra', 'SP'),
(606086, 6764435, 'Praça Manoel Martins Pascoal', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606087, 6775540, 'Rua Manoel Matos da Silva Sobrinho Rego', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606088, 6766130, 'Rua Manoel Octaviano Diniz Junqueira Filho', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606089, 6780180, 'Rua Manoel Pereira de Moraes', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(606090, 6755100, 'Rua Manoel Robles Sanches', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(606091, 6766330, 'Rua Marcelino Correia de Mello', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606092, 6765280, 'Rua Marcelo Moraes Cordeiro', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606093, 6775070, 'Rua Marcelo Ribas de Ãvila', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606094, 6785070, 'Rua Marechal Artur da Costa e Silva', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606095, 6775220, 'Rua Marechal Deodoro da Fonseca', 'Jardim Triângulo', 'Taboão da Serra', 'SP'),
(606096, 6783020, 'Rua Marechal Floriano Peixoto', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(606097, 6764140, 'Praça Marechal Humberto de Alencar Castelo Branco', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606098, 6786280, 'Rua Margarida', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(606099, 6770190, 'Rua Margarida Custódia Guedes', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(606100, 6753360, 'Rua das Margaridas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606101, 6764030, 'Rua Maria Abadia dos Santos', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606102, 6786520, 'Rua Maria Alice Borges Ghion', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(606103, 6794050, 'Rua Maria Aparecida Nicoletti', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606104, 6760090, 'Rua Maria Aparecida Pelegrino', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(606105, 6766380, 'Rua Maria Benedita Teixeira Leite', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(606106, 6757140, 'Rua Maria Bento de Lemos', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606107, 6753160, 'Rua Maria Beu Nunes', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(606108, 6775060, 'Rua Maria Cândida Silva', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606109, 6790150, 'Rua Maria Catarina Comino', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606110, 6764090, 'Rua Maria Celina', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606111, 6767120, 'Rua Maria Concessa de Medeiros', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606112, 6774110, 'Rua Maria da Costa Ferreira', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606113, 6775030, 'Rua Maria da Soledade Silva', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606114, 6787070, 'Rua Maria de Lourdes Pinheiro', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606115, 6753240, 'Rua Maria do Carmo Gomes', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(606116, 6753330, 'Rua Maria Filipina de Moura', 'Jardim Taboão', 'Taboão da Serra', 'SP'),
(606117, 6770040, 'Rua Maria Filomena Fazio Perri', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606118, 6753340, 'Rua Maria Francisca da Silva', 'Jardim Taboão', 'Taboão da Serra', 'SP'),
(606119, 6765305, 'Rua Maria Inês', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606120, 6767040, 'Rua Maria José Amaral Arruda Castanho', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606121, 6766240, 'Rua Maria José de Souza Pedreira', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606122, 6764145, 'Alameda Maria José Rego Cordeiro', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606123, 6753085, 'Rua Maria José Teixeira de Freitas', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(606124, 6764420, 'Rua Maria Karachaki Ferras', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(606125, 6764070, 'Rua Maria Lourenço Fernandes', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606126, 6766340, 'Rua Maria Luiza Freitas Silva', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606127, 6770270, 'Rua Maria Madalena Carreiro', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606128, 6755390, 'Rua Maria Mari', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606129, 6790140, 'Rua Maria Olegária Barbosa Lima', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606130, 6773270, 'Rua Maria Passos Teixeira', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606131, 6787480, 'Rua Maria Patrícia da Silva', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(606132, 6783260, 'Rua Maria Rafael da Silva', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606133, 6773330, 'Rua Maria Rita Assunçãoo Ferreira', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606134, 6763385, 'Avenida Maria Rosa', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606135, 6764450, 'Rua Maria Rosa Fernandes', 'Parque Taboão', 'Taboão da Serra', 'SP'),
(606136, 6774090, 'Rua Maria Rosa Fernandes', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606137, 6767180, 'Rua Maria Salustina Cordeiro', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606138, 6753200, 'Rua Maria Simãoo Silva', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(606139, 6767350, 'Rua Maria Smid', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606140, 6755330, 'Rua Maria Valéria de Freitas Cunha', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606141, 6775440, 'Rua Mário de Andrade', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606142, 6764400, 'Rua Mário Gomes', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606143, 6787090, 'Rua Mário João da Silva', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606144, 6767230, 'Rua Mário Latorre', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606145, 6774140, 'Rua Marlene', 'Jardim Marlene', 'Taboão da Serra', 'SP'),
(606146, 6756050, 'Rua Marrocos', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606147, 6787260, 'Rua Marselha', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606148, 6787450, 'Rua Marte', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606149, 6787320, 'Rua Martiro Angelo Derenze', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606150, 6766090, 'Rua Mathilde de Abreu', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606151, 6766260, 'Rua Maurício Antunes Ferraz', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606152, 6753030, 'Alameda Mauro Zelante', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(606153, 6784040, 'Rua Máximo Lino de Almeida', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606154, 6783095, 'Rua Meier', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606155, 6753010, 'Rua Mendes Filho', 'Jardim Caner', 'Taboão da Serra', 'SP'),
(606156, 6756360, 'Rua México', 'Jardim América', 'Taboão da Serra', 'SP'),
(606157, 6773380, 'Rua Miguel Angelo Reina', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606158, 6785120, 'Rua Miguel Carlos Silva', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606159, 6783040, 'Rua Miguel dos Santos Pelegrino', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(606160, 6775210, 'Rua Miguel Jorge', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(606161, 6767160, 'Rua Milton Inocêncio', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606162, 6786360, 'Rua Milton Martins Moura', 'Vila Francisco Remeikis', 'Taboão da Serra', 'SP'),
(606163, 6754130, 'Travessa Mimosas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606164, 6757080, 'Rua Sandra Lúcia Figueira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606165, 6767030, 'Rua dos Miosótis', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606166, 6755025, 'Rua Miquelina Túlio Christillo', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606167, 6790090, 'Rua Miracatu', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606168, 6774340, 'Rua Pastor Missionários do Divino', 'Jardim Maria da Costa', 'Taboão da Serra', 'SP'),
(606169, 6756290, 'Rua Moçambique', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606170, 6785250, 'Rua Monteiro Lobato', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606171, 6767060, 'Rua Murilo Faraco', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606172, 6764260, 'Rua Hassam Riman', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606173, 6770060, 'Rua Naokiti Yamahata', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606174, 6775250, 'Rua Natanael Cesar', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(606175, 6765070, 'Rua Nazareth Alves Tavares', 'Jardim Helena', 'Taboão da Serra', 'SP'),
(606176, 6787080, 'Rua Nazir Miguel', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606177, 6767080, 'Rua Nelson Martins Moura', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606178, 6786200, 'Rua Nelson Yoshitaka Seo', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606179, 6783350, 'Rua Nereu Ramos', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(606180, 6765240, 'Rua Neusa Demétrio', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606181, 6775120, 'Rua Neusa Moreira dos Santos', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606182, 6763490, 'Praça Nicola Vivilechio', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(606183, 6770300, 'Rua Nicolau Gentile', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606184, 6763230, 'Rua Nicolino Bentivegna', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(606185, 6756300, 'Rua Nigéria', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606186, 6783010, 'Rua Nilo Peçanha', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(606187, 6765400, 'Rua Nilton Bertani dos Santos', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606188, 6785260, 'Rua Noel Rosa', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606189, 6775180, 'Rua Noêmia Maciel Barbosa', 'Jardim Triângulo', 'Taboão da Serra', 'SP'),
(606190, 6756140, 'Rua Nossa Senhora do Cenáculo', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606191, 6784050, 'Rua Novo Hamburgo', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606192, 6767340, 'Rua Ojiro Takeuti', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606193, 6766310, 'Rua Olavo Pezzotti', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606194, 6784264, 'Rua Olga Benário', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606195, 6765370, 'Rua Olímpia Thomaz de Aquino', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606196, 6765210, 'Rua Olinda', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606197, 6770180, 'Rua Oliveira de Caldas Ribeiro', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(606198, 6756310, 'Rua Ã”nix', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606199, 6763055, 'Rua Orestes Balarini', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(606200, 6766170, 'Rua Orlando Albuquerque Orlandino', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606201, 6757190, 'Rua Orlando Fernando Gabriel da Costa', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606202, 6785150, 'Rua Orlando Silva', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606203, 6754145, 'Rua das Orquídeas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606204, 6775530, 'Rua Osmar Antônio da Silva', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606205, 6763210, 'Rua Osmar Pires de Oliveira', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606206, 6787270, 'Avenida Osório Duque Estrada', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606207, 6753090, 'Rua Daniel Cavalcante de Meireles', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606208, 6775200, 'Rua Osvaldo Luiz da Silva', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(606209, 6785000, 'Rua Oswaldo Saad', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(606210, 6765290, 'Rua Ourinhos', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606211, 6755250, 'Rua Ourinhos', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606212, 6787430, 'Rua Ozimo Sales de Menezes', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606213, 6786240, 'Rua Padre Bento Dias Pacheco', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606214, 6783210, 'Rua Palhoça', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606215, 6766350, 'Rua Palmares', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606216, 6754180, 'Travessa das Palmas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606217, 6756460, 'Rua Panamá', 'Jardim América', 'Taboão da Serra', 'SP'),
(606218, 6775290, 'Avenida Fernando Fernandes', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606219, 6765095, 'Rua Papa João Paulo I', 'Jardim Guayana', 'Taboão da Serra', 'SP'),
(606220, 6756390, 'Rua Paraguai', 'Jardim América', 'Taboão da Serra', 'SP'),
(606221, 6757090, 'Rua Paraná', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606222, 6765105, 'Rua Paranaguá', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606223, 6783430, 'Rua Francisco Floreal Peres', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606224, 6794070, 'Praça Parnaso', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606225, 6766120, 'Rua Paschoal Antônio Politano', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606226, 6790300, 'Rua das Patativas', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606227, 6765317, 'Rua Patrícia Lúcia de Souza', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606228, 6755240, 'Rua Paulina Ortega', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606229, 6765360, 'Rua Paulino Nunes', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606230, 6786070, 'Rua Paulo Augusto de Andrade', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606231, 6767220, 'Avenida Paulo Ayres', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606232, 6765320, 'Rua Paulo Camalionte', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606233, 6766060, 'Rua Paulo de Araújo', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606234, 6785060, 'Rua Paulo Meneguette', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606235, 6770240, 'Rua Paulo Oliveira', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606236, 6780170, 'Rua Paulo Portmann', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(606237, 6763390, 'Rua Paulo Sérgio Inácio', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606238, 6790120, 'Rua Pederneiras', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606239, 6765410, 'Rua Pedra Cavalheiro da Silva', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606240, 6763290, 'Rua Pedro Borba', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606241, 6765090, 'Rua Pedro Dvolatka', 'Jardim Helena', 'Taboão da Serra', 'SP'),
(606242, 6763360, 'Rua Pedro Gomes da Mota', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606243, 6760000, 'Rua Pedro Gonçalves', 'Jardim Pedro Gonçalves', 'Taboão da Serra', 'SP'),
(606244, 6754150, 'Rua Pedro Mari', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606245, 6767050, 'Rua Pedro Parejo Rojas', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606246, 6766295, 'Rua Pedro Pio Ferreira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606247, 6774050, 'Rua Peroba', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(606248, 6760060, 'Rua Philomena Vivilechio', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(606249, 6790310, 'Rua dos Pintassilgos', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606250, 6780030, 'Rua Piracicaba', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606251, 6780150, 'Rua Pirassununga', 'Núcleo Residencial Isabela', 'Taboão da Serra', 'SP'),
(606252, 6794080, 'Alameda Polimia', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606253, 6765480, 'Rua Porfírio Herdeiro', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606254, 6767250, 'Rua Porfírio José de Miranda Ramos', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606255, 6787280, 'Rua Poxoréu', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606256, 6765160, 'Rua Prazeres Gonçalves Pereira', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606257, 6756170, 'Rua Preciosa', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606258, 6765345, 'Avenida Presidente Epitácio', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606259, 6775395, 'Rua Primeiro de Janeiro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606260, 6766290, 'Rua Procópio Ferreira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606261, 6780300, 'Rua Professor Daijiro Matsuda', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606262, 6764100, 'Rua Professor João D Ella', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606263, 6763070, 'Rua Prudência Barbosa Grotte', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606264, 6785510, 'Rua Everaldo Batista Barbosa', 'Jardim São Luiz', 'Taboão da Serra', 'SP'),
(606265, 6753110, 'Praça Quinze de Novembro', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606266, 6775360, 'Rua Quinze de Novembro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606267, 6780000, 'Rua Quinze de Outubro', 'Vila Iasi', 'Taboão da Serra', 'SP'),
(606268, 6765350, 'Rua Rafael de Marco', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606269, 6754220, 'Rua Rafael Jurado Navas', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(606270, 6757210, 'Rua Raimunda Nascimento de Oliveira', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606271, 6787160, 'Rua Record', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606272, 6766025, 'Rua Regente Feijão', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606273, 6768000, 'Rodovia Regis Bittencourt - do km 268,000 ao km 270,001', 'Centro', 'Taboão da Serra', 'SP'),
(606274, 6768100, 'Rodovia Regis Bittencourt - do km 270,002 ao km 271,001', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606275, 6768200, 'Rodovia Regis Bittencourt - do km 271,002 ao km 272,001', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606276, 6793000, 'Rodovia Regis Bittencourt - do km 272,002 ao km 273,001', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(606277, 6793100, 'Rodovia Regis Bittencourt - do km 273,002 ao km 274,001', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606278, 6793200, 'Rodovia Regis Bittencourt - do km 274,002 ao km 275,001', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606279, 6787350, 'Rua Reinaldo da Silva', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606280, 6784200, 'Rua Restinga Seca', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606281, 6755255, 'Rua Ribeirãoo Preto', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606282, 6780190, 'Rua Ribeirãoo Preto', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606283, 6773110, 'Rua Ricardo Kinorick', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606284, 6770020, 'Rua Rinnossuke Tiba', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606285, 6780240, 'Rua Rio Claro', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606286, 6757290, 'Rua Rio de Janeiro', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606287, 6775390, 'Rua Rio de Janeiro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606288, 6757110, 'Rua Rio Grande do Sul', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606289, 6786160, 'Rua Roberto Márcio Torres', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606290, 6784320, 'Rua Roberto Paschoal Ignácio', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(606291, 6756060, 'Rua Rodésia', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606292, 6764320, 'Rua Rodolfo Balarini', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(606293, 6764340, 'Rua Rodolfo Schult', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606294, 6783360, 'Rua Rodrigues Alves', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(606295, 6764460, 'Rua Rogério', 'Jardim Henriqueta', 'Taboão da Serra', 'SP'),
(606296, 6784210, 'Rua João Pereira dos Santos', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606297, 6786320, 'Rua Ronaldo Jesus Lentisco', 'Jardim Elizabete', 'Taboão da Serra', 'SP'),
(606298, 6757150, 'Rua Rondônia', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606299, 6765010, 'Rua Rosalina Schultz', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606300, 6763030, 'Rua RoSário Inserra', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(606301, 6753437, 'Rua das Rosas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606302, 6774330, 'Rua Rui Barbosa', 'Jardim Maria da Costa', 'Taboão da Serra', 'SP'),
(606303, 6773160, 'Rua Ryoji Ido', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606304, 6767210, 'Rua Sabiá', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606305, 6790270, 'Rua dos Sabiás', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606306, 6783080, 'Rua Sadayoshi Satto', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606307, 6756180, 'Rua Safira', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606308, 6787460, 'Rua Salete', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606309, 6783140, 'Rua Salinas', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606310, 6760100, 'Rua Salvador Branco de Andrade', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(606311, 6755010, 'Rua Salvador Peluso Basile', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606312, 6773280, 'Rua Samuel Wainer', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606313, 6757100, 'Rua Santa Catarina', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606314, 6787300, 'Rua Santa Luzia', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606315, 6754005, 'Rua Santa Luzia', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606316, 6763495, 'Praça Santa Terezinha', 'Centro', 'Taboão da Serra', 'SP'),
(606317, 6790220, 'Rua Santina Alves de Franca', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(606318, 6775500, 'Rua Santo Antero Porto Martins', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606319, 6780010, 'Rua Santo Antônio', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606320, 6775430, 'Rua Santo Antônio', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606321, 6755180, 'Rua Santo Antônio de Pádua', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606322, 6755185, 'Rua Santo Onofre', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606323, 6755450, 'Rua Santos', 'Parque Residencial Mônica', 'Taboão da Serra', 'SP'),
(606324, 6785030, 'Rua Santos Dias', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(606325, 6753105, 'Rua Santos Dumont', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606326, 6764290, 'Estrada São Francisco', 'Jardim Henriqueta', 'Taboão da Serra', 'SP'),
(606327, 6775460, 'Rua São Francisco', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606328, 6780020, 'Rua São Gabriel', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606329, 6775420, 'Rua São Geraldo', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606330, 6755220, 'Rua São Gerônimo', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606331, 6755170, 'Rua São Gonçalo', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606332, 6775480, 'Rua São José', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606333, 6756070, 'Rua São José', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606334, 6775320, 'Rua São Luiz', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606335, 6755187, 'Rua São Marcos', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606336, 6757170, 'Avenida São Paulo', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606337, 6775400, 'Rua São Pedro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606338, 6784060, 'Rua Sapiranga', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606339, 6784390, 'Rua Sapucaia do Sul', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606340, 6784070, 'Rua Sarandi', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606341, 6786480, 'Rua Sati Nakamura', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606342, 6795030, 'Rua SebasTião de Souza Silva', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(606343, 6786140, 'Rua SebasTião Francisco dos Santos', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606344, 6775140, 'Rua SebasTião Paulino Teixeira', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606345, 6773340, 'Rua SebasTião Tibúrcio Gonçalves', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606346, 6784085, 'Rua Seberi', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606347, 6785530, 'Rua Celina Maria de Jesus Gomes', 'Jardim São Luiz', 'Taboão da Serra', 'SP'),
(606348, 6765312, 'Rua Senador Teotônio Vilela', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606349, 6756420, 'Rua Senegal', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606350, 6785110, 'Rua Sérgio Cardoso', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606351, 6764395, 'Praça Sérgio do Nascimento Júnior', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606352, 6785220, 'Rua Sérgio Porto', 'Jardim Santo Onofre', 'Taboão da Serra', 'SP'),
(606353, 6753135, 'Praça Sete de Setembro', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606354, 6775340, 'Rua Sete de Setembro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606355, 6786005, 'Rua Setubal', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606356, 6773260, 'Rua Siderópolis', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606357, 6774040, 'Rua Sílvia', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(606358, 6783300, 'Rua Silvino Alves Costa', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606359, 6765215, 'Rua Sílvio', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606360, 6765500, 'Rua Sílvio Gentil', 'Vila Sônia do Taboão', 'Taboão da Serra', 'SP'),
(606361, 6773400, 'Rua Sílvio Pinto Sampaio', 'Jardim Sílvio Sampaio', 'Taboão da Serra', 'SP'),
(606362, 6766070, 'Rua Sima Judkiewicz', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606363, 6766250, 'Rua Sinésio Henrique Pedreira', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606364, 6764270, 'Rua Sitrangulo', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606365, 6787050, 'Rua Sud Mennucci', 'Jardim Maria Helena', 'Taboão da Serra', 'SP'),
(606366, 6756030, 'Rua Marino Martins de Oliveira', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606367, 6783310, 'Rua Sueli Coelho Geraldo', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606368, 6753235, 'Praça Suez', 'Jardim Kuabara', 'Taboão da Serra', 'SP'),
(606369, 6765220, 'Rua Tabatinga', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606370, 6764190, 'Rua Taboão da Serra', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606371, 6754080, 'Largo do Taboão', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606372, 6794090, 'Alameda Tália', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606373, 6774095, 'Rua Tamboara', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606374, 6770070, 'Rua Tamekishi Shirasawa', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606375, 6765315, 'Rua Tancredo Neves', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606376, 6756040, 'Rua Tanzânia', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606377, 6775410, 'Rua Tarcila do Amaral', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606378, 6783230, 'Estrada Tenente José Maria da Cunha', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606379, 6755350, 'Rua Tenente SebasTião Soares', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606380, 6753115, 'Rua Teodoro Bayma', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606381, 6766080, 'Rua Teodoro de Campos', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606382, 6780100, 'Praça Teodoro Franco', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606383, 6765307, 'Rua Teófilo Otoni', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606384, 6783005, 'Avenida Teotônio Brandão Vilela', 'Jardim Triângulo', 'Taboão da Serra', 'SP'),
(606385, 6794100, 'Alameda Ter Psicore', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606386, 6775520, 'Rua Tereza Montez Sanches', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606387, 6755110, 'Rua Tereza TreviSão Bazolli', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(606388, 6754190, 'Rua do Tesouro', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(606389, 6783440, 'Rua Tibor Heller', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(606390, 6795005, 'Rua Tom Jobim', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(606391, 6756160, 'Rua Topázio', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606392, 6784220, 'Rua Torres', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606393, 6785500, 'Rua Laudeniz Santos Porfírio', 'Jardim São Luiz', 'Taboão da Serra', 'SP'),
(606394, 6784230, 'Rua Vladimir Herzog', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606395, 6770080, 'Rua Tsuruki Tsuno', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606396, 6753410, 'Rua das Tulipas', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606397, 6795020, 'Rua Ubatuba', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(606398, 6790180, 'Rua Ubirajara Otávio de Oliveira', 'Jardim Mirna', 'Taboão da Serra', 'SP'),
(606399, 6756190, 'Rua Uganda', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606400, 6790290, 'Rua dos Uirapurus', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606401, 6765150, 'Rua Umberto Furlan', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606402, 6770310, 'Rua Uniflor', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606403, 6794110, 'Alameda Urânia', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606404, 6756450, 'Rua Uruguai', 'Jardim América', 'Taboão da Serra', 'SP'),
(606405, 6764200, 'Praça Uruguai', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606406, 6775170, 'Rua Valente', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(606407, 6757310, 'Rua Aurélio Buarque de Holanda', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606408, 6755040, 'Rua Vicente Celestino', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606409, 6786510, 'Rua Vicente Leporace', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606410, 6765110, 'Rua Vicente Ordari Braz', 'Jardim Oliveiras', 'Taboão da Serra', 'SP'),
(606411, 6766020, 'Rua Vicente Pereira', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606412, 6764020, 'Rua Vicente Politano', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606413, 6763120, 'Rua Vicente Sewaybricker', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606414, 6766430, 'Rua Victor Campise', 'Parque Industrial das Oliveiras', 'Taboão da Serra', 'SP'),
(606415, 6775090, 'Rua Vinícius de Moraes', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606416, 6775350, 'Rua Vinte e Cinco de Dezembro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606417, 6775380, 'Rua Vinte e Cinco de Janeiro', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606418, 6753145, 'Praça Vinte e Um de Abril', 'Jardim Pazini', 'Taboão da Serra', 'SP'),
(606419, 6783200, 'Rua Virgílio Bento de Queiróz', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606420, 6757180, 'Rua Virgínia Lopes Tavares', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606421, 6767170, 'Rua Virgínia Plascidina da Conceiçãoo', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606422, 6766140, 'Rua Virgínia Polzato Pereira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606423, 6786100, 'Rua Vitória Maria de Jesus', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606424, 6770330, 'Rua Vitório Bianchi', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606425, 6773150, 'Rua Waldemar Lopes Ferraz', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606426, 6763320, 'Rua Waldemar Tracchi', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606427, 6775020, 'Rua Waldomiro Custódio', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606428, 6763020, 'Rua Waldomiro Gabriel de Mello', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(606429, 6783370, 'Rua Washington Luís', 'Vila Mafalda', 'Taboão da Serra', 'SP'),
(606430, 6756320, 'Rua Yoshiharu Agawa', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606431, 6757040, 'Rua Yuki Tiba', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606432, 6783125, 'Rua Zeicy Aparecida N Batista', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606433, 6763265, 'Rua Zila de Almeida', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606434, 6790050, 'Rua Zioudu Benedito Romanini', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606435, 6766220, 'Rua Amândio do Nascimento', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606436, 6766160, 'Rua Benedito Afonso Siqueira', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606437, 6764000, 'Praça Colombia', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606438, 6785390, 'Rua Islândia', 'Parque Industrial Daci', 'Taboão da Serra', 'SP'),
(606439, 6766050, 'Rua Nae Minei', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606440, 6757120, 'Rua Pará', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606441, 6764250, 'Rua Quintiliano José', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606442, 6773060, 'Rua SebasTião Moraes Camargo', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606443, 6755175, 'Rua Vilobaldo Barros de Macedo', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(606444, 6756200, 'Rua Agata', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606445, 6774220, 'Rua Ângela Rosa Dias', 'Jardim Mituzi', 'Taboão da Serra', 'SP'),
(606446, 6755160, 'Rua Argemiro Honorato de Aquino', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(606447, 6774030, 'Rua Caneleira', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(606448, 6763190, 'Rua Elizabeta Lips', 'Jardim Bom Tempo', 'Taboão da Serra', 'SP'),
(606449, 6783190, 'Rua Engenho Novo', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606450, 6764440, 'Rua Helena Duarte Silva', 'Parque Taboão', 'Taboão da Serra', 'SP'),
(606451, 6774010, 'Avenida Jacarandá', 'Parque Jacarandá', 'Taboão da Serra', 'SP'),
(606452, 6773240, 'Rua José Carlos Pace', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606453, 6774250, 'Rua Katsumi Hoshino', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(606454, 6756100, 'Rua Luanda', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606455, 6785095, 'Rua Manoel Bento', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606456, 6790070, 'Avenida Marechal Castelo Branco', 'Jardim Três Marias', 'Taboão da Serra', 'SP'),
(606457, 6764410, 'Rua Maria Francisca de Jesus', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606458, 6795050, 'Rua Adãoo José Ferreira', 'Parque Laguna', 'Taboão da Serra', 'SP'),
(606459, 6773140, 'Rua Paulo Manzano Castilho', 'Jardim Leme', 'Taboão da Serra', 'SP'),
(606460, 6754050, 'Rua Senador Felinto Mueller', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(606461, 6774160, 'Rua Terra Rica', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606462, 6786340, 'Rua Alfonso Gaeta', 'Jardim Elizabete', 'Taboão da Serra', 'SP'),
(606463, 6766000, 'Rua Antônio Firmino Alves', 'Jardim Irapua', 'Taboão da Serra', 'SP'),
(606464, 6764370, 'Rua Beatriz Eliza', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606465, 6767280, 'Estrada Benedito CeSário de Oliveira - até 1101/1102', 'Vila Iasi', 'Taboão da Serra', 'SP'),
(606466, 6767281, 'Estrada Benedito CeSário de Oliveira - de 1103/1104 ao fim', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606467, 6754040, 'Rua do Carmo', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606468, 6790280, 'Rua dos Curiás', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606469, 6787340, 'Rua Esmeralda', 'Jardim Salete', 'Taboão da Serra', 'SP'),
(606470, 6770200, 'Rua Flávio Dohoczki', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(606471, 6757230, 'Rua Garibaldi', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606472, 6786430, 'Rua Indiana', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606473, 6753050, 'Rua Joana Haller', 'Jardim Santa Terezinha', 'Taboão da Serra', 'SP'),
(606474, 6763310, 'Rua João Domingues', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606475, 6775130, 'Rua José Roberto de Souza', 'Jardim Roberto', 'Taboão da Serra', 'SP'),
(606476, 6775240, 'Rua Luiz Câmara Cascudo', 'Jardim Guaciara', 'Taboão da Serra', 'SP'),
(606477, 6786020, 'Rua Mário Nistico', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606478, 6754160, 'Praça Miguel Ortega', 'Parque Assunçãoo', 'Taboão da Serra', 'SP'),
(606479, 6763280, 'Rua Nair Marques de Souza', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606480, 6786050, 'Rua Osmar da Silva Ribeiro', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606481, 6785170, 'Rua Prata', 'Jardim Panorama', 'Taboão da Serra', 'SP'),
(606482, 6786470, 'Rua Reynaldo Restivo', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606483, 6767140, 'Rua Rosa Provencial Delgado', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606484, 6775330, 'Rua São Paulo', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606485, 6780250, 'Rua Sorocaba', 'Arraial Paulista', 'Taboão da Serra', 'SP'),
(606486, 6764050, 'Praça Venezuela', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606487, 6755380, 'Rua Vitório D''Amico', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606488, 6756210, 'Rua Ametista', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606489, 6763050, 'Rua Aracy Ribeiro de Toledo', 'Chácara Agrindus', 'Taboão da Serra', 'SP'),
(606490, 6757175, 'Rua Bueno Brandão', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606491, 6786080, 'Rua Chico Mendes', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(606492, 6763300, 'Rua Dolores Lopes Perez', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606493, 6756150, 'Rua Duala', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606494, 6764310, 'Rua Francisco dos Santos', 'Jardim Três Irmãoos', 'Taboão da Serra', 'SP'),
(606495, 6783090, 'Rua Giuseppina Comino', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606496, 6786410, 'Rua Guararema', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(606497, 6760080, 'Rua Joaquim Xavier', 'Jardim São Miguel', 'Taboão da Serra', 'SP'),
(606498, 6763140, 'Rua Josefina Luize de Moraes', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606499, 6785040, 'Rua Luiz Queiróz', 'Jardim Scândia', 'Taboão da Serra', 'SP'),
(606500, 6757200, 'Rua Emica Noguti Seo', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606501, 6755065, 'Rua Maria José Assis Ferreira', 'Jardim Ouro Preto', 'Taboão da Serra', 'SP'),
(606502, 6765230, 'Rua Octávio dos Santos', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606503, 6786090, 'Rua da Pátria', 'Jardim Margarida', 'Taboão da Serra', 'SP'),
(606504, 6770120, 'Rua Sueli Máximo Matos', 'Jardim Iracema', 'Taboão da Serra', 'SP'),
(606505, 6773050, 'Rua Albano Leite da Fonseca', 'Jardim Suína', 'Taboão da Serra', 'SP'),
(606506, 6756240, 'Rua Angola', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606507, 6757220, 'Rua Antônio Francisco de Azevedo Filho', 'Cidade Intercap', 'Taboão da Serra', 'SP'),
(606508, 6770230, 'Rua Basila Oliveira Ferreira', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606509, 6790260, 'Rua dos Canários', 'Parque das Cigarreiras', 'Taboão da Serra', 'SP'),
(606510, 6754070, 'Rua Comendador Angelo Rinaldi', 'Parque Santos Dumont', 'Taboão da Serra', 'SP'),
(606511, 6756000, 'Rua Egito', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606512, 6756350, 'Rua Equador', 'Jardim América', 'Taboão da Serra', 'SP'),
(606513, 6773030, 'Rua Felisbela Oliveira Ferreira Missumos', 'Parque São Joaquim', 'Taboão da Serra', 'SP'),
(606514, 6774100, 'Rua Hermínio de Jesus Madeira', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606515, 6784090, 'Rua Alecrim', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606516, 6784030, 'Rua Jacutinga', 'Jardim Record', 'Taboão da Serra', 'SP'),
(606517, 6763450, 'Rua João Batista de Oliveira', 'Centro', 'Taboão da Serra', 'SP'),
(606518, 6770010, 'Rua José Francisco Neves', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606519, 6763260, 'Rua José Pedro Rocha', 'Jardim Maria Rosa', 'Taboão da Serra', 'SP'),
(606520, 6783280, 'Rua Luiz Antônio de Andrade Vieira', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606521, 6774300, 'Rua Manoel Ferreira Torres do Granja', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(606522, 6774130, 'Rua Maria Vieira das Dores', 'Vila Carmelina Gonçalves', 'Taboão da Serra', 'SP'),
(606523, 6794060, 'Alameda Melpomene', 'Condomínio Iolanda', 'Taboão da Serra', 'SP'),
(606524, 6756005, 'Rua Oshiharu Ogawa', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606525, 6784300, 'Rua Paulo VI', 'Jardim Freitas Júnior', 'Taboão da Serra', 'SP'),
(606526, 6787170, 'Rua Odete Domingues Marques', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606527, 6780280, 'Rua Raphael Giannotti', 'Jardim Bonanza', 'Taboão da Serra', 'SP'),
(606528, 6774260, 'Rua Rogério Nuvolara', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(606529, 6765000, 'Estrada São Francisco - até 1954/1955', 'Parque Taboão', 'Taboão da Serra', 'SP'),
(606530, 6765001, 'Estrada São Francisco - de 1956/1957 ao fim', 'Jardim Wanda', 'Taboão da Serra', 'SP'),
(606531, 6764430, 'Rua Shigueki Kadumoto', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606532, 6754010, 'Rua Thereza Maria Luizetto', 'Vila Santa Luzia', 'Taboão da Serra', 'SP'),
(606533, 6756110, 'Rua Tunísia', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606534, 6765165, 'Rua Visconde de Mauá', 'Parque Marabá', 'Taboão da Serra', 'SP'),
(606535, 6775005, 'Estrada das Olarias', 'Jardim Triângulo', 'Taboão da Serra', 'SP'),
(606536, 6780220, 'Rua Atibaia', 'Vila Iasi', 'Taboão da Serra', 'SP'),
(606537, 6775151, 'Rua Maria Henriqueta Inácio Baptista', 'Jardim Pirajussara', 'Taboão da Serra', 'SP'),
(606538, 6785345, 'Rua João Floriano', 'Jardim São João', 'Taboão da Serra', 'SP'),
(606539, 6784288, 'Rua Izaias Félix dos Santos', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606540, 6784293, 'Rua Neuza Dias de Souza', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606541, 6784295, 'Rua Elis Regina', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606542, 6784298, 'Rua Vladimir Herzog', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606543, 6784278, 'Rua Renato Russo', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606544, 6784283, 'Rua Cora Coralina', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606545, 6784285, 'Rua Nossa Senhora Aparecida', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606546, 6784292, 'Rua Jocelina Celestina Pereira', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606547, 6787500, 'Rua Padre Cícero', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606548, 6787505, 'Rua Carlos Drumond de Andrade', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606549, 6787510, 'Rua José Bueno', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606550, 6787515, 'Rua Antônio Celestino de Deus', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606551, 6787520, 'Rua José Duarte Souza', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606552, 6787525, 'Rua Frei Galvão', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606553, 6787530, 'Rua Frei Damiãoo', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606554, 6787535, 'Rua Vereador Modesto Nazaré Silva', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606555, 6787540, 'Rua Miguel Pinheiro da Silva', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606556, 6787545, 'Rua Madre Tereza de Calcutá', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606557, 6787550, 'Rua Josefa Gonçalves', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606558, 6787555, 'Rua Manoel Mendes Gouveia', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606559, 6787560, 'Rua José de Caldas Ribeiro', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606560, 6787565, 'Rua Antônio Gonçalves Martins', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606561, 6787570, 'Alameda Prata', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606562, 6787575, 'Rua Aloísio Antônio Carvalho', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606563, 6787580, 'Rua Caoby José Soares', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606564, 6787585, 'Rua Joana Bandeira', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606565, 6787590, 'Rua Plínio Marcos', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606566, 6787595, 'Rua João Reis Lacerda', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606567, 6787600, 'Rua João José dos Reis', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606568, 6787605, 'Rua Gabriel Feres', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606569, 6787610, 'Rua Maria Irene de Oliveira Silva', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606570, 6787615, 'Rua José Barbosa', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606571, 6787620, 'Rua Luzia Hellmeister Jurado', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606572, 6787623, 'Rua Philomena Parrillo de Oliveira', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606573, 6787625, 'Rua Maria do RoSário Souza', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606574, 6787630, 'Rua Arlindo Marques das Neves', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606575, 6787635, 'Rua Salvador Panza', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606576, 6787640, 'Rua Carmelita Costa Nóbrega', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606577, 6787645, 'Rua Joana Princesa de Jesus', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606578, 6787650, 'Rua Walter José Domingues', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606579, 6787655, 'Rua João Bazzoli', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606580, 6787660, 'Rua Maria Vieira Fernandes', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606581, 6787665, 'Rua Antônio Teles de Oliveira', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606582, 6787670, 'Rua Hosuke Hataka', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606583, 6787675, 'Rua José Augusto Domingos', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606584, 6787680, 'Rua Cato Sabulo Kitagawa', 'Jardim Saint Moritz', 'Taboão da Serra', 'SP'),
(606585, 6786075, 'Rua Maria José Luizetto Buscarini', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606586, 6786298, 'Rua Alice Ferreira de Menezes', 'Conjunto Residencial Belo Horizonte', 'Taboão da Serra', 'SP'),
(606587, 6755225, 'Rua Pedro Pedrãoo', 'Jardim Santa Rosa', 'Taboão da Serra', 'SP'),
(606588, 6775463, 'Viela SebasTião Tomás Vilela', 'Jardim São Salvador', 'Taboão da Serra', 'SP'),
(606589, 6766135, 'Alameda Miguel Prestes Ferraz', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606590, 6765084, 'Rua Papa Paulo VI', 'Jardim Nova Esperança', 'Taboão da Serra', 'SP'),
(606591, 6783055, 'Alameda da Paz', 'Jardim Saporito', 'Taboão da Serra', 'SP'),
(606592, 6767135, 'Alameda Delfino Barbosa Pacheco', 'Parque Pinheiros', 'Taboão da Serra', 'SP'),
(606593, 6783285, 'Alameda Ibituva', 'Jardim Trianon', 'Taboão da Serra', 'SP'),
(606594, 6774255, 'Alameda Nobelino Pereira Machado', 'Jardim Santa Cruz', 'Taboão da Serra', 'SP'),
(606595, 6764445, 'Rua Santina CeSário Roque', 'Parque Taboão', 'Taboão da Serra', 'SP'),
(606596, 6764355, 'Rua Vazili Crivoli', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606597, 6770175, 'Rua Valter Belisqui', 'Jardim Maria Luiza', 'Taboão da Serra', 'SP'),
(606598, 6764365, 'Rua Nestor de Andrade', 'Jardim Beatriz', 'Taboão da Serra', 'SP'),
(606599, 6755385, 'Rua Turíbio Antônio de Castilho', 'Parque Monte Alegre', 'Taboão da Serra', 'SP'),
(606600, 6756015, 'Rua Roberta Simões Souza', 'Jardim Monte Alegre', 'Taboão da Serra', 'SP'),
(606601, 6770135, 'Alameda Osvaldino José de Souza', 'Parque Iracema', 'Taboão da Serra', 'SP'),
(606602, 6765085, 'Rua Vicente Buscarini', 'Jardim Nova Esperança', 'Taboão da Serra', 'SP'),
(606603, 6765098, 'Rua Presidente Ulisses Guimarãoes', 'Jardim Nova Esperança', 'Taboão da Serra', 'SP'),
(606604, 6770305, 'Viela Zenoli', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606605, 6784436, 'Rua Mário da Silva Pina', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606606, 6784434, 'Rua Moisés Laje Primo', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606607, 6784432, 'Rua Onofre Macedo', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606608, 6784430, 'Rua SebasTião da Cruz Jarilo', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606609, 6784428, 'Rua Benjamim Varandas', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606610, 6784426, 'Rua Maria D''Alva Aguiar', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606611, 6784424, 'Rua Pedro Pauluk', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606612, 6784422, 'Rua Celina Lopes Muller', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606613, 6784420, 'Rua José Henrique Oliveira', 'Jardim Vitória', 'Taboão da Serra', 'SP'),
(606614, 6786550, 'Rua Arujá', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606615, 6786553, 'Rua Palmital', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606616, 6786555, 'Rua Santina Quirino de Abreu Martinez', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606617, 6786558, 'Rua José Romãoo Gabriel', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606618, 6786560, 'Rua Antônio Vidal da Silva', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606619, 6786563, 'Rua Isaura Magalhães', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606620, 6786565, 'Rua Carlos Justino Lachi', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606621, 6786568, 'Rua Paulino de Moraes', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606622, 6786570, 'Rua Louveira', 'Jardim Comunitário', 'Taboão da Serra', 'SP'),
(606623, 6786515, 'Rua Vicente Pires dos Santos', 'Jardim São Judas Tadeu', 'Taboão da Serra', 'SP'),
(606624, 6763462, 'Avenida Jorge Amado', 'Jardim da Glória', 'Taboão da Serra', 'SP'),
(606625, 6775004, 'Rua Karla Cristina Pelegrina de Souza', 'Jardim Clementino', 'Taboão da Serra', 'SP'),
(606626, 6786441, 'Rua Dom Helder Câmara', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606627, 6786443, 'Rua Engenheiro Milton Miguel de Paiva Bueno', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606628, 6786445, 'Rua Maria Izaura Souza', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606629, 6786447, 'Rua Maria Leocádia da Nóbrega', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606630, 6786449, 'Rua Alice Ferreira de Menezes', 'Vila Indiana', 'Taboão da Serra', 'SP'),
(606631, 6765175, 'Rua Gabriel Donizete Barbosa Rodrigues', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606632, 6765185, 'Rua Marcos César Gonzaga', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606633, 6765195, 'Rua Moacir Lucas da Costa', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606634, 6765235, 'Rua AbÍlio Antônio Moacir de Souza Rodrigues', 'Jardim São Mateus', 'Taboão da Serra', 'SP'),
(606635, 6784297, 'Rua Paulo Freire', 'Sítio das Madres', 'Taboão da Serra', 'SP'),
(606636, 6764431, 'Alameda Humberta Hermes', 'Parque Albina', 'Taboão da Serra', 'SP'),
(606637, 6780245, 'Praça José Franco', 'Arraial Paulista', 'Taboão da Serra', 'SP');


/*
  CEPs para Embu das Artes
*/
insert into tbl_endereco (id, cep, logradouro, bairro, cidade, estado) VALUES
(457259, 6814335, 'Rua Louveira', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457260, 6810690, 'Servidãoo A', 'Vila Regina', 'Embu das Artes', 'SP'),
(457261, 6805070, 'Rua Abel', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457262, 6804080, 'Rua Adelardo Caiuby', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457263, 6805090, 'Rua Abraão', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457264, 6817030, 'Rua das Acácias', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(457265, 6805330, 'Via das Acácias', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457266, 6810150, 'Rua das Adálias', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457267, 6823400, 'Rua Adamantina', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457268, 6803170, 'Rua dos Advogados', 'Embuema', 'Embu das Artes', 'SP'),
(457269, 6833030, 'Rua Afonso Desidério', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457270, 6820120, 'Rua Afonso Pena', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457271, 6840290, 'Rua Ãgata', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457272, 6806070, 'Rua dos Agricultores', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457273, 6803160, 'Rua dos Agrônomos', 'Embuema', 'Embu das Artes', 'SP'),
(457274, 6813230, 'Rua Ãgua Branca', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457275, 6823590, 'Rua Águas de São Pedro', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457276, 6835080, 'Estrada Louis Pasteur', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457277, 6840295, 'Rua Águas Marinhas', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457278, 6815000, 'Avenida Aimará', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457279, 6804270, 'Rua Alagoas', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457280, 6807461, 'Rua Alberto Correia Francfort', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457281, 6805311, 'Largo Alcaide', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457282, 6807510, 'Rua Alemanha', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457283, 6803045, 'Rua Alexandre Kadunc', 'Centro', 'Embu das Artes', 'SP'),
(457284, 6805245, 'Rua do Alferes', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457285, 6804130, 'Rua Alfredo Volpi', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457286, 6803300, 'Rua Almeida Júnior', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457287, 6826130, 'Rua Alvarenga Peixoto', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457288, 6805300, 'Rua do Alvar', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457289, 6823010, 'Rua Alvorada', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457290, 6845140, 'Rua Amâncio Roque de Camargo', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457291, 6804340, 'Rua Amazonas', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457292, 6826520, 'Rua Amazonas', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457293, 6807250, 'Rua Amélia dos Anjos Oliveira', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457294, 6813130, 'Rua Americanópolis', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457295, 6816310, 'Rua da Amizade', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457296, 6823150, 'Rua Ana Maria', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457297, 6807110, 'Rua ANápolis', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457298, 6840160, 'Alameda André Rebouças', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457299, 6814560, 'Rua Andrômeda', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457300, 6803415, 'Rua Andrônico dos Prazeres Gonçalves', 'Centro', 'Embu das Artes', 'SP'),
(457301, 6835250, 'Rua dos Angelins', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457302, 6804190, 'Rua Anita Malfati', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457303, 6843020, 'Estrada Antônio Oliveira', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457304, 6820460, 'Rua Antônio Marciano', 'Jardim Santa Emília', 'Embu das Artes', 'SP'),
(457305, 6806000, 'Estrada Antônio Mory', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457306, 6804300, 'Praça Alberto da Veiga Guignard', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457307, 6835370, 'Rua Antários', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457308, 6810420, 'Rua Apa', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457309, 6807020, 'Rua Apucarana', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457310, 6807420, 'Rua Aracaju', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457311, 6826450, 'Rua Araguaia', 'Paranapanema', 'Embu das Artes', 'SP'),
(457312, 6816180, 'Rua Aramina', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457313, 6807100, 'Rua Arapongas', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457314, 6823260, 'Rua Araray', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457315, 6815270, 'Rua Araribóia', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457316, 6845220, 'Alameda das Araucárias', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(457317, 6814210, 'Rua Argentina', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457318, 6820470, 'Rua Arizona', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457319, 6845295, 'Estrada Arlindo Moraes Costa', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457320, 6835120, 'Rua Aroeiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457321, 6824520, 'Rua Arpoador', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457322, 6844360, 'Rua dos Arquitetos', 'Chácaras Aurora', 'Embu das Artes', 'SP'),
(457323, 6805280, 'Viela do Arroio', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457324, 6844350, 'Rua das Artes', 'Chácaras Aurora', 'Embu das Artes', 'SP'),
(457325, 6820140, 'Rua Artur Bernardes', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457326, 6813280, 'Rua Artur Cruz Ferreira', 'Vila Regina', 'Embu das Artes', 'SP'),
(457327, 6813380, 'Rua Astor', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457328, 6820450, 'Rua Augusto de Almeida Batista', 'Jardim Santa Emília', 'Embu das Artes', 'SP'),
(457329, 6826280, 'Rua Augusto de Almeida Batista', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457330, 6803200, 'Rua Dona Aurora Amaral Araújo', 'Embuema', 'Embu das Artes', 'SP'),
(457331, 6807520, 'Avenida Austrália', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457332, 6824270, 'Rua Avaré', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457333, 6844200, 'Alameda Beija-Flor', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457334, 6810200, 'Rua Babilônia', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457335, 6845020, 'Rua Baden Powell', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457336, 6843070, 'Rua do Bagre', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457337, 6804330, 'Rua Bahia', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457338, 6835340, 'Rua Bananeira', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457339, 6803130, 'Rua dos Bancários', 'Embuema', 'Embu das Artes', 'SP'),
(457340, 6844120, 'Rua Bandeirantes', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457341, 6843110, 'Rua Bantus', 'Vila Marajoara', 'Embu das Artes', 'SP'),
(457342, 6843310, 'Rua Barão de Iguape', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457343, 6843410, 'Rua Barão de Limeira', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457344, 6843390, 'Rua Barão do Rio Branco', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457345, 6845270, 'Estrada Barcelona', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457346, 6843350, 'Rua Baronesa de Itu', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457347, 6813180, 'Rua Barra Funda', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457348, 6816140, 'Rua Barretos', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457349, 6826020, 'Avenida do Barroco', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457350, 6824030, 'Rua Barueri', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457351, 6826340, 'Rua Basiléia', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457352, 6825050, 'Estrada Baviera', 'Parque das Chácaras', 'Embu das Artes', 'SP'),
(457353, 6805370, 'Via das Begônias', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457354, 6826410, 'Rua Beija-Flor', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457355, 6803335, 'Rua Beira-Rio', 'Centro', 'Embu das Artes', 'SP'),
(457356, 6805120, 'Estrada Bela Vista', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457357, 6807340, 'Rua Belém', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457358, 6810270, 'Rua Belgrado', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457359, 6803440, 'Rua Belo Horizonte', 'Centro', 'Embu das Artes', 'SP'),
(457360, 6826400, 'Rua Bem-te-vi', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457361, 6845130, 'Avenida Benedito José de Oliveira', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457362, 6805140, 'Rua Benedito Mariano', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(457363, 6845320, 'Estrada Benedito Mathias de Camargo', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457364, 6810620, 'Rua Berna', 'Jardim Liberdade', 'Embu das Artes', 'SP'),
(457365, 6826200, 'Rua Bertioga', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457366, 6805260, 'Viela Bica', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457367, 6826170, 'Rua Boa Viagem', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457368, 6803350, 'Rua Boa Vista', 'Centro', 'Embu das Artes', 'SP'),
(457369, 6814190, 'Rua Bolívia', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457370, 6825007, 'Rua do Bom Jesus', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(457371, 6813155, 'Rua Bom Retiro', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457372, 6813080, 'Rua Bonfiglioli', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457373, 6810560, 'Rua Bonn', 'Jardim Liberdade', 'Embu das Artes', 'SP'),
(457374, 6807210, 'Rua Boracéia', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457375, 6843300, 'Rua Borba Gato', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457376, 6820100, 'Rua Borborema', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457377, 6810210, 'Rua Borgonha', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457378, 6843130, 'Rua Bororós', 'Vila Marajoara', 'Embu das Artes', 'SP'),
(457379, 6826245, 'Rua Botafogo', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457380, 6823360, 'Rua Botucatu', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457381, 6844050, 'Rua Braz Cubas', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457382, 6825030, 'Estrada Bremen', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(457383, 6840275, 'Rua dos Brilhantes', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457384, 6823090, 'Rua Bristol', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457385, 6813040, 'Rua Brooklin', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457386, 6826370, 'Rua Bucarest', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457387, 6815350, 'Rua Buril', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457388, 6846190, 'Vereda dos Buritis', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457389, 6813220, 'Rua Butantão', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457390, 6813320, 'Rua C', 'Vila Regina', 'Embu das Artes', 'SP'),
(457391, 6844220, 'Alameda Curiá', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457392, 6826310, 'Rua Cabo da Boa Esperança', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457393, 6835380, 'Rua Cactus', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457394, 6835170, 'Praça do CaFé', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457395, 6824140, 'Rua Caiçara', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457396, 6805100, 'Rua Caim', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457397, 6835310, 'Rua dos Cajamangas', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457398, 6835260, 'Rua Cajueiro', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457399, 6833130, 'Rua Califórnia', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457400, 6813090, 'Rua Cambuci', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457401, 6810190, 'Rua das CAmélias', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457402, 6804150, 'Rua Camila Alvares de Azevedo', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457403, 6845330, 'Rua Caminho da Olaria', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457404, 6845100, 'Rua Caminho do Ínndio', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457405, 6833150, 'Rua da Campina', 'Granja Nossa Senhora Aparecida', 'Embu das Artes', 'SP'),
(457406, 6846050, 'Rua Campo de Marte', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(457407, 6816220, 'Rua Campo Florido', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457408, 6807410, 'Rua Campo Grande', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457409, 6823330, 'Rua Campos do Jordãoo', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457410, 6820180, 'Rua Campos Sales', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457411, 6826420, 'Rua dos Canários', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457412, 6826230, 'Rua Candeias', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457413, 6804180, 'Rua Cândido Portinari', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457414, 6815470, 'Rua Cantor', 'Vila Ínsis Cristina', 'Embu das Artes', 'SP'),
(457415, 6813060, 'Rua Capãoo Redondo', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457416, 6803425, 'Rua da Capelinha', 'Centro', 'Embu das Artes', 'SP'),
(457417, 6816160, 'Avenida Capivari', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457418, 6820420, 'Rua Capri', 'Jardim Santa Emília', 'Embu das Artes', 'SP'),
(457419, 6846110, 'Estrada Capuava', 'Capuava', 'Embu das Artes', 'SP'),
(457420, 6835280, 'Rua Caqui', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457421, 6807230, 'Rua Caraguatatuba', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457422, 6845280, 'Rua Carapó', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457423, 6824160, 'Rua Carazinho', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457424, 6820051, 'Rua Cardeal', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457425, 6806111, 'Rua Dona Carlota Joaquina', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457426, 6835100, 'Rua Carnaúbas', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457427, 6835220, 'Rua Carvalho', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457428, 6843520, 'Rua Taji Takahashi', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(457429, 6843700, 'Estrada Cascata das Antas', 'Jardim Pindorama', 'Embu das Artes', 'SP'),
(457430, 6833050, 'Rua Cascavel', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457431, 6804170, 'Rua Cássio M Boy', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457432, 6823490, 'Rua Castanheiro', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457433, 6840040, 'Rua Castro Alves', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(457434, 6807070, 'Rua Catanduvas', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457435, 6824350, 'Rua Caviúna', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457436, 6810350, 'Rua Caviúna', 'Jardim Cultura Física', 'Embu das Artes', 'SP'),
(457437, 6810610, 'Rua Cazuza', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457438, 6823430, 'Rua Cecília Meireles', 'Jardim Taima', 'Embu das Artes', 'SP'),
(457439, 6824400, 'Rua Cedro', 'Jardim Santa Rita', 'Embu das Artes', 'SP'),
(457440, 6840370, 'Alameda dos Cedros', 'Bosque do Embu', 'Embu das Artes', 'SP'),
(457441, 6823220, 'Rua Célia', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457442, 6815440, 'Rua Centauro', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457443, 6823510, 'Rua Central', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457444, 6835330, 'Rua Cerejeira', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457445, 6813000, 'Rua Cerqueira César', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457446, 6807320, 'Avenida Dona CeSária Camargo de Oliveira', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457447, 6820360, 'Rua Chicago', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457448, 6820050, 'Avenida Chico Mendes', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457449, 6814180, 'Rua Chile', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457450, 6816290, 'Rua Cinco', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457451, 6806040, 'Rua Inês Boccolini Ribeiro', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457452, 6814380, 'Rua Estrela do Norte', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457453, 6826390, 'Rua dos Cisnes', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457454, 6820380, 'Rua Cleveland', 'Jardim Silvana', 'Embu das Artes', 'SP'),
(457455, 6813350, 'Rua Clotilde José Silva', 'Vila Regina', 'Embu das Artes', 'SP'),
(457456, 6804410, 'Rua Clube Paratodos', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457457, 6823480, 'Rua Cocaia', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457458, 6844290, 'Rua Colatina', 'Esplanada', 'Embu das Artes', 'SP'),
(457459, 6840320, 'Vereda da Colina', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457460, 6810580, 'Rua Colônia', 'Jardim Sérgio', 'Embu das Artes', 'SP'),
(457461, 6833070, 'Estrada Comendador Orlando Grande', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457462, 6806080, 'Rua do Comerciário', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457463, 6840060, 'Rua Cometa', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457464, 6813470, 'Rua Comodoro', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457465, 6815480, 'Rua Compositor', 'Vila Ínsis Cristina', 'Embu das Artes', 'SP'),
(457466, 6816340, 'Rua da Concórdia', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457467, 6816330, 'Rua da Confraternizaçãoo', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457468, 6816470, 'Rua Congo', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457469, 6846040, 'Rua Congonhas', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(457470, 6816005, 'Rua da Congregaçãoo', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457471, 6813100, 'Rua Consolaçãoo', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457472, 6826000, 'Estrada de Constantinopla', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457473, 6805200, 'Rua do Contorno', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457474, 6826240, 'Rua Copacabana', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457475, 6810320, 'Rua Copenhague', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457476, 6823450, 'Rua Cora Coralina', 'Jardim Taima', 'Embu das Artes', 'SP'),
(457477, 6815360, 'Rua Coroa Boreal', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457478, 6840300, 'Vereda do Córrego', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457479, 6810250, 'Rua Córsega', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457480, 6825070, 'Rua Cotia', 'Parque das Chácaras', 'Embu das Artes', 'SP'),
(457481, 6826500, 'Rua Coxim', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457482, 6810130, 'Rua dos Cravos', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457483, 6805380, 'Via dos Cravos', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457484, 6810530, 'Rua Creta', 'Jardim Sérgio', 'Embu das Artes', 'SP'),
(457485, 6807040, 'Rua Criciúma', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457486, 6845170, 'Rua Cristóvãoo Constábille', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457487, 6824320, 'Rua Cruzeiro', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457488, 6815410, 'Rua Cruzeiro do Sul', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457489, 6807150, 'Rua Cubatãoo', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457490, 6807400, 'Praça Cuiabá', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457491, 6844230, 'Alameda Bem-te-vi', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457492, 6846250, 'Rua Dalmo Ferreira', 'Capuava', 'Embu das Artes', 'SP'),
(457493, 6803090, 'Rua Dalva de Oliveira', 'Vila Carmem', 'Embu das Artes', 'SP'),
(457494, 6805060, 'Rua David', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457495, 6820005, 'Rua Davi Blinder', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457496, 6820130, 'Rua Delfim Moreira', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457497, 6806220, 'Travessa Demayo', 'Jardim Ferreira', 'Embu das Artes', 'SP'),
(457498, 6820480, 'Avenida Detroit', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457499, 6814330, 'Rua Jambeiro', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457500, 6840260, 'Rua Wataru Sugaki', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457501, 6833360, 'Alameda Dinauro', 'Embu Mirim', 'Embu das Artes', 'SP'),
(457502, 6843260, 'Rua Diogo Álvares', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457503, 6803180, 'Rua dos Diplomatas', 'Embuema', 'Embu das Artes', 'SP'),
(457504, 6804370, 'Rua Distrito Federal', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457505, 6810330, 'Viela Dois', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457506, 6814410, 'Rua Bandeirantes', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457507, 6806010, 'Rua Aurora Gaspar Christe', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457508, 6806110, 'Rua Dom João VI', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457509, 6806160, 'Rua Dom Manoel', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457510, 6803230, 'Rua Domingos de Pascoal', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457511, 6843550, 'Rua Domingos Jorge Velho', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457512, 6807680, 'Rua Dona Amélia', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457513, 6803450, 'Rua Dona Bernardina', 'Centro', 'Embu das Artes', 'SP'),
(457514, 6814015, 'Rua Dona Constância', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(457515, 6807690, 'Rua Dona Joaninha', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457516, 6845070, 'Estrada Dona Maria José Ferraz Prado', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457517, 6843030, 'Rua Dourado', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457518, 6807480, 'Rua Doutor Jorge Balduzzi', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457519, 6803510, 'Travessa Doutor Levy Sodré', 'Centro', 'Embu das Artes', 'SP'),
(457520, 6844030, 'Rua Duarte Coelho', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457521, 6844080, 'Rua Duarte da Costa', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457522, 6823420, 'Rua Duartina', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457523, 6843380, 'Rua Duque de Caxias', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457524, 6845300, 'Rua Ecologia', 'Parque dos Caetes', 'Embu das Artes', 'SP'),
(457525, 6803140, 'Rua dos Economistas', 'Embuema', 'Embu das Artes', 'SP'),
(457526, 6803220, 'Rua dos Edificadores', 'Embuema', 'Embu das Artes', 'SP'),
(457527, 6817120, 'Rua Eiffel', 'Esplanada', 'Embu das Artes', 'SP'),
(457528, 6803000, 'Avenida Elias Yazbek', 'Centro', 'Embu das Artes', 'SP'),
(457529, 6823550, 'Rua Elizabeth', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457530, 6804000, 'Rua da Emancipaçãoo', 'Centro', 'Embu das Artes', 'SP'),
(457531, 6823190, 'Rua Embiry', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457532, 6815200, 'Rua Embu-Guaçu', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457533, 6805250, 'Rua da Encosta', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457534, 6806050, 'Rua do Engenheiro', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457535, 6814230, 'Rua Equador', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457536, 6824120, 'Rua Erechim', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457537, 6815390, 'Rua Eridano', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457538, 6824240, 'Rua Erval Seco', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457539, 6833085, 'Avenida Esco', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457540, 6844330, 'Rua dos Escultores', 'Chácaras Aurora', 'Embu das Artes', 'SP'),
(457541, 6813360, 'Rua das Esculturas', 'Vila São José', 'Embu das Artes', 'SP'),
(457542, 6840220, 'Rua das Esmeraldas', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457543, 6813460, 'Rua Espacial', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457544, 6804360, 'Rua Espírito Santo', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457545, 6807530, 'Avenida Estados Unidos', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457546, 6823280, 'Rua Estoril', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457547, 6805337, 'Via das Estrelevias', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457548, 6816270, 'Rua dos Estudantes', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457549, 6816530, 'Rua Etiópia', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457550, 6835160, 'Rua Eucaliptos', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457551, 6823290, 'Rua Eunice', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457552, 6810100, 'Rua Existente', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457553, 6844270, 'Alameda Flamingo', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457554, 6816380, 'Rua Farroupilha', 'Vila Perequê', 'Embu das Artes', 'SP'),
(457555, 6833071, 'Estrada da Fazendinha', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457556, 6815370, 'Rua Fênix', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457557, 6803460, 'Alameda Fernando Batista Medina', 'Centro', 'Embu das Artes', 'SP'),
(457558, 6843180, 'Rua Fernãoo Dias', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457559, 6813190, 'Rua Ferreira', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457560, 6823130, 'Rua Figueira Branca', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457561, 6840330, 'Vereda das Figueiras', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457562, 6843560, 'Rua Firmino Pires da Silva', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457563, 6824280, 'Rua Flamengo', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457564, 6804030, 'Praça Flávio de Carvalho', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457565, 6810090, 'Rua Flor de Lis', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457566, 6826360, 'Rua Florença', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457567, 6805160, 'Rua Florencia', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(457568, 6833100, 'Rua Flórida', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457569, 6805290, 'Viela Fonte', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457570, 6846210, 'Vereda da Fonte', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457571, 6823050, 'Rua Formosa', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457572, 6807440, 'Rua Fortaleza', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457573, 6823350, 'Rua Franca', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457574, 6843585, 'Rua Francisco Siniãoo Gonçalves', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457575, 6844130, 'Rua Frei Caneca', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457576, 6810180, 'Rua Frei Caneca', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457577, 6816150, 'Rua Frutal', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457578, 6844280, 'Alameda Garça', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457579, 6816490, 'Rua Gabãoo', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457580, 6844060, 'Rua Gabriel de Lara', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457581, 6820030, 'Rua Gaivota', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457582, 6807360, 'Rua Galiléia', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457583, 6816060, 'Rua Gastãoo Santana de Moraes Gonçalves', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457584, 6824210, 'Rua Gaurama', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457585, 6810630, 'Rua Genebra', 'Jardim Liberdade', 'Embu das Artes', 'SP'),
(457586, 6806060, 'Rua dos Geógrafos', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457587, 6804140, 'Rua Georgina de Albuquerque', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457588, 6817100, 'Estrada Gerânios', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(457589, 6823560, 'Rua Getúlio Vargas', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457590, 6803080, 'Rua Ghers Stenberg Isidoro', 'Vila Carmem', 'Embu das Artes', 'SP'),
(457591, 6846170, 'Vereda do Girassol', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457592, 6810300, 'Rua Glasgow', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457593, 6817070, 'Rua das Glicínias', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(457594, 6835270, 'Rua Goiabeiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457595, 6826040, 'Rua Gótica', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457596, 6824510, 'Rua Granito', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457597, 6845030, 'Rua das Graúnas', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457598, 6823120, 'Rua Guaiana', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457599, 6826510, 'Rua Guaiba', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457600, 6810370, 'Rua Guaiçara', 'Jardim Cultura Física', 'Embu das Artes', 'SP'),
(457601, 6843490, 'Rua Guaicurus', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(457602, 6823040, 'Rua Guairaca', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457603, 6807200, 'Rua Guaiúba', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457604, 6804365, 'Rua Guanabara', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457605, 6815100, 'Rua Guarany', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457606, 6816350, 'Rua Guararapes', 'Vila Perequê', 'Embu das Artes', 'SP'),
(457607, 6823600, 'Rua Guatapara', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457608, 6816500, 'Rua Guine', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457609, 6823030, 'Rua Guttmann', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457610, 6844250, 'Alameda Harpia', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457611, 6807710, 'Rua Haiti', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457612, 6810310, 'Rua Hamburgo', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457613, 6835600, 'Rua Hatsuji Terada', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457614, 6820390, 'Rua Havana', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457615, 6810070, 'Rua Heitor Villa Lobos', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457616, 6807000, 'Avenida Hélio Ossamu Daikuara', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457617, 6844140, 'Estrada Henrique Franchini', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457618, 6835390, 'Avenida Hercílio Wustemberg', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457619, 6810750, 'Rua Herculano Gomes', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457620, 6813330, 'Rua Herculano José de Aguiar', 'Vila Regina', 'Embu das Artes', 'SP'),
(457621, 6815430, 'Rua Hércules', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457622, 6820440, 'Rua Hilton', 'Jardim Santa Emília', 'Embu das Artes', 'SP'),
(457623, 6810480, 'Rua Hipopótamo', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457624, 6845250, 'Alameda Hortênsias', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(457625, 6820400, 'Rua Horto Florestal', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457626, 6844260, 'Alameda Ireré', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457627, 6824050, 'Rua Ibira', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457628, 6824020, 'Rua Ibiúna', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457629, 6833020, 'Rua Idalécio do Espírito Santo Gonçalves', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457630, 6810631, 'Rua Idalina Fernandes Cavalheiro', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457631, 6823320, 'Rua Igarapava', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457632, 6826530, 'Rua Iguaçu', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457633, 6824060, 'Rua Iguape', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457634, 6807240, 'Rua Ijuí', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457635, 6817200, 'Rua Ilha Bela', 'Esplanada', 'Embu das Artes', 'SP'),
(457636, 6817180, 'Rua Ilha Comprida', 'Esplanada', 'Embu das Artes', 'SP'),
(457637, 6817260, 'Rua Ilha de São SebasTião', 'Jardim dos Oliveiras', 'Embu das Artes', 'SP'),
(457638, 6826300, 'Rua Ilha do Governador', 'Jardim Jurema', 'Embu das Artes', 'SP'),
(457639, 6817210, 'Rua Ilha Porchat', 'Esplanada', 'Embu das Artes', 'SP'),
(457640, 6817220, 'Rua Ilha Solteira', 'Esplanada', 'Embu das Artes', 'SP'),
(457641, 6833170, 'Rua Imperador Dom Pedro I', 'Jardim Elisa', 'Embu das Artes', 'SP'),
(457642, 6833135, 'Rua Imperatriz Leopoldina', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457643, 6815130, 'Rua Inajá', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457644, 6810360, 'Rua Inajá', 'Jardim Cultura Física', 'Embu das Artes', 'SP'),
(457645, 6826050, 'Rua dos Inconfidentes', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457646, 6826150, 'Rua Independência', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457647, 6807540, 'Rua Ínndia', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457648, 6813020, 'Rua Indianópolis', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457649, 6806170, 'Avenida Indústria Paulista', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457650, 6806090, 'Rua do Industriário', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457651, 6845010, 'Avenida Ingá', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457652, 6846010, 'Estrada Interna', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(457653, 6840350, 'Alameda dos Ipós', 'Bosque do Embu', 'Embu das Artes', 'SP'),
(457654, 6815010, 'Rua Iracema', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457655, 6824250, 'Rua Iraí', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457656, 6820290, 'Avenida Irene', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(457657, 6803480, 'Rua Marechal Izidoro Lopes', 'Centro', 'Embu das Artes', 'SP'),
(457658, 6807550, 'Rua Itália', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457659, 6824080, 'Rua Itanhaém', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457660, 6823210, 'Rua Itapeti', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457661, 6824040, 'Rua Itapeva', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457662, 6815260, 'Rua Itaporanga', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457663, 6813240, 'Rua Itaquera', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457664, 6823520, 'Rua Itinguçu', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457665, 6816360, 'Rua Itororó', 'Vila Perequê', 'Embu das Artes', 'SP'),
(457666, 6824100, 'Rua Itu', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457667, 6816120, 'Rua Ituberaba', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457668, 6816130, 'Rua Ituiutaba', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457669, 6823160, 'Rua Iva', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457670, 6833110, 'Rua Ivanete', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457671, 6820020, 'Rua Jaçanão', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457672, 6824390, 'Rua Jacarandá', 'Jardim Santa Rita', 'Embu das Artes', 'SP'),
(457673, 6840360, 'Alameda Jacarandá', 'Bosque do Embu', 'Embu das Artes', 'SP'),
(457674, 6845230, 'Alameda dos Jacarandás', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(457675, 6803060, 'Avenida Jacintha Ribeiro Mei', 'Centro', 'Embu das Artes', 'SP'),
(457676, 6813120, 'Rua Jaguaré', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457677, 6813170, 'Rua Jaguaré', 'Jardim Laila', 'Embu das Artes', 'SP'),
(457678, 6803410, 'Rua Jandira Sodré', 'Centro', 'Embu das Artes', 'SP'),
(457679, 6807560, 'Rua Japãoo', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457680, 6826480, 'Rua Japurá', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457681, 6817130, 'Rua Jardim Suspenso', 'Esplanada', 'Embu das Artes', 'SP'),
(457682, 6846230, 'Vereda do Jardim', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457683, 6835290, 'Rua Jatobá', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457684, 6815250, 'Rua Jerônimo', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457685, 6825020, 'Estrada Jerusalém', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(457686, 6825015, 'Rua Jerusalém', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(457687, 6803360, 'Largo Jesuítas', 'Centro', 'Embu das Artes', 'SP'),
(457688, 6844100, 'Rua Jesuítas', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457689, 6810730, 'Rua Jibóia', 'Jardim Nova República', 'Embu das Artes', 'SP'),
(457690, 6815210, 'Rua Joaçaba', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457691, 6845160, 'Rua João Belizário de Oliveira', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457692, 6820110, 'Rua João CaFé Filho', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457693, 6844070, 'Rua João de Barros', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457694, 6835521, 'Rua João do Dico', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(457695, 6810355, 'Rua João Galina', 'Jardim Cultura Física', 'Embu das Artes', 'SP'),
(457696, 6823451, 'Rua João Guimarãoes Rosa', 'Jardim Taima', 'Embu das Artes', 'SP'),
(457697, 6843270, 'Rua João Ramalho', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457698, 6844090, 'Rua Joaquim Nabuco', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457699, 6803370, 'Rua Joaquim Santana', 'Centro', 'Embu das Artes', 'SP'),
(457700, 6807050, 'Rua Joinvile', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457701, 6816050, 'Avenida Jorge Alfredo Camasmie', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457702, 6816080, 'Rua José Cachoeira', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457703, 6840020, 'Rua José de Alencar', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(457704, 6840170, 'Rua José do Patrocínio', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457705, 6810170, 'Rua José do Patrocínio', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457706, 6823570, 'Rua José Linhares', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457707, 6823440, 'Rua José Lins do Rego', 'Jardim Taima', 'Embu das Artes', 'SP'),
(457708, 6833300, 'Rua José Semiãoo Rodrigues Agostinho', 'Embu Mirim', 'Embu das Artes', 'SP'),
(457709, 6805075, 'Rua Josué', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457710, 6820060, 'Rua Júlio Mesquita', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457711, 6824010, 'Avenida Jundiaí', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457712, 6840100, 'Rua Júpiter', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457713, 6824090, 'Rua Juquiá', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457714, 6823540, 'Rua Juranda', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457715, 6815150, 'Avenida Juruna', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457716, 6815110, 'Rua Jussara', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457717, 6844150, 'Alameda Tico Tico', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457718, 6820070, 'Rua Kalil Filho', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457719, 6810000, 'Avenida Kizaemon Takeuti', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457720, 6844170, 'Alameda Lindo Azul', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457721, 6845240, 'Alameda Lago', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(457722, 6846130, 'Vereda do Lago', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457723, 6843080, 'Rua Lambari', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457724, 6826060, 'Rua da Lampadosa', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457725, 6835400, 'Rua Laranjeiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457726, 6804040, 'Rua Lazar Segall', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457727, 6823170, 'Rua Laura', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457728, 6816070, 'Estrada Lavorato', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457729, 6810460, 'Rua Leão', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457730, 6826270, 'Rua Leblon', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457731, 6820340, 'Rua Le Mans', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457732, 6810500, 'Rua Leopardo', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457733, 6843340, 'Rua Líbero Badaró', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457734, 6813410, 'Rua Liberty', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457735, 6816480, 'Rua Líbia', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457736, 6803310, 'Rua Lícia Borges', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457737, 6820350, 'Rua Lima', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457738, 6823340, 'Rua Lins', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457739, 6817080, 'Rua Lírios', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(457740, 6826350, 'Rua Lisboa', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457741, 6804060, 'Rua Lívio Abramo', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457742, 6823370, 'Rua Lorena', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457743, 6820490, 'Rua Los Angeles', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457744, 6803240, 'Rua Luís de Almeida Carvalho', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457745, 6823230, 'Rua Luiza', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457746, 6844190, 'Alameda Macuco', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457747, 6807380, 'Rua Macapá', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457748, 6807430, 'Rua Maceió', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457749, 6840030, 'Rua Machado de Assis', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(457750, 6823070, 'Rua Maciel', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457751, 6820010, 'Rua Macuco', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(457752, 6826430, 'Rua Madeira', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(457753, 6833010, 'Avenida Madre Odette', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457754, 6835070, 'Rua Madureira', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457755, 6810110, 'Rua das Magnólias', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457756, 6820370, 'Rua Manágua', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457757, 6807375, 'Rua Manaus', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457758, 6835320, 'Rua Mangueira', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457759, 6815220, 'Rua Manhuaçu', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457760, 6846081, 'Rua Manoel Antônio da Costa', 'Capuava', 'Embu das Artes', 'SP'),
(457761, 6806540, 'Rua Mar Vermelho', 'Estância  de Embuarama', 'Embu das Artes', 'SP'),
(457762, 6813440, 'Rua Marabá', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457763, 6835060, 'Rua Maracaí', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457764, 6817230, 'Rua Ilha de Marajó', 'Esplanada', 'Embu das Artes', 'SP'),
(457765, 6843465, 'Estrada Marajoara', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(457766, 6840000, 'Avenida João Batista Medina', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(457767, 6824110, 'Rua Marau', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457768, 6823240, 'Rua Marcelina', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457769, 6816000, 'Rua Marcelino Pinto Teixeira', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457770, 6820240, 'Rua Márcia', 'Jardim Irapiranga', 'Embu das Artes', 'SP'),
(457771, 6820210, 'Rua Marechal Deodoro da Fonseca', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457772, 6820200, 'Rua Marechal Floriano Peixoto', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457773, 6823580, 'Rua Marechal Hermes da Fonseca', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457774, 6824425, 'Rua Marfim', 'Jardim Santa Rita', 'Embu das Artes', 'SP'),
(457775, 6810091, 'Rua das Margaridas', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457776, 6817020, 'Rua das Margaridas', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(457777, 6833200, 'Avenida Marginal', 'Jardim Elisa', 'Embu das Artes', 'SP'),
(457778, 6843240, 'Rua Maria Auxiliadora', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(457779, 6843010, 'Estrada Maria Imaculada', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457780, 6835040, 'Rua Marilena', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457781, 6835055, 'Rua Marília', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457782, 6835010, 'Rua Marimpa', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457783, 6823080, 'Rua Maringá', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457784, 6820205, 'Rua dos Mármores', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457785, 6843400, 'Rua Marquês de Paranaguá', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457786, 6843370, 'Rua Marquês de Pombal', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457787, 6843330, 'Rua Marquês de Santo Amaro', 'Engenho Velho', 'Embu das Artes', 'SP'),
(457788, 6826090, 'Rua Marquesa de Santos', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457789, 6816450, 'Rua Marrocos', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457790, 6810290, 'Rua Marselha', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457791, 6840110, 'Rua Marte', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457792, 6844020, 'Rua Martim Afonso de Souza', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457793, 6845080, 'Estrada dos Martins', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457794, 6843280, 'Rua Mateus Grou', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457795, 6804380, 'Rua Mato Grosso', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457796, 6840005, 'Rua Matões', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(457797, 6803420, 'Rua da Matriz', 'Centro', 'Embu das Artes', 'SP'),
(457798, 6810220, 'Rua Mauritânia', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457799, 6806035, 'Rua da Medicina', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457800, 6844040, 'Rua Mem de Sá', 'Embu Colonial', 'Embu das Artes', 'SP'),
(457801, 6840070, 'Rua Mercúrio', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457802, 6803330, 'Travessa Ana Néri', 'Centro', 'Embu das Artes', 'SP'),
(457803, 6805110, 'Rua Messias', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457804, 6825000, 'Estrada Messina', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(457805, 6813390, 'Rua Oswaldo Bastos', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457806, 6807640, 'Rua México', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457807, 6833140, 'Rua Miami', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457808, 6813290, 'Rua Milãoo', 'Vila Regina', 'Embu das Artes', 'SP'),
(457809, 6805150, 'Rua Mimi Simãoo', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(457810, 6820300, 'Rua Minas Gerais', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(457811, 6804310, 'Rua Minas Gerais', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457812, 6817270, 'Travessa Minas Gerais', 'Jardim dos Oliveiras', 'Embu das Artes', 'SP'),
(457813, 6824490, 'Rua Minuano', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457814, 6846020, 'Rua Mirador', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(457815, 6835030, 'Rua Mirassol', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457816, 6810450, 'Avenida Mississipi', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457817, 6810430, 'Rua Missouri', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457818, 6816430, 'Rua Moçambique', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457819, 6813070, 'Rua Moema', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457820, 6805170, 'Estrada Moinho Velho', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(457821, 6805080, 'Rua Moisés', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(457822, 6807650, 'Rua Mongólia', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457823, 6835050, 'Rua Monte Alegre', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457824, 6835020, 'Rua Monte Azul', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457825, 6835000, 'Rua Monte Mor', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457826, 6820500, 'Rua Montreal', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457827, 6814200, 'Estrada Moraes', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457828, 6835275, 'Estrada do Morro Agudo', 'Quinta do Morro', 'Embu das Artes', 'SP'),
(457829, 6813005, 'Rua Morumbi', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457830, 6820280, 'Rua Moura', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(457831, 6844180, 'Alameda Rouxinol', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457832, 6806120, 'Rua NapoLeão Bonaparte', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457833, 6810120, 'Rua dos Narcisos', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457834, 6816250, 'Rua Narumi Nakayama', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457835, 6807350, 'Rua Natal', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457836, 6823610, 'Rua Náutico', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457837, 6845200, 'Rua Nélia Afonso Cedro', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457838, 6843100, 'Rua Nelores', 'Vila Marajoara', 'Embu das Artes', 'SP'),
(457839, 6833040, 'Avenida Neme Bassith', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457840, 6840130, 'Rua Netuno', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(457841, 6820330, 'Rua Nicarágua', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(457842, 6816440, 'Rua Nigéria', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457843, 6810410, 'Rua Nilo', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457844, 6820150, 'Rua Nilo Peçanha', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457845, 6807370, 'Rua Niterói', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457846, 6835350, 'Rua das Nogueiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457847, 6824170, 'Rua Nonoai', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457848, 6835450, 'Rua Nossa Senhora das Dores', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(457849, 6835420, 'Rua Nossa Senhora de Fátima', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(457850, 6843230, 'Rua Nossa Senhora de Lourdes', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(457851, 6803430, 'Rua Nossa Senhora do RoSário', 'Centro', 'Embu das Artes', 'SP'),
(457852, 6817150, 'Rua Notre Dame', 'Esplanada', 'Embu das Artes', 'SP'),
(457853, 6814320, 'Rua Ibirama', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457854, 6825060, 'Estrada Nuremberg', 'Parque das Chácaras', 'Embu das Artes', 'SP'),
(457855, 6844210, 'Alameda Sabiá', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(457856, 6810520, 'Rua Ohio', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(457857, 6815140, 'Rua Oiapoque', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457858, 6814340, 'Rua Humaitá', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457859, 6843500, 'Estrada da Olaria', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(457860, 6813480, 'Rua Olido', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457861, 6823060, 'Rua Oliveira', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457862, 6835610, 'Praça Oliveiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457863, 6824480, 'Rua Ã“pera', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457864, 6816240, 'Rua Orlândia', 'Parque Luíza', 'Embu das Artes', 'SP'),
(457865, 6820430, 'Rua Orleans', 'Jardim Santa Emília', 'Embu das Artes', 'SP'),
(457866, 6810160, 'Rua das Orquídeas', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(457867, 6805355, 'Via das Orquídeas', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457868, 6843460, 'Estrada Orquidófilos', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(457869, 6843150, 'Estrada Orquidófilos', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(457870, 6843151, 'Estrada Orquidófilos', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457871, 6806230, 'Rua Othon Palace', 'Jardim Ferreira', 'Embu das Artes', 'SP'),
(457872, 6824070, 'Rua Ourinhos', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457873, 6840200, 'Rua Ouro', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457874, 6805310, 'Beco Outeiro', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457875, 6813030, 'Rua Pacaembu', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457876, 6835180, 'Praça Pachouri', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457877, 6843160, 'Rua Padre Antônio', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457878, 6803340, 'Rua Padre Belchior de Pontes', 'Centro', 'Embu das Artes', 'SP'),
(457879, 6803470, 'Rua Padre João Álvares', 'Centro', 'Embu das Artes', 'SP'),
(457880, 6843290, 'Rua Paes Leme', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457881, 6843140, 'Rua Paiaguas', 'Vila Marajoara', 'Embu das Artes', 'SP'),
(457882, 6835110, 'Rua Paineiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457883, 6846120, 'Passagem das Paineiras', 'Capuava', 'Embu das Artes', 'SP'),
(457884, 6815050, 'Rua Paissandu', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457885, 6813450, 'Rua Paladium', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457886, 6816400, 'Rua Palmares', 'Vila Perequê', 'Embu das Artes', 'SP'),
(457887, 6845260, 'Alameda Palmeiras', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(457888, 6835315, 'Rua das Palmeiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457889, 6824260, 'Rua Panambi', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(457890, 6823250, 'Rua Panorama', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457891, 6805340, 'Via das Papoulas', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(457892, 6826220, 'Rua Paquetá', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457893, 6844310, 'Estrada para Votorantim', 'Esplanada', 'Embu das Artes', 'SP'),
(457894, 6815090, 'Rua ParAguas§u', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457895, 6814215, 'Rua Paraguai', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(457896, 6813110, 'Rua Paraíso', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457897, 6804250, 'Rua Paraná', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457898, 6826440, 'Rua Paranapanema', 'Paranapanema', 'Embu das Artes', 'SP'),
(457899, 6815070, 'Rua Pariquera-Açu', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457900, 6835360, 'Rua Parreiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457901, 6810740, 'Rua Particular', 'Jardim Nova República', 'Embu das Artes', 'SP'),
(457902, 6824011, 'Travessa Particular', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457903, 6846260, 'Rua Passagem Cinco', 'Capuava', 'Embu das Artes', 'SP'),
(457904, 6810340, 'Rua Passos', 'Jardim Cultura Física', 'Embu das Artes', 'SP'),
(457905, 6845040, 'Rua das Patativas', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(457906, 6817140, 'Rua Partenon', 'Esplanada', 'Embu das Artes', 'SP'),
(457907, 6833131, 'Rua Patrícia', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(457908, 6810010, 'Rua Patumi', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457909, 6835230, 'Rua Pau-Brasil', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457910, 6804010, 'Rua Paulo do Vale', 'Centro', 'Embu das Artes', 'SP'),
(457911, 6816280, 'Rua da Paz', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(457912, 6824450, 'Rua Pedra Verde', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457913, 6846200, 'Vereda das Pedras', 'Vale do Sol', 'Embu das Artes', 'SP'),
(457914, 6805190, 'Rua do Pedregal', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457915, 6845120, 'Estrada Pedreira', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457916, 6807160, 'Rua Pedro de Toledo', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457917, 6845190, 'Rua Pedro Stelmassuk', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457918, 6815400, 'Rua Pégaso', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(457919, 6813150, 'Rua Penha', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457920, 6804420, 'Rua Pequias', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457921, 6813210, 'Rua Perdizes', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457922, 6815040, 'Rua Peri', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457923, 6804290, 'Rua Pernambuco', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457924, 6824410, 'Rua Peroba', 'Jardim Santa Rita', 'Embu das Artes', 'SP'),
(457925, 6840210, 'Rua Pérola', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457926, 6810030, 'Rua Perova', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457927, 6807490, 'Rua Peru', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457928, 6807120, 'Rua Peruíbe', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457929, 6803210, 'Rua Petrobrás', 'Embuema', 'Embu das Artes', 'SP'),
(457930, 6817010, 'Rua das Petúnias', 'Jardim Santa Bárbara', 'Embu das Artes', 'SP'),
(457931, 6810050, 'Rua Piaca', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457932, 6804320, 'Rua Piauí', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457933, 6826250, 'Rua Piedade', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(457934, 6810060, 'Rua Piloto', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457935, 6843710, 'Rua Pindorama', 'Jardim Pindorama', 'Embu das Artes', 'SP'),
(457936, 6835240, 'Rua dos Pinheiros', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457937, 6824420, 'Rua Pinho', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457938, 6813340, 'Rua das Pinturas', 'Vila Regina', 'Embu das Artes', 'SP'),
(457939, 6824470, 'Rua Pioneiro', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457940, 6843040, 'Rua Piracanjuba', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(457941, 6817160, 'Rua Pirâmide', 'Esplanada', 'Embu das Artes', 'SP'),
(457942, 6835190, 'Rua Pitangueiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(457943, 6823500, 'Rua Planalto', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(457944, 6813430, 'Rua Plaza', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457945, 6806240, 'Rua Pochuim', 'Jardim Ferreira', 'Embu das Artes', 'SP'),
(457946, 6823310, 'Rua Poços de Caldas', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(457947, 6804070, 'Rua Pola de Rezende', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457948, 6810710, 'Rua do Poligono', 'Vila Anchieta', 'Embu das Artes', 'SP'),
(457949, 6826380, 'Avenida das Pombas', 'Jardim Vazame', 'Embu das Artes', 'SP'),
(457950, 6846090, 'Estrada Ponta Porão', 'Capuava', 'Embu das Artes', 'SP'),
(457951, 6805230, 'Rua Ponte Alta', 'Moinho Velho', 'Embu das Artes', 'SP'),
(457952, 6810040, 'Rua Porangaba', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(457953, 6807600, 'Rua Portugal', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(457954, 6824330, 'Rua Portuguesa', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(457955, 6815020, 'Rua Poti', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(457956, 6807180, 'Rua Praia Grande', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457957, 6840280, 'Rua Prata', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(457958, 6813200, 'Rua Previdência', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457959, 6804220, 'Estrada Professor Cândido Motta Filho', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457960, 6813420, 'Rua Projetada B', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(457961, 6845150, 'Rua Prudência Pires Martins', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(457962, 6820160, 'Rua Prudente de Moraes', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(457963, 6817240, 'Rua Quatorze de Novembro', 'Esplanada', 'Embu das Artes', 'SP'),
(457964, 6814370, 'Rua Duerê', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(457965, 6806030, 'Rua Benjamim Vaz da Luz', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(457966, 6810280, 'Rua Quebec', 'Vila Olinda', 'Embu das Artes', 'SP'),
(457967, 6816460, 'Rua Quênia', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457968, 6835520, 'Estrada Quinta do Morro', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(457969, 6804050, 'Rua Quirino da Silva', 'Cercado Grande', 'Embu das Artes', 'SP'),
(457970, 6810670, 'Rua Rainha Catarina', 'Vila Regina', 'Embu das Artes', 'SP'),
(457971, 6810660, 'Rua Rainha Elizabeth', 'Vila Regina', 'Embu das Artes', 'SP'),
(457972, 6810770, 'Rua Rainha Isabel', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(457973, 6810640, 'Rua Rainha Maria Stuart', 'Vila Regina', 'Embu das Artes', 'SP'),
(457974, 6810650, 'Rua Rainha Vitória', 'Vila Regina', 'Embu das Artes', 'SP'),
(457975, 6803250, 'Rua Ranulfo Lira', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(457976, 6843170, 'Rua Raposo Tavares', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(457977, 6810780, 'Rua Raul Tabajara', 'Jardim Santa Rosa', 'Embu das Artes', 'SP'),
(457978, 6826030, 'Avenida do Realismo', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457979, 6807450, 'Rua Recife', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457980, 6826070, 'Rua Regente Feijão', 'Jardim Independência', 'Embu das Artes', 'SP'),
(457981, 6818300, 'Rodovia Régis Bittencourt - do km 275,002 ao km 276,001', 'Jardim dos Oliveiras', 'Embu das Artes', 'SP'),
(457982, 6818200, 'Rodovia Régis Bittencourt - do km 276,002 ao km 277,500', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457983, 6818100, 'Rodovia Régis Bittencourt - do km 277,501 ao km 278,900', 'Jardim Santa Bárbara', 'Embu das Artes', 'SP'),
(457984, 6818000, 'Rodovia Régis Bittencourt - do km 278,901 ao km 280,001', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(457985, 6830000, 'Rodovia Régis Bittencourt - do km 280,002 ao km 281,500', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(457986, 6830100, 'Rodovia Régis Bittencourt - do km 281,501 ao km 283,001', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(457987, 6805180, 'Praça Rei', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(457988, 6806150, 'Rua Rei Arthur', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(457989, 6826010, 'Rua Renascença', 'Jardim Marina', 'Embu das Artes', 'SP'),
(457990, 6804240, 'Estrada da Repartiçãoo', 'Jardim Recanto da Fonte', 'Embu das Artes', 'SP'),
(457991, 6807090, 'Rua Resende', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457992, 6816370, 'Rua Riachuelo', 'Vila Perequê', 'Embu das Artes', 'SP'),
(457993, 6807330, 'Rua Rio Branco', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(457994, 6804350, 'Rua Rio de Janeiro', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457995, 6804210, 'Rua Rio Grande do Norte', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457996, 6804390, 'Rua Rio Grande do Sul', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(457997, 6824460, 'Rua Riqueza', 'Jardim Batista', 'Embu das Artes', 'SP'),
(457998, 6816520, 'Rua Rodésia', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(457999, 6820080, 'Rua Rodrigues', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(458000, 6820220, 'Rua Rodrigues Alves', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(458001, 6845090, 'Caminho das Rolinhas', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(458002, 6817040, 'Rua das Rosas', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(458003, 6846180, 'Vereda das Rosas', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458004, 6816030, 'Avenida Rotary', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(458005, 6810240, 'Avenida Rotary', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458006, 6816100, 'Avenida Rotary', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(458007, 6840190, 'Rua Rouxinol', 'Chácaras Uirapuru', 'Embu das Artes', 'SP'),
(458008, 6840250, 'Rua Rubi', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(458009, 6820260, 'Avenida Rudge Ramos', 'Jardim Irapiranga', 'Embu das Artes', 'SP'),
(458010, 6807500, 'Rua Rússia', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(458011, 6845050, 'Rua dos Sabiás', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(458012, 6816390, 'Rua Sabinada', 'Vila Perequê', 'Embu das Artes', 'SP'),
(458013, 6840270, 'Rua Safira', 'Chácaras Ana Lúcia', 'Embu das Artes', 'SP'),
(458014, 6840010, 'Rua Salim Neme Bassith', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(458015, 6805030, 'Rua Salomãoo', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(458016, 6835150, 'Praça Samambaia', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458017, 6846150, 'Vereda das Samambaias', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458018, 6824200, 'Rua Sananduva', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458019, 6805001, 'Rua SanSão', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(458020, 6835510, 'Rua Santa Ana', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458021, 6804280, 'Rua Santa Catarina', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(458022, 6843000, 'Estrada Santa Clara', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(458023, 6807570, 'Rua Santa Eliza', 'Jardim Mimas', 'Embu das Artes', 'SP'),
(458024, 6835460, 'Rua Santa Eulália', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458025, 6835430, 'Rua Santa Gertrudes', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458026, 6835480, 'Rua Santa Inês', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458027, 6814270, 'Rua Santa Lúcia', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458028, 6805040, 'Rua Santa Luzia', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(458029, 6835470, 'Rua Santa Maria', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458030, 6814040, 'Rua Santa Marta', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458031, 6843220, 'Rua Santa Rita', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(458032, 6835490, 'Rua Santa Rita de Cássia', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458033, 6835440, 'Rua Santa Rosa', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458034, 6813400, 'Avenida Santa Tereza', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(458035, 6816010, 'Avenida Santa Tereza', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(458036, 6835500, 'Rua Santa Terezinha', 'Jardim Santo Antônio', 'Embu das Artes', 'SP'),
(458037, 6833060, 'Rua Santiago Gomes Robles', 'Jardim Sadie', 'Embu das Artes', 'SP'),
(458038, 6815310, 'Rua Santo Agostinho', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458039, 6814050, 'Rua Santo Amaro', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458040, 6814155, 'Rua Santo André', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458041, 6843190, 'Rua Santo Antônio', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(458042, 6807260, 'Rua Santo Cristo', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458043, 6824310, 'Rua Santos', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(458044, 6823270, 'Rua Santos Dumont', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458045, 6807270, 'Rua São Benedito', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458046, 6814090, 'Rua São Bernardo', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458047, 6815300, 'Rua São Caetano', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458048, 6814150, 'Rua São Camilo', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458049, 6814120, 'Rua São Carlos', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458050, 6814020, 'Estrada São Cristóvãoo', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458051, 6814125, 'Rua São Domingos', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458052, 6807280, 'Rua São Francisco', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458053, 6814290, 'Rua São Francisco de Assis', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458054, 6823470, 'Rua São Gabriel', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458055, 6814260, 'Rua São Geraldo', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458056, 6815290, 'Rua São Gerônimo', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458057, 6843210, 'Rua São João', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(458058, 6814070, 'Rua São Joaquim', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458059, 6815320, 'Rua São Jorge', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458060, 6845110, 'Rua São Jorge', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(458061, 6814160, 'Estrada São José', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458062, 6843200, 'Rua São José', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(458063, 6826290, 'Estrada São José', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(458064, 6817170, 'Estrada São Judas', 'Esplanada', 'Embu das Artes', 'SP'),
(458065, 6814060, 'Rua São Lázaro', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458066, 6814310, 'Rua São Lucas', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458067, 6840050, 'Rua São Luiz', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(458068, 6815330, 'Rua São Marcelo', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458069, 6814010, 'Estrada São Marcos', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458070, 6814030, 'Rua São Mateus', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458071, 6815280, 'Rua São Miguel Arcanjo', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458072, 6804230, 'Avenida São Paulo', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(458073, 6814115, 'Rua São Pedro', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458074, 6807310, 'Rua São Rafael', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458075, 6814140, 'Rua São Raimundo', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458076, 6807290, 'Rua São Roque', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458077, 6814280, 'Estrada São SebasTião', 'Jardim Valo Verde', 'Embu das Artes', 'SP'),
(458078, 6817190, 'Rua São SebasTião', 'Jardim dos Oliveiras', 'Embu das Artes', 'SP'),
(458079, 6817250, 'Travessa São Vicente', 'Jardim dos Oliveiras', 'Embu das Artes', 'SP'),
(458080, 6805010, 'Rua Sarah', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(458081, 6824230, 'Rua Sarandi', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458082, 6840080, 'Rua Saturno', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(458083, 6824370, 'Travessa Saudade', 'Sítio Seis Amigos', 'Embu das Artes', 'SP'),
(458084, 6825040, 'Estrada Saxônia', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(458085, 6833160, 'Rua SebasTião Aniceto de Jesus Lins', 'Jardim Elisa', 'Embu das Artes', 'SP'),
(458086, 6813385, 'Passagem SebasTião Nascimento da Silva', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(458087, 6824190, 'Rua Seberi', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458088, 6814360, 'Rua Flora Rica', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(458089, 6826105, 'Rua José Benjamin de Castro', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458090, 6810440, 'Rua Sena', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458091, 6824430, 'Rua Sereia', 'Jardim Batista', 'Embu das Artes', 'SP'),
(458092, 6804260, 'Rua Sergipe', 'Jardim Sílvia', 'Embu das Artes', 'SP'),
(458093, 6833141, 'Rua Seridó', 'Granja Nossa Senhora Aparecida', 'Embu das Artes', 'SP'),
(458094, 6835630, 'Rua Seringueiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458095, 6824095, 'Rua Serra Negra', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(458096, 6833151, 'Rua Sertões', 'Granja Nossa Senhora Aparecida', 'Embu das Artes', 'SP'),
(458097, 6813010, 'Rua Octacílio Honorato Soares', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458098, 6814350, 'Rua Gurupi', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(458099, 6820410, 'Rua Shelton', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(458100, 6825025, 'Rua Siãoo', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(458101, 6820320, 'Rua Silverstone', 'Jardim Júlia', 'Embu das Artes', 'SP'),
(458102, 6803320, 'Rua Siqueira Campos', 'Centro', 'Embu das Artes', 'SP'),
(458103, 6810680, 'Rua Sol', 'Vila Regina', 'Embu das Artes', 'SP'),
(458104, 6846140, 'Estrada do Sol', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458105, 6840150, 'Rua do Sol', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(458106, 6803290, 'Rua Solano Trindade', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(458107, 6824180, 'Rua Soledade', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458108, 6816300, 'Rua da Solidariedade', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(458109, 6823100, 'Rua Sônia', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458110, 6823410, 'Rua Sorocaba', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(458111, 6810720, 'Rua Sucuri', 'Jardim Nova República', 'Embu das Artes', 'SP'),
(458112, 6813050, 'Rua Sumaré', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458113, 6843090, 'Rua Tabarana', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(458114, 6844390, 'Rua Takara Ueda', 'Chácaras Três Paineiras', 'Embu das Artes', 'SP'),
(458115, 6823000, 'Rua Takebe', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458116, 6843480, 'Rua Tamoios', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(458117, 6826540, 'Rua Tapajós', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(458118, 6826550, 'Viela Tapajós', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(458119, 6804020, 'Rua Tarsila do Amaral', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458120, 6813250, 'Rua Tatuapé', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458121, 6823380, 'Rua Tatuí', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(458122, 6843440, 'Rua Taurus', 'Chácaras Lidia', 'Embu das Artes', 'SP'),
(458123, 6803150, 'Rua dos Técnicos', 'Embuema', 'Embu das Artes', 'SP'),
(458124, 6813125, 'Avenida Teresa', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458125, 6807390, 'Rua Terezina', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458126, 6833120, 'Rua Texas', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(458127, 6804160, 'Rua Thomaz Santa Rosa', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458128, 6815060, 'Rua Tibagi', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458129, 6803380, 'Travessa Manoel José da Costa', 'Centro', 'Embu das Artes', 'SP'),
(458130, 6810490, 'Rua Tigre', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458131, 6843060, 'Rua Tilápia', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(458132, 6815080, 'Rua Timbiras', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458133, 6806005, 'Rua Tinturaria', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(458134, 6840340, 'Alameda das Tipuanas', 'Bosque do Embu', 'Embu das Artes', 'SP'),
(458135, 6826160, 'Rua Tiradentes', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458136, 6815190, 'Rua Tocantins', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458137, 6826100, 'Rua Tomaz Antônio Gonzaga', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458138, 6805210, 'Viela Tombo', 'Moinho Velho', 'Embu das Artes', 'SP'),
(458139, 6844010, 'Rua Tomé de Souza', 'Embu Colonial', 'Embu das Artes', 'SP'),
(458140, 6844110, 'Rua das Tordesilhas', 'Embu Colonial', 'Embu das Artes', 'SP'),
(458141, 6820301, 'Rua Torre de Chanceller', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(458142, 6816260, 'Rua dos Trabalhadores', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(458143, 6810550, 'Rua Trapézio', 'Vila Triângulo', 'Embu das Artes', 'SP'),
(458144, 6814390, 'Rua Cambará', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(458145, 6806020, 'Rua Emiliana Oliveira Camargo Ribeiro', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(458146, 6833180, 'Rua Três', 'Jardim Elisa', 'Embu das Artes', 'SP'),
(458147, 6815380, 'Rua Triângulo Astral', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(458148, 6815120, 'Rua Tupi', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458149, 6843510, 'Rua Tupinambás', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(458150, 6815160, 'Rua Turiassu', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458151, 6813260, 'Rua Turim', 'Vila Regina', 'Embu das Artes', 'SP'),
(458152, 6807220, 'Rua Ubatuba', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458153, 6816230, 'Rua Uberaba', 'Parque Luíza', 'Embu das Artes', 'SP'),
(458154, 6816170, 'Rua Uberlândia', 'Parque Luíza', 'Embu das Artes', 'SP'),
(458155, 6823200, 'Rua Uberlândia', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458156, 6815030, 'Rua Ubiratan', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458157, 6814400, 'Rua Alta Floresta', 'Jardim São Francisco', 'Embu das Artes', 'SP'),
(458158, 6810260, 'Viela Um', 'Vila Olinda', 'Embu das Artes', 'SP'),
(458159, 6816110, 'Rua Francisca Rodrigues Adriano', 'Vila Ínsis Cristina', 'Embu das Artes', 'SP'),
(458160, 6835660, 'Rua das Araucárias', 'Parque Industrial de Embu', 'Embu das Artes', 'SP'),
(458161, 6816320, 'Rua da Uniãoo', 'Jardim Nossa Senhora de Fátima', 'Embu das Artes', 'SP'),
(458162, 6826260, 'Rua Urca', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(458163, 6815420, 'Rua Ursa Maior', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(458164, 6810470, 'Rua Urso', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458165, 6814240, 'Rua Uruguai', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(458166, 6823140, 'Rua Urupês', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458167, 6824290, 'Rua Vasco da Gama', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(458168, 6845210, 'Avenida Ecologista de João de Oliveira Ramos de Sá', 'Condomínio Meu Recanto', 'Embu das Artes', 'SP'),
(458169, 6813490, 'Estrada Velha de Embu', 'Jardim Santa Tereza', 'Embu das Artes', 'SP'),
(458170, 6814220, 'Rua Venezuela', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(458171, 6840120, 'Rua Vênus', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(458172, 6826190, 'Rua Verdes Mares', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(458173, 6833090, 'Estrada Veredas', 'Jardim Magaly', 'Embu das Artes', 'SP'),
(458174, 6803110, 'Rua Vicente Celestino', 'Vila Carmem', 'Embu das Artes', 'SP'),
(458175, 6807190, 'Rua Vicente de Carvalho', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458176, 6810380, 'Rua Vicente Leporace', 'Jardim Santa Rosa', 'Embu das Artes', 'SP'),
(458177, 6805220, 'Rua Vieira Serra', 'Moinho Velho', 'Embu das Artes', 'SP'),
(458178, 6810570, 'Rua Viena', 'Jardim Liberdade', 'Embu das Artes', 'SP'),
(458179, 6823530, 'Rua Vila Nova', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458180, 6826120, 'Rua Vila Rica', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458181, 6803400, 'Largo Vinte e Um de Abril', 'Centro', 'Embu das Artes', 'SP'),
(458182, 6817060, 'Rua das Violetas', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(458183, 6803040, 'Rua do Virgílio', 'Centro', 'Embu das Artes', 'SP'),
(458184, 6843360, 'Rua Visconde de Cairu', 'Engenho Velho', 'Embu das Artes', 'SP'),
(458185, 6810140, 'Rua Vitória-Régia', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(458186, 6807080, 'Rua Volta Redonda', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458187, 6820170, 'Rua Wenceslau Braz', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(458188, 6810400, 'Rua Wladimir Herzog', 'Jardim Santa Rosa', 'Embu das Artes', 'SP'),
(458189, 6815230, 'Rua Xavantes', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458190, 6826470, 'Rua Xingu', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(458191, 6804090, 'Rua Yoshiya Takaoka', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458192, 6810540, 'Rua Zurique', 'Jardim Sérgio', 'Embu das Artes', 'SP'),
(458193, 6803280, 'Rua Alberto Giosa', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(458194, 6803260, 'Rua Antenor Carlos Vaz', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(458195, 6840310, 'Vereda do Bosque', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458196, 6803100, 'Rua Carmem Miranda', 'Vila Carmem', 'Embu das Artes', 'SP'),
(458197, 6843050, 'Rua Cintas Largas', 'Jardim Santa Clara', 'Embu das Artes', 'SP'),
(458198, 6835130, 'Avenida dos Coqueiros', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458199, 6816020, 'Rua Eulália', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(458200, 6805335, 'Via das Grinaldas', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(458201, 6835210, 'Rua Jaboticabeiras', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458202, 6835140, 'Praça Limoeiro', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458203, 6843420, 'Rua Marquês de Itu', 'Engenho Velho', 'Embu das Artes', 'SP'),
(458204, 6810495, 'Rua Onça', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458205, 6824130, 'Rua Palmeiras das Missões', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458206, 6844340, 'Rua dos Pintores', 'Chácaras Aurora', 'Embu das Artes', 'SP'),
(458207, 6833210, 'Rua do Pt', 'Jardim Elisa', 'Embu das Artes', 'SP'),
(458208, 6840055, 'Viela Riachãoo', 'Jardim Maranhãoo', 'Embu das Artes', 'SP'),
(458209, 6814100, 'Rua Santo Angelo', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458210, 6814080, 'Estrada São Luís', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458211, 6844380, 'Rua Seiity Kikuty', 'Chácaras Três Paineiras', 'Embu das Artes', 'SP'),
(458212, 6820250, 'Rua Tostãoo', 'Jardim Irapiranga', 'Embu das Artes', 'SP'),
(458213, 6846070, 'Estrada Babilônia', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(458214, 6813140, 'Rua Brasilândia', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458215, 6823020, 'Rua Califórnia', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458216, 6843250, 'Rua Coraçãoo de Jesus', 'Maria Auxiliadora', 'Embu das Artes', 'SP'),
(458217, 6805050, 'Rua Daniel', 'Jardim Santa Luzia', 'Embu das Artes', 'SP'),
(458218, 6816040, 'Rua Doutor João Marques Maurício', 'Parque Industrial Ramos de Freitas', 'Embu das Artes', 'SP'),
(458219, 6824300, 'Rua Fluminense', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(458220, 6810390, 'Avenida Guilherme Gonçalves do RoSário', 'Jardim Santa Rosa', 'Embu das Artes', 'SP'),
(458221, 6846160, 'Vereda das Hortências', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458222, 6846000, 'Estrada José Mathias de Camargo', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(458223, 6820310, 'Avenida Luís Boylle', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(458224, 6805270, 'Viela do Meio', 'Moinho Velho', 'Embu das Artes', 'SP'),
(458225, 6807140, 'Rua Monte Negro', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458226, 6824220, 'Rua Passo Fundo', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458227, 6823620, 'Rua Quatá', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(458228, 6805130, 'Rua Rogério Gonçalves', 'Jardim Tomé', 'Embu das Artes', 'SP'),
(458229, 6814005, 'Estrada Santo Antônio', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458230, 6807300, 'Rua São Manoel', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458231, 6835090, 'Rua Siglatex', 'Jardim Pinheiros', 'Embu das Artes', 'SP'),
(458232, 6824150, 'Rua Tapejara', 'Jardim da Luz', 'Embu das Artes', 'SP'),
(458233, 6840180, 'Rua Uirapuru', 'Chácaras Uirapuru', 'Embu das Artes', 'SP'),
(458234, 6813270, 'Rua Verona', 'Vila Regina', 'Embu das Artes', 'SP'),
(458235, 6823180, 'Rua Adamastor', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458236, 6815240, 'Rua Aracy', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458237, 6826110, 'Rua Bárbara Heliodora', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458238, 6805360, 'Via das CAmélias', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(458239, 6810080, 'Rua Castro Alves', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(458240, 6806210, 'Estrada Demayo', 'Jardim Ferreira', 'Embu das Artes', 'SP'),
(458241, 6803120, 'Rua Francisco Alves', 'Vila Carmem', 'Embu das Artes', 'SP'),
(458242, 6816510, 'Rua Gâmbia', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(458243, 6826320, 'Rua Ilha do Bananal', 'Jardim Marina', 'Embu das Artes', 'SP'),
(458244, 6807170, 'Rua Jacupiranga', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458245, 6807010, 'Rua Lages', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458246, 6805350, 'Via das Magnólias', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(458247, 6820190, 'Rua Marechal Humberto de Alencar Castelo Branco', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(458248, 6806015, 'Rua Metalurgia', 'Jardim de Lourdes', 'Embu das Artes', 'SP'),
(458249, 6805320, 'Via dos Narcisos', 'Jardim Colibri', 'Embu das Artes', 'SP'),
(458250, 6820090, 'Rua Nioaque', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(458251, 6823110, 'Rua Ouro Preto', 'Jardim Santo Eduardo', 'Embu das Artes', 'SP'),
(458252, 6820040, 'Rua Pavãoo', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(458253, 6807030, 'Rua Pelotas', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458254, 6815170, 'Rua Purús', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458255, 6810590, 'Rua Quincas Borba', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458256, 6845060, 'Rua das Sairas', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(458257, 6820270, 'Rua São Paulo', 'Jardim Emílio Carlos', 'Embu das Artes', 'SP'),
(458258, 6826515, 'Rua Solimões', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(458259, 6826490, 'Rua Tietê', 'Jardim Novo Campo Limpo', 'Embu das Artes', 'SP'),
(458260, 6803070, 'Rua Uniãoo', 'Centro', 'Embu das Artes', 'SP'),
(458261, 6846060, 'Rua Viracopos', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(458262, 6816540, 'Rua Angola', 'Jardim São Luiz', 'Embu das Artes', 'SP'),
(458263, 6835530, 'Praça Araucárias', 'Jardim Pinheirinho', 'Embu das Artes', 'SP'),
(458264, 6845180, 'Rua Belizário José de Oliveira', 'Parque São Leonardo', 'Embu das Artes', 'SP'),
(458265, 6810600, 'Rua Capitu', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458266, 6810510, 'Rua Colorado', 'Jardim Casa Branca', 'Embu das Artes', 'SP'),
(458267, 6806140, 'Rua Dom Pedro II', 'Jardim Santa Maria', 'Embu das Artes', 'SP'),
(458268, 6804110, 'Rua Emiliano Di Cavalcanti', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458269, 6817090, 'Rua Girassóis', 'Jardim Lavorato', 'Embu das Artes', 'SP'),
(458270, 6843470, 'Rua Guaranis', 'Chácaras Marajuara', 'Embu das Artes', 'SP'),
(458271, 6825045, 'Rua Jerusalém', 'Chácaras Caxingui', 'Embu das Artes', 'SP'),
(458272, 6826080, 'Rua José Bonifácio', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458273, 6813160, 'Rua Lapa', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458274, 6807060, 'Rua Novo Hamburgo', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458275, 6810020, 'Rua Perequito', 'Jardim Castilho', 'Embu das Artes', 'SP'),
(458276, 6804100, 'Rua Rebolo Gonzales', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458277, 6817110, 'Estrada Santa Bárbara', 'Jardim Santa Bárbara', 'Embu das Artes', 'SP'),
(458278, 6814130, 'Travessa São Bento', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458279, 6826210, 'Rua São Vicente', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(458280, 6815460, 'Rua Ator', 'Vila Ínsis Cristina', 'Embu das Artes', 'SP'),
(458281, 6816410, 'Rua Balaiada', 'Vila Perequê', 'Embu das Artes', 'SP'),
(458282, 6826330, 'Rua Cabo Verde', 'Jardim Marina', 'Embu das Artes', 'SP'),
(458283, 6820071, 'Rua Carlos Spera', 'Jardim Fabiana', 'Embu das Artes', 'SP'),
(458284, 6826140, 'Rua Cláudio Manoel da Costa', 'Jardim Independência', 'Embu das Artes', 'SP'),
(458285, 6840090, 'Rua Constelaçãoo', 'Jardim Novo Embu', 'Embu das Artes', 'SP'),
(458286, 6846030, 'Rua dos Crisântemos', 'Chácaras São Cristóvãoo', 'Embu das Artes', 'SP'),
(458287, 6844240, 'Alameda Ema', 'Jardim Itatiaia', 'Embu das Artes', 'SP'),
(458288, 6803050, 'Rua Alexandrina Bassith', 'Centro', 'Embu das Artes', 'SP'),
(458289, 6807470, 'Avenida Florianópolis', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458290, 6846500, 'Rua Grande Otelo', 'Jardim Indaiá', 'Embu das Artes', 'SP'),
(458291, 6823460, 'Rua Henfil Henrique de Souza Filho', 'Jardim Taima', 'Embu das Artes', 'SP'),
(458292, 6816190, 'Rua Igarapava', 'Parque Luíza', 'Embu das Artes', 'SP'),
(458293, 6826180, 'Rua Itambaú', 'Jardim São Vicente', 'Embu das Artes', 'SP'),
(458294, 6843570, 'Rua João dos Santos Chantre', 'Jardim Mascarenhas', 'Embu das Artes', 'SP'),
(458295, 6815180, 'Rua Juruá', 'Parque Pirajussara', 'Embu das Artes', 'SP'),
(458296, 6823390, 'Rua Leme', 'Jardim Dom José', 'Embu das Artes', 'SP'),
(458297, 6845310, 'Rua Luís Vaz de Camões', 'Chácaras Bartira', 'Embu das Artes', 'SP'),
(458298, 6846220, 'Rua das Margaridas', 'Vale do Sol', 'Embu das Artes', 'SP'),
(458299, 6844300, 'Rua Matni', 'Esplanada', 'Embu das Artes', 'SP'),
(458300, 6807130, 'Rua Mongaguá', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458301, 6815340, 'Rua Orion', 'Jardim do Colégio', 'Embu das Artes', 'SP'),
(458302, 6826460, 'Rua Paranaíba', 'Paranapanema', 'Embu das Artes', 'SP'),
(458303, 6843120, 'Rua Pigmeus', 'Vila Marajoara', 'Embu das Artes', 'SP'),
(458304, 6805240, 'Rua do Portal', 'Moinho Velho', 'Embu das Artes', 'SP'),
(458305, 6833350, 'Avenida Rosana', 'Embu Mirim', 'Embu das Artes', 'SP'),
(458306, 6824035, 'Rua Santana do Parnaíba', 'Jardim Ângela', 'Embu das Artes', 'SP'),
(458307, 6814110, 'Rua São José', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458308, 6824380, 'Caminho dos Seis Amigos', 'Sítio Seis Amigos', 'Embu das Artes', 'SP'),
(458309, 6820221, 'Rua Tancredo Neves', 'Jardim Presidente Kennedy', 'Embu das Artes', 'SP'),
(458310, 6810555, 'Rua Triângulo', 'Vila Triângulo', 'Embu das Artes', 'SP'),
(458311, 6803270, 'Avenida Vereador Jorge de Souza', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(458312, 6813085, 'Rua Brasil', 'Jardim Santa Tereza Novo', 'Embu das Artes', 'SP'),
(458313, 6814000, 'Rua Augusto de Almeida Batista', 'Jardim São Marcos', 'Embu das Artes', 'SP'),
(458314, 6804225, 'Rua Maestro Tom Jobim', 'Jardim Recanto da Fonte', 'Embu das Artes', 'SP'),
(458315, 6807335, 'Rua Porto Velho', 'Jardim Vista Alegre', 'Embu das Artes', 'SP'),
(458316, 6844005, 'Estrada Vereador Norberto Diniz', 'Embu Colonial', 'Embu das Artes', 'SP'),
(458317, 6814182, 'Rua Jamaica', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(458318, 6814225, 'Rua Panamá', 'Jardim dos Moraes', 'Embu das Artes', 'SP'),
(458319, 6804175, 'Rua Aleardo Carpi', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458320, 6803255, 'Rua Décio Aranha', 'Jardim Arabutan', 'Embu das Artes', 'SP'),
(458321, 6804135, 'Rua Francisco Júlio de Castro', 'Cercado Grande', 'Embu das Artes', 'SP'),
(458322, 6824500, 'Rua Líder', 'Jardim Batista', 'Embu das Artes', 'SP'),
(458323, 6810093, 'Rua Ãlamo', 'Jardim Flórida', 'Embu das Artes', 'SP'),
(458324, 6843445, 'Rua Julieta Jacyra Gallo', 'Chácaras Lidia', 'Embu das Artes', 'SP'),
(458325, 6843448, 'Rua dos Ex-Combatentes', 'Chácaras Lidia', 'Embu das Artes', 'SP'),
(458326, 6843450, 'Rua Waldomiro Gallo', 'Chácaras Lidia', 'Embu das Artes', 'SP');

INSERT INTO tbl_produto (nome_produto, desc_produto,unid_medida, estoque_atual, estoque_min, estoque_max, valor) VALUES
    ('Arroz','Arroz agulhinha tipo 1','SC', 10,2,20, 12.50 ),
    ('Feijão','Feijão carioquinha com casca','SC', 25,5,60, 7.50 ),
    ('Macarrão','Macarrão Adria espaguete','PC', 50,10,80, 5.50 ),
    ('Óleo','Óleo Lisa','LT', 15,10,45, 6.50 ),
    ('Vinagre','Vinagre Castolo','GR', 30,10,50, 7.89),
    ('Batata','Batata lavada','KG', 100,50,200, 4.50 ),
    ('Tomate','Tomate vermelho','KG', 80,8,160, 6.90 ),
    ('Cebola','Cebola com casca','KG', 50,5,100, 6.99 ),
    ('Leite','Leite Leco','CX', 25,10,90, 2.50 ),
    ('Café','Café do Ponto','SC', 500,100,200, 11.50 );


INSERT INTO tbl_cliente(nome_cliente, cpf, data_nasc, cep, numero, complemento) VALUES 
	('Marcos Costa de Sousa','12345678901','1981-02-06',6768100,'1525','apto 166C'),
	('Zoroastro Zoando','01987654321','1989-06-15',6757190,'250',''),
	('Idelbrandolâncio Silva','54698721364','1974-09-27',6753001,'120',''),
	('Cosmólio Ferreira','41368529687','1966-12-01',6753020,'25','apto 255 F'),
	('Conegunda Prado','54781269501','1950-10-06',6753020,'50','apto 166C'),
	('Brogundes Asmônio','41256398745','1940-05-10',6753400,'100',''),
	('Iscruência da Silva','12457965823','1974-11-25',6803040,'5',''),
	('Zizafânio Zizundo','54123698562','1964-08-14',6803140,'25',''),
	('Ricuerda Zunda','21698534589','1934-10-14',6803045,'123',''),
	('Aninoado Zinzão','25639856971','1976-12-25',6803070,'50','');

SELECT * FROM tbl_cliente;

SELECT * FROM tbl_pedido;

SELECT * FROM tbl_produto;

SELECT * FROM tbl_endereco;

INSERT INTO tbl_pedido(data_pedido, data_entrega, cod_cliente) VALUES
('2022/01/15','2022/01/17',1),
('2022/01/18','2022/01/19',3),
('2022/01/27','2022/01/31',5),
('2022/02/01','2022/02/03',6),
('2022/02/15','2022/02/17',2);

SELECT * FROM tbl_itempedido;

INSERT tbl_itempedido(qtde, i_cod_pedido, i_cod_produto, i_valor) VALUES
(7, 1, 1, 12.50 * 7),
(5, 1, 3, 5.50 * 5),
(4, 1, 7, 6.90 * 4),

(4, 2, 4, 6.50 * 4),
(3, 2, 5, 7.89 * 3),
(1, 2, 8, 6.99 * 1),

(10, 3, 6, 4.50 * 10),
(2, 3, 4, 6.50 * 2),
(5, 3, 2, 7.50 * 5),

(25, 4, 10, 11.50 * 25),
(5, 4, 9, 2.50 * 5),
(20, 4, 7, 6.90 * 20),

(1, 5, 7, 6.90 * 1),
(1, 5, 3, 5.50 * 1),
(2, 5, 1, 12.50 * 2);

SELECT * FROM tbl_pedido;

SELECT * FROM tbl_itempedido;

#Quantidade de Itens geral dos pedidos por cada indivíduo (independente do pedido - Soma do histórico)

SELECT count(*) QuantidadeItens, a.nome_cliente NomeDoCliente, a.cep CEP FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
	GROUP BY a.nome_cliente, a.cep;
	
#Quantidade de Itens de um pedido específico por um indivíduo

SELECT count(*) QuantidadeItens, b.cod_pedido Pedido, a.nome_cliente NomeDoCliente, a.cep CEP FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
	WHERE b.cod_pedido = 1
    GROUP BY a.nome_cliente, a.cep;	
    
#Quantidade de Itens de todos os pedidos por um indivíduo

SELECT count(*) QuantidadeItens, b.cod_pedido Pedido, a.nome_cliente NomeDoCliente, a.cep CEP FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
	WHERE a.cod_cliente= 1
    GROUP BY a.nome_cliente, a.cep;	
	
#Quantidade de pedidos por indivíduo 

SELECT count(*) QuantidadePedidos, a.nome_cliente NomeDoCliente, a.cep CEP FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	GROUP BY a.nome_cliente;
	
#Pedido - Endereço - Produto - Cliente

SELECT b.nome_cliente NomeDoCliente, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF, e.nome_produto NomeProduto, e.valor Valor FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	JOIN tbl_itempedido d ON c.cod_pedido = d.i_cod_pedido
	JOIN tbl_produto e ON d.i_cod_produto = e.cod_produto;
	
#Pedido - Endereço - Produto - Cliente (Cliente Indivídual - Todos Pedidos)

SELECT b.nome_cliente NomeDoCliente, c.cod_pedido Pedido, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF, e.nome_produto NomeProduto, e.valor Valor FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	JOIN tbl_itempedido d ON c.cod_pedido = d.i_cod_pedido
	JOIN tbl_produto e ON d.i_cod_produto = e.cod_produto
	WHERE b.cod_cliente = 1;	

#Pedido - Endereço - Produto - Cliente (Cliente Indivídual - Pedido Indivídual)

SELECT b.nome_cliente NomeDoCliente, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF, e.nome_produto NomeProduto, e.valor Valor FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	JOIN tbl_itempedido d ON c.cod_pedido = d.i_cod_pedido
	JOIN tbl_produto e ON d.i_cod_produto = e.cod_produto
	WHERE c.cod_pedido = 1;
	
#Pedido - Endereço - Data - Cliente (Geral)

SELECT b.nome_cliente NomeDoCliente, c.data_pedido DataInicial, c.data_entrega DataFinal, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	ORDER BY c.data_entrega;
	
#Pedido - Endereço - Data - Cliente (DataFinal Ultrapassada - Mais recente para mais antiga)

SELECT b.nome_cliente NomeDoCliente, c.data_pedido DataInicial, c.data_entrega DataFinal, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	WHERE c.data_entrega < date(now())
	ORDER BY c.data_entrega desc;
	
#Pedido - Endereço - Data - Cliente (DataFinal ainda não Ultrapassada - Mais proxíma para mais longeva)

SELECT b.nome_cliente NomeDoCliente, c.data_pedido DataInicial, c.data_entrega DataFinal, b.cep CEP, a.logradouro Logradouro, a.bairro Bairro, a.cidade Cidade, a.estado UF FROM tbl_endereco a
	JOIN tbl_cliente b ON a.cep = b.cep
	JOIN tbl_pedido c ON b.cod_cliente = c.cod_cliente
	WHERE c.data_entrega > date(now())
	ORDER BY c.data_entrega desc;
    
#Pedido - Cliente sem pedidos

SELECT a.nome_cliente NomeDoCliente FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	WHERE b.cod_cliente IS NULL
	ORDER BY a.nome_cliente desc;
    
#Pedido - Cliente com pedido

SELECT a.nome_cliente NomeDoCliente FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	WHERE b.cod_cliente IS NOT NULL
	ORDER BY a.nome_cliente desc;
    
#Cliente - Produto (Todos Produtos sem restrições)

SELECT a.nome_cliente NomeDoCliente, d.cod_produto CodigoProduto, d.nome_produto NomeProduto, d.valor Valor FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto;
    
#Cliente - Produto (Produto especificado e Quantidade adquirida pelo cliente(S))

SELECT sum(c.qtde) QuantidadeProduto, a.nome_cliente NomeDoCliente, d.cod_produto CodigoProduto, d.nome_produto NomeProduto, d.valor Valor FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
	WHERE d.nome_produto = "Tomate"
    GROUP BY a.nome_cliente;
    
#Cliente - Produto (Produto especificado e Pedido especificado / Quantidade adquirida pelo cliente no pedido selecionado)

SELECT sum(c.qtde) QuantidadeProduto, a.nome_cliente NomeDoCliente, d.cod_produto CodigoProduto, d.nome_produto NomeProduto, d.valor Valor FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
	WHERE d.nome_produto = "Tomate" AND b.cod_pedido = 1
    GROUP BY a.nome_cliente;
    
#Cliente - Produto (Quantidade de produtos aderidos no total e em ordem)

SELECT sum(b.qtde) QuantidadeProduto, c.cod_produto CodigoProduto, c.nome_produto NomeProduto, b.qtde * c.valor Total FROM tbl_pedido a
	JOIN tbl_itempedido b ON a.cod_pedido = b.i_cod_pedido
	JOIN tbl_produto c ON b.i_cod_produto = c.cod_produto
    GROUP BY c.nome_produto
    ORDER BY QuantidadeProduto desc; 
    
#Cliente - Produto (Quantidade de produtos aderidos no total e em ordem [Cliente Especificado / Sem especificação de pedido])

SELECT sum(c.qtde) QuantidadeProduto, b.cod_pedido CodigoPedido, d.cod_produto CodigoProduto, d.nome_produto NomeProduto, c.qtde * d.valor TotalProduto FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
    JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
    WHERE a.cod_cliente = 1
    GROUP BY d.nome_produto
    ORDER BY QuantidadeProduto desc; 
    
#Cliente - Produto (Quantidade de produtos aderidos no total e em ordem [Pedido especificado / Sem especificação de cliente])

SELECT sum(c.qtde) QuantidadeProduto, d.cod_produto CodigoProduto, d.nome_produto NomeProduto, c.qtde * d.valor TotalProduto FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
    JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
    WHERE b.cod_pedido = 2
    GROUP BY d.nome_produto
    ORDER BY QuantidadeProduto desc; 
    
#Tabela ItemPedido (Facilitando a leitura e análise)

 SELECT b.nome_produto NomeProduto, c.cod_pedido CodigoPedido, d.nome_cliente NomeCliente FROM tbl_itempedido a
	JOIN tbl_produto b ON a.i_cod_produto = b.cod_produto
	JOIN tbl_pedido c ON a.i_cod_pedido = c.cod_pedido
	JOIN tbl_cliente d ON c.cod_cliente = d.cod_cliente;

#Tabela ItemPedido (Facilitando a leitura e análise [Especificando Cliente])

 SELECT b.nome_produto NomeProduto, c.cod_pedido CodigoPedido, d.nome_cliente NomeCliente FROM tbl_itempedido a
	JOIN tbl_produto b ON a.i_cod_produto = b.cod_produto
	JOIN tbl_pedido c ON a.i_cod_pedido = c.cod_pedido
	JOIN tbl_cliente d ON c.cod_cliente = d.cod_cliente
	WHERE d.cod_cliente = 1;
	
#Tabela ItemPedido (Facilitando a leitura e análise [Especificando Pedido])

 SELECT b.nome_produto NomeProduto, c.cod_pedido CodigoPedido, d.nome_cliente NomeCliente FROM tbl_itempedido a
	JOIN tbl_produto b ON a.i_cod_produto = b.cod_produto
	JOIN tbl_pedido c ON a.i_cod_pedido = c.cod_pedido
	JOIN tbl_cliente d ON c.cod_cliente = d.cod_cliente
	WHERE c.cod_pedido = 1;
    

#Produto - (Mais caro e mais barato)

SELECT nome_produto Produto, valor Valor FROM tbl_produto WHERE valor = (SELECT max(valor) FROM tbl_produto) UNION  
SELECT nome_produto Produto, valor Valor FROM tbl_produto WHERE valor = (SELECT min(valor) FROM tbl_produto);

#Produto - (Mais requistiado e menos requisitado em um pedido)

SELECT sum(b.qtde) QuantidadeProduto, c.nome_produto NomeProduto FROM tbl_pedido a
	JOIN tbl_itempedido b ON a.cod_pedido = b.i_cod_pedido
	JOIN tbl_produto c ON b.i_cod_produto = c.cod_produto
    WHERE b.qtde = (SELECT max(qtde) FROM tbl_itempedido)
	GROUP BY c.nome_produto
UNION 
SELECT sum(b.qtde) QuantidadeProduto, c.nome_produto NomeProduto FROM tbl_pedido a 
	JOIN tbl_itempedido b ON a.cod_pedido = b.i_cod_pedido
	JOIN tbl_produto c ON b.i_cod_produto = c.cod_produto
	WHERE b.qtde = (SELECT min(qtde) FROM tbl_itempedido)
	GROUP BY c.nome_produto;
    
# Total gasto pelo Cliente (Quantidade de Produto e valor Bruto total)

SELECT a.nome_cliente NomeCliente, sum(c.qtde) QuantidadeProduto, sum(c.qtde * d.valor) ValorTotal FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
    JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
    WHERE a.cod_cliente = 3
    GROUP BY a.nome_cliente;
	
# Total gasto em um pedido (Quantidade de Produto e valor Bruto total)

SELECT a.nome_cliente NomeCliente, b.cod_pedido CodigoPedido, sum(c.qtde) QuantidadeProduto, sum(c.qtde * d.valor) ValorTotal FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
    JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto
    WHERE b.cod_pedido = 1
    GROUP BY a.nome_cliente;
    

begin;
update tbl_endereco set logradouro = 'vish';
rollback;
    
SELECT * from tbl_endereco;
    
    
# VIEWS

CREATE VIEW vw_cliped AS
	SELECT c.cod_cliente codigo, c.nome_cliente nome, p.cod_pedido pedido, p.data_pedido data_requisicao
    from tbl_cliente c, tbl_pedido p
    where c.cod_cliente = p.cod_cliente;	
    
SELECT * FROM vw_cliped;

CREATE VIEW vw_clipedprod AS
	SELECT c.cod_cliente codigo, c.nome_cliente nome, p.cod_pedido pedido, p.data_pedido data_requisicao, i.i_cod_produto produto, i.qtde
    FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i
    WHERE c.cod_cliente = p.cod_cliente
	AND i.i_cod_pedido = p.cod_pedido;
    
SELECT * FROM vw_clipedprod;

CREATE VIEW vw_clipedprodTotal AS
	SELECT c.cod_cliente codigo, c.nome_cliente nome, p.cod_pedido pedido, p.data_pedido data_requisicao, i.i_cod_produto produto, i.qtde, pr.valor, i.qtde * pr.valor totalComprado
    FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i, tbl_produto pr
    WHERE c.cod_cliente = p.cod_cliente
	AND i.i_cod_pedido = p.cod_pedido
    AND i.i_cod_produto = pr.cod_produto;
    
SELECT * FROM vw_clipedprodTotal; 


# VIEW CONSOLIDADA

CREATE VIEW vw_consolidade (cod_produto, cod_pedido, valor) AS
	SELECT p.cod_pedido, i.i_cod_produto, i.qtde * pr.valor
	FROM tbl_pedido p, tbl_itempedido i, tbl_produto pr
    WHERE i.i_cod_pedido = p.cod_pedido
    AND i.i_cod_produto = pr.cod_produto; 
	
SELECT * FROM vw_consolidade;



# A) Que enxerguem os dados do cliente (código e nome) e pedidos (número do pedido,
# data do pedido e data de entrega), onde a data do pedido seja superior a
# 30/01/2014;


SELECT a.cod_cliente AS CodigoCliente, a.nome_cliente AS NomeCliente, b.cod_pedido AS CodigoPedido, b.data_pedido AS DataRequisição, b.data_entrega AS DataEntrega FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	WHERE date(b.data_pedido) > '2014-01-30';

# VIEW Version

CREATE VIEW vw_dadosClientePedidoData (CodigoCliente, NomeCliente, CodigoPedido, DataRequisição, DataEntrega) AS
	SELECT a.cod_cliente, a.nome_cliente, b.cod_pedido, b.data_pedido, b.data_entrega FROM tbl_cliente a
		JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
		WHERE date(b.data_pedido) > '2014-01-30';

SELECT * FROM vw_dadosClientePedidoData;

# b) Que enxerguem os dados do cliente (código do cliente e nome), dados do pedido
# (código do pedido, data do pedido e data da entrega), os dados do item do pedido
# (quantidade e código do produto), onde a quantidade destes produtos sejam
# maiores de 25;

SELECT a.cod_cliente AS CodigoCliente, a.nome_cliente AS NomeCliente, b.cod_pedido AS CodigoPedido, b.data_pedido AS DataRequisição, b.data_entrega AS DataEntrega, c.qtde AS Quantidade, c.i_cod_produto AS CodigoProduto FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	WHERE c.qtde > 25;
    
# VIEW Version

CREATE VIEW vw_dadosClientePedido (CodigoCliente, NomeCliente, CodigoPedido, DataRequisição, DataEntrega, Quantidade, CodigoProduto) AS
	SELECT a.cod_cliente, a.nome_cliente, b.cod_pedido, b.data_pedido, b.data_entrega, c.qtde, c.i_cod_produto FROM tbl_cliente a
		JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
		JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
		WHERE c.qtde > 25;
        
SELECT * FROM vw_dadosClientePedido;

# c) Que enxerguem os dados do pedido (código do pedido, código do cliente), os
# dados do item do pedido (quantidade, código do produto e descrição do produto);

SELECT b.cod_pedido AS CodigoPedido, a.cod_cliente AS CodigoCliente, c.qtde AS Quantidade, d.cod_produto AS CodigoProduto, d.desc_produto AS DescriçãoProduto FROM tbl_cliente a
	JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
	JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
	JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto;
	
# VIEW Version

CREATE VIEW vw_dadosPedidoItem (CodigoPedido, CodigoCliente, Quantidade, CodigoProduto, DescriçãoProduto) AS
	SELECT b.cod_pedido, a.cod_cliente, c.qtde, d.cod_produto, d.desc_produto FROM tbl_cliente a
		JOIN tbl_pedido b ON a.cod_cliente = b.cod_cliente
		JOIN tbl_itempedido c ON b.cod_pedido = c.i_cod_pedido
		JOIN tbl_produto d ON c.i_cod_produto = d.cod_produto;

SELECT * FROM vw_dadosPedidoItem;


# d) Que enxerguem os produtos reajustados em 11,2 %, onde deverá ser mostrado o
# código e a descrição do produto, o valor atual e o valor reajustado.

SELECT cod_produto AS CodigoProduto, desc_produto AS DescriçãoProduto, valor AS ValorAtual, CAST((valor + valor * 0.112) AS DECIMAL(4,1)) AS ValorReajustado FROM tbl_produto;

# VIEW Version

CREATE VIEW vw_prodReajust (CodigoProduto, DescriçãoProduto, ValorAtual, ValorReajustado) AS
	SELECT cod_produto, desc_produto, valor, CAST((valor + valor * 0.112) AS DECIMAL(4,1)) FROM tbl_produto;

SELECT * FROM vw_prodReajust;

## TBL LOG

CREATE TABLE tbl_log(
	id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    dt_log DATE NOT NULL,
    hora TIME NOT NULL
);

DELIMITER $

CREATE TRIGGER trg_logCliente1 BEFORE DELETE 
ON tbl_cliente 
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log 
                (usuario, dt_log, hora)
	VALUES (user(), curdate(), curtime(), "EXCLUSÃO", "tbl_cliente");

END $
DELIMITER ;

# ATIVIDADE - TRIGGER / PROCEDURY

/*Modifique a tabela tbl_log acrescentando um campo onde armazene o tipo de
operação realizada, sendo: “INSERÇÃO”, “ATUALIZAÇÃO” ou “EXCLUSÃO” e
outro campo que armazene a tabela que está sendo realizadas as ações*/

ALTER TABLE tbl_log ADD COLUMN operacao_tipo ENUM('INSERÇÃO','ATUALIZAÇÃO','EXCLUSÃO');
ALTER TABLE tbl_log ADD COLUMN tabela VARCHAR(30);

/*De acordo com o exercício A crie uma trigger que ao atualizar e antes de qualquer
ação na tabela de Pedidos;*/

DELIMITER $

CREATE TRIGGER trg_logPedidos1 BEFORE UPDATE 
ON tbl_pedido
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log 
                (usuario, dt_log, hora)
	VALUES (user(), curdate(), curtime(), "ATUALIZAÇÃO", "tbl_pedidos");

END $
DELIMITER ;

/*De acordo com o exercício A crie uma trigger que ao excluir e antes de qualquer
ação na tabela de Produtos*/


DELIMITER $

CREATE TRIGGER trg_logProduto1 BEFORE DELETE 
ON tbl_produto
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log 
                (usuario, dt_log, hora)
	VALUES (user(), curdate(), curtime(), "EXCLUSÃO", "tbl_produto");

END $

DELIMITER ;

/*De acordo com o exercício A crie uma trigger que ao inserir e depois de qualquer
ação na tabela de Clientes*/

DELIMITER $

CREATE TRIGGER trg_logCliente2 AFTER INSERT
ON tbl_cliente
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log 
                (usuario, dt_log, hora)
	VALUES (user(), curdate(), curtime(), "INSERÇÃO", "tbl_cliente");

END $

DELIMITER ;

#-----------------------------------------------------------------------------------------------#

DELIMITER $$

CREATE PROCEDURE prc_ins_prod (IN vnomeprod CHAR(100),
							   IN vvalor DECIMAL(10,2),
							   OUT msg VARCHAR(100))
		
        BEGIN 
             DECLARE valor DECIMAL(10,2);
             DECLARE erro BOOL;
             
             SET erro = TRUE;
             
             IF (vvalor > 0) THEN
                 SET valor = vvalor;
			 ELSE 
                 SET erro = FALSE;
                 SET msg = "valor zerado, verique!";
			 END IF;
             
             IF (erro) THEN
				 INSERT INTO tbl_produto (nome_produto, valor)
                 VALUES (vnomeprod, vvalor);
                 SET msg = "incluindo com sucesso!";
			 END IF;
		END $$
DELIMITER ;

CALL prc_ins_prod('ovo',2.55,@msg);

SELECT @msg;

SELECT * FROM tbl_produto;

# ATIVIDADE 24-05-2022

/*Crie um procedimento armazenado que é passado o código do produto na tabela de
produtos e um percentual para calcular o acréscimo ao valor desse mesmo produto, o
retorno deverá ser uma mensagem informando se a operação foi feita de forma correta.*/

# DROP PROCEDURE pcr_calcAcrescimo;

DELIMITER $$

	CREATE PROCEDURE pcr_calcAcrescimo(IN p_cod_prod INT, IN p_percentual DECIMAL, OUT msg VARCHAR(100), OUT percentualResult DECIMAL(10,2))
    
   BEGIN
		DECLARE percentual DECIMAL(10,2);
        DECLARE valorFinal DECIMAL(10,2);
        DECLARE valorOriginal DECIMAL(10,2);
		DECLARE erro BOOL;
        
        SET erro = TRUE;
        
        IF (p_percentual > 0) THEN
			 SET percentual = p_percentual/100;
		
        ELSE
			SET erro = FALSE;
            SET msg = "Percentual zerado";
        END IF;
        
         IF (erro) THEN
         
				SET valorOriginal = (SELECT valor FROM tbl_produto WHERE cod_produto = p_cod_prod);
                
                IF(valorOriginal IS NULL) THEN
					SET msg = "Código inexistente";
				
                ELSE
					SET valorFinal = valorOriginal + (valorOriginal * percentual);
					UPDATE tbl_produto SET valor = valorFinal WHERE cod_produto = p_cod_prod;
					SET msg = "Valor recebeu acrescimo com sucesso!";
				END IF;
		END IF;
    END $$
DELIMITER ;

CALL pcr_calcAcrescimo(2,10,@msg,@percentualResult);

SELECT * FROM tbl_produto;

SELECT @msg;
SELECT @percentualResult;

/*Crie um procedimento armazenado que grave na tabela de log (Exercício d) da
atividade anterior, no campo tipo de operação, informem “INS_TRIGGER” o registro de
auditoria;*/

DELIMITER $$

	CREATE PROCEDURE pcr_insertLog(IN p_tabela VARCHAR(30))
    
	BEGIN
		INSERT INTO tbl_log (usuario, dt_log, hora, operacao, tabela)
		VALUES (user(), curdate(), curtime(), "INS_TRIGGER", p_tabela);
    END $$
DELIMITER ;

/*DESAFIO: agora remova a TRIGGER que você criou conforme o exercício anterior - d),
montando uma nova TRIGGER, só que agora, a mesma deverá chamar a execução do
procedimento armazenado criado nessa atividade no item b).*/

/*De acordo com o exercício A crie uma trigger que ao inserir e depois de qualquer
ação na tabela de Clientes*/

DELIMITER $

CREATE TRIGGER trg_logCliente2 AFTER INSERT
ON tbl_cliente
FOR EACH ROW
BEGIN
	CALL pcr_insertLog(tbl_cliente);
END $

DELIMITER ;

/*-----------------------------------------------------------------------------------------------*/

/* TABELA TEMPORÁRIA */
CREATE TEMPORARY TABLE tbl_aux (
	num_exec   INTEGER NOT NULL,
	seq        INTEGER NOT NULL,
	descricao  VARCHAR(20),
	tipo_repet VARCHAR(10),
	PRIMARY KEY(num_exec, seq)
);

/* ESTRUTURA DE REPETIÇÃO WHILE */

DELIMITER $$
CREATE PROCEDURE acum_while (IN limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE soma INT DEFAULT 0;
	DECLARE result VARCHAR(20);
	DECLARE num_exec1 INTEGER;
	
	SELECT IFNULL(MAX(num_exec) + 1,1) num_exec INTO num_exec1 FROM tbl_aux;
	
	WHILE contador < limite DO
		SET contador = contador + 1;
		SET soma = soma + contador;
		INSERT INTO tbl_aux(num_exec, seq, descricao, tipo_repet)
					 VALUES(num_exec1, contador, soma, 'while');
	END WHILE;
	
	SELECT * FROM tbl_aux;
END $$
DELIMITER ;

CALL acum_while(12);

/* ESTRUTURA DE REPETIÇÃO LOOP */

DELIMITER $$
CREATE PROCEDURE acum_loop (IN limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE soma INT DEFAULT 0;
	DECLARE result VARCHAR(20);
	DECLARE num_exec1 INTEGER;
	
	SELECT IFNULL(MAX(num_exec) + 1,1) num_exec INTO num_exec1 FROM tbl_aux;
	
	loop_acum : loop
		
		SET contador = contador + 1;
		SET soma = soma + contador;
		
		IF contador >= limite THEN
			LEAVE loop_acum;
		ELSE
			INSERT INTO tbl_aux(num_exec, seq, descricao, tipo_repet)
						 VALUES(num_exec1, contador, soma, 'loop');
		END IF;
	END LOOP loop_acum;
	SELECT * FROM tbl_aux;
END $$
DELIMITER ;

CALL acum_loop(12);

/* ESTRUTURA DE REPETIÇÃO REPEAT */

DELIMITER $$
CREATE PROCEDURE acum_repeat (IN limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE soma INT DEFAULT 0;
	DECLARE result VARCHAR(20);
	DECLARE num_exec1 INTEGER;
	
	SELECT IFNULL(MAX(num_exec) + 1, 1) num_exec INTO num_exec1 FROM tbl_aux;
	
	REPEAT
		SET contador = contador + 1;
		SET soma = soma + contador;
		INSERT INTO tbl_aux(num_exec, seq, descricao, tipo_repet)
					 VALUES(num_exec1, contador, soma,'repeat');
		
		UNTIL contador >= limite;
	END REPEAT;
	SELECT * FROM tbl_aux;

END $$
DELIMITER ;

CALL acum_repeat(12);

/*-----------------------------------------------------------------------------------------------*/

#PROCEDURE PARA CRIAÇÃO DE TABELAS TEMPORÁRIAS

DROP PROCEDURE cria_tabela;

DELIMITER @@
CREATE PROCEDURE cria_tabela()
	BEGIN
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_auxprod (
			aux_prod    INTEGER NOT NULL,
			aux_desc    VARCHAR(20),
			qtde_ajust 	VARCHAR(10),
			data_hora 	DATETIME DEFAULT now(),
			PRIMARY KEY(aux_prod, data_hora)
		);
		
		DELETE FROM tbl_auxprod;
	END @@
DELIMITER ;

#PROCEDURE PARA AJUSTE DE ESTOQUE

DROP PROCEDURE ajusta_estoque;

DELIMITER $$
CREATE PROCEDURE ajusta_estoque(IN qtde INT, OUT msg CHAR(100))
		BEGIN
            -- Definição de variáveis utilizadas na procedure
			DECLARE p_linha    INT DEFAULT 0;
			DECLARE p_codigo   INT DEFAULT 0;
			DECLARE p_descri   VARCHAR(100);
			DECLARE p_estoque  INT DEFAULT 0;
			DECLARE p_status   INT DEFAULT 0;
		
			-- Definição do cursor
			 
			DECLARE meucursor CURSOR FOR  SELECT cod_produto, nome_produto, estoque_atual FROM tbl_produto;
			
			-- Definição de variável de controle de looping do cursor
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_linha = 1;
			
			-- Abertura do cursor
			OPEN meucursor;
			
			-- Chamada da procedure de criação da tabela temporária
			CALL cria_tabela();
            
            SET SQL_SAFE_UPDATES=0;
			
			-- Looping de execução do cursor
			meuloop: loop
				fetch meucursor INTO p_codigo, p_descri, p_estoque;
				
				-- Controle de existir mais registros na tabela (Caso o cursor acabar, ele irá seta p_linha = 1)
				IF p_linha = 1 THEN
					
                    -- Abaixo, há um SELECT com count(*) na tabela de auxílio, indicando quantos campos foram inseridos 
                    -- (Caso for maior que 0, houve inserção na tabela de auxílio)
					SELECT COUNT(*) INTO p_status FROM tbl_auxprod;
					IF p_status > 0 THEN
					
						-- Seleciona a tabela temporária
						SELECT * FROM tbl_auxprod;
						LEAVE meuloop;
					
                    -- (Caso for menor que 0, não houve inserção na tabela de auxílio)
                    ELSE
				
						-- A procedure rodou mas sem nenhum processamento
						SET msg = "Nada processado!";
						SELECT msg;
						LEAVE meuloop;
					END IF;
				
                -- Caso o cursor ainda possuir linhas, haverá uma verificação continua para a atualização do estoque com os itens em que o estoque for igual a quantidade informada.  
                ELSEIF p_estoque = qtde THEN
					
					-- Atualiza o estoque
					UPDATE tbl_produto SET estoque_atual = qtde + 2 WHERE cod_produto = p_codigo;
					
					-- Insere os dados na tabela temporária
					INSERT INTO tbl_auxprod (aux_prod, aux_desc, qtde_ajust)
									  VALUES(p_codigo, p_descri, p_estoque + 2);
				END IF;
			END loop meuloop;
			
			-- Fechamento do cursor
			CLOSE meucursor;
            SET SQL_SAFE_UPDATES=1;
		END $$
DELIMITER ;

SELECT * FROM tbl_produto;
  
SET SQL_SAFE_UPDATES=0;
CALL ajusta_estoque(2, @msg);
CALL cria_tabela;

/*
	1º - Analisem a procedure que acabamos de fazer e procure melhorar sua
	performance, otimizando-a de acordo com a proposta passada pelo professor;
*/



/*
	2º - Modifique a procedure que usamos em cursores de forma que ao passar um
	parâmetro (percentual de aumento), a tabela de produto tenha o valor do mesmo reajustado,
	mas somente para os produtos em que o valor seja inferior a R$ 10,00.
*/

DROP PROCEDURE cria_tabelaComPreco;

DELIMITER @@
CREATE PROCEDURE cria_tabelaComPreco()
	BEGIN
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_auxprodPreco (
			aux_prod    INTEGER NOT NULL,
			aux_desc    VARCHAR(20),
			qtde_ajust 	VARCHAR(10),
			valor_ajust DECIMAL(10,2),
			data_hora 	DATETIME DEFAULT now(),
			PRIMARY KEY(aux_prod, data_hora)
		);
		
		DELETE FROM tbl_auxprodPreco;
	END @@
DELIMITER ;


DROP PROCEDURE ajusta_estoqueEPreco;

DELIMITER $$
CREATE PROCEDURE ajusta_estoqueEPreco(IN qtde INT, IN perc_aument DECIMAL, OUT msg CHAR(100))
		BEGIN
            -- Definição de variáveis utilizadas na procedure
			DECLARE p_linha    INT DEFAULT 0;
			DECLARE p_codigo   INT DEFAULT 0;
			DECLARE p_descri   VARCHAR(100);
			DECLARE p_estoque  INT DEFAULT 0;
			DECLARE p_status   INT DEFAULT 0;
			DECLARE p_valor    DECIMAL(10,2) DEFAULT 0;
			
			DECLARE p_percentual DECIMAL(10,2) DEFAULT 0;
		
			-- Definição do cursor
			 
			DECLARE meucursor CURSOR FOR  SELECT cod_produto, nome_produto, estoque_atual, valor FROM tbl_produto;
			
			-- Definição de variável de controle de looping do cursor
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_linha = 1;
			
			-- Abertura do cursor
			OPEN meucursor;
			
			-- Chamada da procedure de criação da tabela temporária
			CALL cria_tabelaComPreco();
            
			SET p_percentual = perc_aument/100;
			
			-- Looping de execução do cursor
			meuloop: loop
				fetch meucursor INTO p_codigo, p_descri, p_estoque, p_valor;
				
				-- Controle de existir mais registros na tabela (Caso o cursor acabar, ele irá seta p_linha = 1)
				IF p_linha = 1 THEN
					
                    -- Abaixo, há um SELECT com count(*) na tabela de auxílio, indicando quantos campos foram inseridos 
                    -- (Caso for maior que 0, houve inserção na tabela de auxílio)
					SELECT COUNT(*) INTO p_status FROM tbl_auxprodPreco;
					IF p_status > 0 THEN
					
						-- Seleciona a tabela temporária
						SELECT * FROM tbl_auxprodPreco;
						LEAVE meuloop;
					
                    -- (Caso for menor que 0, não houve inserção na tabela de auxílio)
                    ELSE
				
						-- A procedure rodou mas sem nenhum processamento
						SET msg = "Nada processado!";
						SELECT msg;
						LEAVE meuloop;
					END IF;
				
                -- Caso o cursor ainda possuir linhas, haverá uma verificação continua para a atualização do estoque com os itens em que o estoque for igual a quantidade informada.  
                ELSEIF p_estoque = qtde THEN
					
					-- Atualiza o estoque
					UPDATE tbl_produto SET estoque_atual = qtde + 2 WHERE cod_produto = p_codigo;
					
					-- Insere os dados na tabela temporária
					INSERT INTO tbl_auxprodPreco (aux_prod, aux_desc, qtde_ajust)
									  VALUES(p_codigo, p_descri, p_estoque + 2);
									  
						
					-- Ajustando o percentual do valor do produto (Caso for inferior a 10.0)
					IF p_valor < 10.0 THEN
						
						UPDATE tbl_produto SET valor = p_valor + (p_valor * p_percentual) WHERE cod_produto = p_codigo;
						UPDATE tbl_auxprodPreco SET valor_ajust = p_valor + (p_valor * p_percentual) WHERE aux_prod = p_codigo;
					
					ELSE 
						
						UPDATE tbl_auxprodPreco SET valor_ajust = 0.0 WHERE aux_prod = p_codigo;
					
					END IF;
					
				END IF;
			END loop meuloop;
			
			-- Fechamento do cursor
			CLOSE meucursor;
		END $$
DELIMITER ;

SET SQL_SAFE_UPDATES=0;
CALL ajusta_estoqueEPreco(110, 10, @msg);

SELECT  *  FROM tbl_produto;



DROP PROCEDURE ajusta_preco;

DELIMITER $$
CREATE PROCEDURE ajusta_preco(IN perc_aument DECIMAL, OUT msg CHAR(100))
		BEGIN
            -- Definição de variáveis utilizadas na procedure
			DECLARE p_linha    INT DEFAULT 0;
			DECLARE p_codigo   INT DEFAULT 0;
			DECLARE p_descri   VARCHAR(100);
			DECLARE p_estoque  INT DEFAULT 0;
			DECLARE p_status   INT DEFAULT 0;
			DECLARE p_valor    DECIMAL(10,2) DEFAULT 0;
			
			DECLARE p_percentual DECIMAL(10,2) DEFAULT 0;
		
			-- Definição do cursor
			 
			DECLARE meucursor CURSOR FOR  SELECT cod_produto, nome_produto, estoque_atual, valor FROM tbl_produto;
			
			-- Definição de variável de controle de looping do cursor
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_linha = 1;
			
			-- Abertura do cursor
			OPEN meucursor;
			
			-- Chamada da procedure de criação da tabela temporária
			CALL cria_tabelaComPreco();
            
			SET p_percentual = perc_aument/100;
			
			-- Looping de execução do cursor
			meuloop: loop
				fetch meucursor INTO p_codigo, p_descri, p_estoque, p_valor;
				
				-- Controle de existir mais registros na tabela (Caso o cursor acabar, ele irá seta p_linha = 1)
				IF p_linha = 1 THEN
					
                    -- Abaixo, há um SELECT com count(*) na tabela de auxílio, indicando quantos campos foram inseridos 
                    -- (Caso for maior que 0, houve inserção na tabela de auxílio)
					SELECT COUNT(*) INTO p_status FROM tbl_auxprodPreco;
					IF p_status > 0 THEN
					
						-- Seleciona a tabela temporária
						SELECT * FROM tbl_auxprodPreco;
						LEAVE meuloop;
					
                    -- (Caso for menor que 0, não houve inserção na tabela de auxílio)
                    ELSE
				
						-- A procedure rodou mas sem nenhum processamento
						SET msg = "Nada processado!";
						SELECT msg;
						LEAVE meuloop;
					END IF;
				
                -- Caso o cursor ainda possuir linhas, haverá uma verificação continua para a atualização do preço com os itens em que o preço for menor que 10.0
                ELSEIF p_valor < 10.0 THEN
					
					
					-- Insere os dados na tabela temporária
					INSERT INTO tbl_auxprodPreco (aux_prod, aux_desc, qtde_ajust)
									  VALUES(p_codigo, p_descri, p_estoque);
									  

						
					UPDATE tbl_produto SET valor = p_valor + (p_valor * p_percentual) WHERE cod_produto = p_codigo;
					UPDATE tbl_auxprodPreco SET valor_ajust = p_valor + (p_valor * p_percentual) WHERE aux_prod = p_codigo;
				
				ELSE THEN
					UPDATE tbl_auxprodPreco SET valor_ajust = 0.0 WHERE aux_prod = p_codigo;
	
				END IF;
			END loop meuloop;
			
			-- Fechamento do cursor
			CLOSE meucursor;
		END $$
DELIMITER ;