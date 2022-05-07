
CREATE DATABASE eteclinic;

USE eteclinic;

CREATE TABLE tbl_usuario(

	id_login 			INT(11) NOT NULL AUTO_INCREMENT,
    email 				VARCHAR(45) NOT NULL,
    senha 				VARCHAR(64) NOT NULL,
    usuario 			VARCHAR(45) NOT NULL,
    usuario_deletado 	TINYINT(1),
    
    PRIMARY KEY(id_login)
);

CREATE TABLE tbl_enderecos(
	
    id_endereco     INT(11) NOT NULL AUTO_INCREMENT,
	cep 			INT(10) NOT NULL,
    rua 			VARCHAR(45) NOT NULL,
    numero 			VARCHAR(10) NOT NULL,
    bairro 			VARCHAR(45) NOT NULL,
    cidade 			VARCHAR(45) NOT NULL,
    estado 			VARCHAR(2) NOT NULL,
    
    PRIMARY KEY(id_endereco)
);

CREATE TABLE tbl_profissoes(
	
	id_profissao 			INT(11) NOT NULL AUTO_INCREMENT,
    nome_profissao  		VARCHAR(45) NOT NULL,
    profissao_deletada 		TINYINT(1),
    
    PRIMARY KEY(id_profissao)
);

CREATE TABLE tbl_clientes(

	id_cliente 			INT(11) NOT NULL AUTO_INCREMENT,
    cpf					VARCHAR(11) NOT NULL,
    nome_cliente 		VARCHAR(45) NOT NULL,
    telefone_cliente 	VARCHAR(45),
	celular_cliente 	VARCHAR(45),
    email_cliente 		VARCHAR(45),
    tipo_sanguineo		ENUM('A+','B+','O+','AB+','A-','B-','O-','AB-') NOT NULL,
    FK_id_endereco 		INT(11) NOT NULL,
    cliente_deletado 	TINYINT(1),
    
    PRIMARY KEY(id_cliente),
    CONSTRAINT FOREIGN KEY FK_id_endereco(FK_id_endereco) REFERENCES tbl_enderecos(id_endereco)
);


CREATE TABLE tbl_prontuarios(

	id_prontuario 		INT(11) NOT NULL AUTO_INCREMENT,
    data_prontuario		DATE NOT NULL,
    FK_id_cliente		INT(11) NOT NULL,
    
    PRIMARY KEY(id_prontuario),
    CONSTRAINT FOREIGN KEY FK_id_cliente(FK_id_cliente) REFERENCES tbl_clientes(id_cliente)
);

CREATE TABLE tbl_especialistas(

	id_especialista 		INT(11) NOT NULL AUTO_INCREMENT,
    registro 				VARCHAR(45) NOT NULL,
    nome_especialista 		VARCHAR(45) NOT NULL,
    telefone_especialista	VARCHAR(45),
    celular_especialista 	VARCHAR(45),
    email_especialista 		VARCHAR(45),
    FK_id_endereco			INT(11) NOT NULL,
    FK_id_profissao 		INT(11) NOT NULL,
    especialista_deletado 	TINYINT(1),
    
    PRIMARY KEY(id_especialista),
	CONSTRAINT FOREIGN KEY FK_id_endereco1(FK_id_endereco) REFERENCES tbl_enderecos(id_endereco),
	CONSTRAINT FOREIGN KEY FK_id_profissao(FK_id_profissao) REFERENCES tbl_profissoes(id_profissao)
);

CREATE TABLE tbl_atendimentos(

	id_atendimento 		INT(11) NOT NULL AUTO_INCREMENT,
    data_agendada 		DATETIME NOT NULL,
    data_atendimento 	DATETIME,
    valor_atendimento 	DECIMAL(6,2) NOT NULL,
    status_atendimento 	ENUM('Agendado','Realizado','Cancelado') NOT NULL,
    FK_id_prontuario		INT(11) NOT NULL,
    FK_id_especialista 	int(11) NOT NULL,
    
    PRIMARY KEY(id_atendimento),
    CONSTRAINT FOREIGN KEY FK_id_prontuario(FK_id_prontuario) REFERENCES tbl_prontuarios(id_prontuario),
	CONSTRAINT FOREIGN KEY FK_id_especialista(FK_id_especialista) REFERENCES tbl_especialistas(id_especialista)

);

CREATE TABLE tbl_historicos_prontuarios(

	id_historico			INT(11) NOT NULL AUTO_INCREMENT,
    data_atendimento 		DATETIME NOT NULL,
    descricao				TEXT NOT NULL,
    FK_id_atendimento		INT(11) NOT NULL,
    
	PRIMARY KEY(id_historico),
    CONSTRAINT FOREIGN KEY FK_id_atendimento(FK_id_atendimento) REFERENCES tbl_atendimentos(id_atendimento)
);