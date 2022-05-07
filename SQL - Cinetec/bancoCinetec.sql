
#DDL - (CREATE, DROP e ALTER)

#Comentário
#Para executar o comando -> Raios no topo
#Primeiro raio -> Executa todos os comandos em sequência (Ctrl + Shift + Enter)
#Segundo raio -> Executa somente a linha que está selecionada pelo cursor (Ctrl + Enter)

#Clear -> Limpa o console

#Regra
#Não deve-se inciar a criação da estrutura com uma tabela que possui FK


#Criação da DATABASE CINETEC
CREATE DATABASE CINETEC;

#Define o banco que está em operação /--------------------------------------------/
USE CINETEC;

#tbl_filme
#tbl_ator
#tbl_genero
#tbl_diretor

#Criação de tabela

#int - Inteiro
#varchar - Campo de texto (Com cochetes, informa-se o número de caracteres)
#primary key - Chave primária
#auto_increment - Deixa o banco incrementar o valor (Sequencial)
#not null - Não vazio (Obrigatório)

CREATE TABLE tbl_genero(

	id_genero INT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(45) NOT NULL

);

#date - Tipo data

CREATE TABLE tbl_ator(

	id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nome_ator VARCHAR(45) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    dt_nascimento DATE NOT NULL

);

CREATE TABLE tbl_diretor(

	id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome_diretor VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(10) NOT NULL,
    dt_nascimento DATE NOT NULL

);

#CREATE/ALTER/DROP - DDL (Consntrução da estrutura/base - Apagar estruturas/base - Alterar estruturas/base) 
#INSERT/DELETE - DML (Manipulação de dados - Inserção - Remoção)

#Chave Simbolo amarelo -> Chave primaria obrigátoria e não pode repetir
#Chave Simbolo vermelho -> Chave estangeira obrigátoria e não pode repetir
#Quadrado Simbolo azul -> Not Null (Não é vazio - Obrigatório)
#Quadrado Simbolo branco -> Opicional
#Quadrado Simbolo vermelho -> Chave estrangeira e obrigátoria, pode repetir

#DROP - Apaga o elemento
#DROP DATABASE (nome) - Apaga o banco 
#DROP TABLE (nome) - Apaga a tabela


CREATE TABLE tbl_filme(

	id_filme INT PRIMARY KEY AUTO_INCREMENT,
    nome_filme_PT VARCHAR(45) NOT NULL,
    nome_filme_EN VARCHAR(45),
    ano_lancamento INT(4) NOT NULL,
    duracao INT(3) NOT NULL,
    FK_id_genero INT NOT NULL, 
    FK_id_diretor INT NOT NULL,
    CONSTRAINT FK_id_genero FOREIGN KEY(FK_id_genero) REFERENCES tbl_genero(id_genero),
    CONSTRAINT FK_id_diretor FOREIGN KEY(FK_id_diretor) REFERENCES tbl_diretor(id_diretor)
    
);


#------------------------------------------------------------#

#Corrigindo erro (Coloquei as FOREIGN KEY em apenas uma[Deste modo ,teria que apagar a CONSTRAINT e a FOREIGN KEY]) 
#Eu poderia ter apenas alterado, mas não pensei na hora

#Excluindo a FK

ALTER TABLE tbl_filme DROP FK_id_diretor;

#Criando novamente a FK

ALTER TABLE tbl_filme ADD FK_id_diretor INT NOT NULL;

#Criando a CONSTAINT, juntamente com a referência da FK

ALTER TABLE tbl_filme ADD CONSTRAINT FK_id_diretor FOREIGN KEY(FK_id_diretor) REFERENCES tbl_diretor(id_diretor);

#Conclusão, depois de criada, não tem como dar o mesmo nome da chave para um CONSTRAINT (Tive que dropar duas tabelas)

#------------------------------------------------------------#


desc tbl_filme;

#COMO CRIAR A CHAVE ESTRANGEIRA
#FK_id_genero INT NOT NULL (O primeiro passo é criar a culuna, depois ela irá ser transformada em FOREING KEY)
#CONSTRAINT FK_id_genero FOREIGN KEY(FK_id_genero) REFERENCES tbl_genero(id_genero),
#CONSTRAINT - Não é necessário estar no comando, entetanto, ele serve para manutenções futuras
#Os tipos de manutenções são "Remover vinculos entre tabelas, ou seja, se não criar o CONSTRAINT, não é possivel modificar os vinculos de chaves estrangeiras"

#FOREIGN KEY - é uma referência de uma tabela em outra tabela


#Exemplo, autor1 é cadastrado com o filme1.
#Neste caso, se ocorrer o cadastro novamente, o mesmo autor não pode se relacionar com o mesmo filme que foi cadastrado antes.

#Pode cadastrar vários atores para um filme, e vários filmes para um autor (Entretanto, não pode repetir o cadastro feito antes com os mesmos elementos)
#Impede o cadastro do mesmo filme para o mesmo ator novamente
#Além disso, as duas FK's são chaves estangeiras (Composta)

CREATE TABLE tbl_filme_has_tbl_ator(

	FK_id_filme INT NOT NULL,
    FK_id_ator INT NOT NULL,
	CONSTRAINT FK_id_filme FOREIGN KEY (FK_id_filme) REFERENCES tbl_filme(id_filme),
    CONSTRAINT FK_id_ator FOREIGN KEY (FK_id_ator) REFERENCES  tbl_ator(id_ator),
	PRIMARY KEY(FK_id_filme, FK_id_ator)
);


desc tbl_filme;

#Alterações (Atividade - Exercícios de Alteração de Tabela)

#Acrescentar na tabela DIRETOR o campo sexo sendo varchar(1) e não nulo.

ALTER TABLE tbl_diretor ADD sexo VARCHAR(1) NOT NULL;

#Na tabela DIRETOR alterar o tamanho do campo NACIONALIDADE para varchar(45).

ALTER TABLE tbl_diretor MODIFY nacionalidade VARCHAR(45) NOT NULL;

#Na tabela FILME excluir a coluna NOME_FILME_EN e alterar NOME_FILME_PT para apenas NOME_FILME.

ALTER TABLE tbl_filme DROP nome_filme_EN;
ALTER TABLE tbl_filme CHANGE nome_filme_PT nome_filme VARCHAR(45) NOT NULL;

#Renomear a tabela TBL_FILME_HAS_TBL_ATOR para FILME_E_ATOR.

ALTER TABLE tbl_filme_has_tbl_ator RENAME filme_e_ator;




#A inserção pode ser feita com o comando completo
#E também repetindo apenas os VALUES
#VALUES("Animação"),
#      ("Comedia"),
#	   ("Ação");

#Iniciando a INSERÇÃO DE DADOS (Genero) 

INSERT INTO tbl_genero(genero)
			VALUES("Animação");


#Iniciando a INSERÇÃO DE DADOS (Diretor) 
#DATA - 1980/02/10 (ANO/MES/DIA) 

INSERT INTO tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES("Fernando Meirelles","Brasil","1965/11/09","M");

#Realizando Update - Erro cometido

UPDATE tbl_diretor
SET dt_nascimento = "1946/12/18"
WHERE id_diretor = 1;


#Iniciando a INSERÇÃO DE DADOS (Ator)
#DATA - 1980/02/13 (ANO/MES/DIA) 

INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento)
			VALUES("Emma Stone","F","1988/11/06");


#Iniciando a INSERÇÃO DE DADOS (Filmes)

INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES("Ilha do Medo",2010,139,5,1);


select * from tbl_diretor;
select * from tbl_filme;
select * from filme_e_ator;
select * from tbl_ator;
select * from tbl_genero;

desc tbl_filme;

#DADOS

INSERT INTO tbl_diretor VALUES(null, "Steven Spielberg", "Estados Unidos", "1946-12-18", "M");
INSERT INTO tbl_diretor VALUES(null, "James Cameron", "Canada", "1954-08-16", "M");
INSERT INTO tbl_diretor VALUES(null, "José Padilha", "Brasil", "1967-08-01", "M");
INSERT INTO tbl_diretor VALUES(null, "George Lucas", "Estados Unidos", "1944-05-14", "M");
INSERT INTO tbl_diretor VALUES(null, "Alan Rickman", "Inglaterra", "1946-02-21", "M");
INSERT INTO tbl_diretor VALUES(null, "Fernando Meirelles", "Brasil", "1965-11-09", "M");
SELECT * FROM tbl_diretor;

INSERT INTO tbl_genero VALUES(null, "Terror");
INSERT INTO tbl_genero VALUES(null, "Ação");
INSERT INTO tbl_genero VALUES(null, "Comédia");
INSERT INTO tbl_genero VALUES(null, "Drama");
INSERT INTO tbl_genero VALUES(null, "Suspense");
INSERT INTO tbl_genero VALUES(null, "Ficção");
INSERT INTO tbl_genero VALUES(null, "Romance");
INSERT INTO tbl_genero VALUES(null, "Animação");
SELECT * FROM tbl_genero;

INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Viva: A vida é Uma Festa", 2017, 105, 8, 5); #1
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Logan", 2017, 137, 2, 1); #2
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Um Sonho de Liberdade", 1995, 142, 4, 5); #3
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Matrix", 1999, 150, 6, 1); #4
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Jumanji", 1996, 104, 3, 6); #5
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Cidade de Deus", 2002, 135, 2, 3); #6
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Resgate do Soldado Ryan", 1998, 170, 2, 6); #7
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Extraordinário", 2017, 113, 4, 5); #8
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Poderoso Chefão", 1972, 178, 2, 2); #9
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Forrest Gump", 1994, 142, 7, 1); #10
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Truque de Mestre", 2013, 125, 2, 4); #11
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Fragmentado", 2017, 117, 4, 6); #12
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Avatar", 2009, 162, 6, 2); #13
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Preço do Amanhã", 2011, 109, 2, 3); #14
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Senhor dos Anéis: O Retorno do Rei", 2003, 200, 6, 5); #15
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Toy Story", 1995, 141, 8, 2); #16
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Star Wars: Os Últimos Jedi", 2017, 152, 6, 4); #17
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Menino do Pijama Listrado", 2008, 94, 4, 1); #18
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("O Lobo de Wall Street", 2013, 181, 4, 6); #19
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("A Hora do Rush", 1998, 98, 3, 5); #20
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Piratas do Caribe- Maldição do Perola Negra", 2003, 143, 2, 4); #21
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Passageiros", 2016, 116, 2, 1); #22
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Beleza Oculta", 2016, 97, 4, 2); #23
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("It- A Coisa", 2017, 134, 1, 3);  #24
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Rocky V", 1990, 111, 4, 4); #25
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Titanic", 1997, 195, 7, 4); #26
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Vingadores 4", 2019, 150, 2, 2); #27
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Velozes e Furiosos 8", 2017, 136, 2, 6); #28
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Transformers", 2007, 150, 2, 4); #29
INSERT INTO tbl_filme(nome_filme, ano_lancamento, duracao, FK_id_genero,  FK_id_diretor) VALUES("Ilha do Medo", 2010, 139, 5, 1); #30
SELECT * FROM tbl_filme;

INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Andrew Garfield", "M", "1983-08-20"); #1
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sandra Bullock", "F", "1964-06-26"); #2
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Will Smith", "M", "1968-09-25"); #3
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Harrison Ford", "M", "1942-07-13"); #4
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Hugh Jackman", "M", "1968-10-12"); #5
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Angelina Jolie", "F", "1975-06-04"); #6
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Keanu Reeves", "M", "1964-09-02"); #7
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jennifer Lawrence", "F", "1990-08-15"); #8
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sylvester Stallone", "M", "1946-07-06"); #9
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("James Mcavoy", "M", "1979-04-21"); #10
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Brad Pitt", "M", "1963-12-18"); #11
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Leonardo  Dicaprio", "M", "1974-11-11"); #12 
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Vin Diesel", "M", "1967-07-18"); #13
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Johnny Depp", "M", "1963-06-09"); #14
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Robin Williams", "M", "1951-07-21"); #15
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Robert Downey Jr.", "M", "1965-04-04"); #16
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Patricik Stewart", "M", "1940-07-13"); #17
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Sandra Bullock", "F", "1964-07-26"); #18 - 2
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jackie Chan", "M", "1954-04-07"); #19
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jennifer Aniston", "F", "1969-02-11"); #20
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Jim Carrey", "F", "1962-01-17"); #21
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Scarlett Johansson", "F", "1984-11-22"); #22
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Megan Fox", "F", "1986-05-16"); #23
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Ben Stiller", "F", "1965-11-30"); #24
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES("Emma Stone", "F", "1988-11-06"); #25
SELECT * FROM tbl_ator;


#APRENDENDO SOBRE ATUALIZAÇÃO DE DADOS NO BANCO (UPDATE - DML) #---------------------------------------#

#WHERE -> Especifica o Item/Dado a ser modificado

#No UPDATE abaixo, como não há o WHERE, o UPDATE irá mudar todos os nomes para o informado
#UPDATE tbl_ator SET nome_ator = "Will Smith";

#No UPDATE abaixo, como há o WHERE, o UPDATE irá mudar apenas o nome do id informado
#UPDATE tbl_ator SET nome_ator = "Will Smith" WHERE id_ator = 10;

#No UPDATE abaixo, como há o OR, o UPDATE irá mudar apenas os Id's especificados
#UPDATE tbl_filme SET nome_filme = "Jojo" WHERE id_filme = 18 OR id_filme = 21;


#APRENDENDO SOBRE EXCLUSÃO DE DADOS NO BANCO (DELETE - DML) #---------------------------------------#

#FROM - Indica a tabela a sofrer o ato
#WHERE - Indica que será deletado

#No comando abaixo, o comando apaga todos os dados da tabela filme
#Entretanto, ele não reseta os registros.
#DELETE FROM tbl_filme;

#-------------TRUNCATE-------------#

#É importante que não tenha cave estrangeira para funcionar o comando TRUNCATE
#O comando TRUNCATE limpa a tabela e reinicia o auto_increment (Limpa os registros)
#Começando do 1 novamente
#TRUNCATE tbl_genero;

#--------------------//Alterações na Tabela//--------------------#

UPDATE tbl_ator
SET nome_ator = "Elizabeth Olsen",
dt_nascimento = "1989/02/16"
WHERE id_ator = 18;

UPDATE tbl_ator
SET sexo = "M"
WHERE id_ator = 21;

UPDATE tbl_ator
SET sexo = "M"
WHERE id_ator = 24;

#Ou 

UPDATE tbl_ator SET sexo = "M" WHERE id_ator = 21 OR id_ator = 24;

SELECT * FROM tbl_ator;

#--------------------//----//-----//----//--------------------#
#--------------------//-------DTL-------//--------------------#
#--------------------//----//-----//----//--------------------#

#Quando o AUTOCOMMIT está desabilitado, o banco executa a ação, mas não salva, dando possibilidade de utilizar o ROLLBACK

#COMMIT - Habilita o comando
#ROLLBACK - Volta o comando

#Comando (commit;)
#Comando (rollback;)

#Só funciona pra DML - (INSERT, UPDATE, DELETE) 
#NÃO FUNCIONA PARA DDL - (CREATE, ALTER, DROP)

#O ROLLBACK volta extamente no último COMMIT

#--------------------//----//-----//----//--------------------#
#--------------------//-------DQL-------//--------------------#
#--------------------//----//-----//----//--------------------#

#SELECT - SELECT - SELECT - SELECT - SELECT - SELECT - SELECT#

#Variações simples //-------------------------------------------//

#Seleção de tudo
SELECT * FROM tbl_diretor;

#Colunas especificas
SELECT nome_diretor, nacionalidade FROM tbl_diretor;

#Selecionando tudo que tenha a nacionalidade "Brasil"
SELECT * FROM tbl_diretor WHERE nacionalidade="Brasil";

#Concatenação no SELECT (Trás os Brasileiros Ou os Americanos que nasceram em 1944-05-14)
SELECT nome_diretor, nacionalidade, dt_nascimento FROM tbl_diretor 
	   WHERE nacionalidade="Brasil" OR nacionalidade="Estados Unidos" AND dt_nascimento="1944-05-14";
	
#Variações intermédiarias //-------------------------------------------//

#REALIZAR BUSCAR POR "PEDAÇOS" DE PALAVRAS - O COMANDO LIKE - (% - CORINGA)

#Quando se coloca o %, depdendo da posição do %, qualquer coisa da frente ou para trás e aceito
# A% (Qualquer coisa que vir na frente do A)
# %E (Qualquer coisa que termine com E)

#A letra pode ser Maiuscula
SELECT * FROM tbl_ator WHERE nome_ator LIKE "A%";
SELECT * FROM tbl_ator WHERE nome_ator LIKE "%E";

# %GA% (Qualquer coisa que tenha um GA entre seus caracteres)
SELECT * FROM tbl_ator WHERE nome_ator LIKE "%GA%";

#Exemplo (Trás os dados[nome] que tenham LEONARDO em seu meio)

SELECT * FROM tbl_ator WHERE nome_ator LIKE "%LEONARDO%";

#Variações intermédiarias //-------------------------------------------//

#REALIZANDO BUSCAS COM INTERVALO DE DATAS
#Igual programação (Operadores Lógicos [<> = < / > = <>])
#Diferente <> ou !=
#BETWEEN - "Entre"

SELECT * FROM tbl_ator WHERE dt_nascimento > "1980/01/01" AND dt_nascimento < "1990/01/01";
SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN "1980/01/01" AND "1990-01-01";

#Adicionando mais parâmteros
SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN "1980/01/01" AND "1990-01-01" AND nome_ator LIKE "%S%";

#Diferente (<> ou !=)
SELECT * FROM tbl_ator WHERE dt_nascimento != "1986/05/16"; 

#Utilizando o parâmetro lógico em outra coluna
SELECT * FROM tbl_filme WHERE duracao > 150;

#//-----------------------------------------------------------------------------//#
#//-----------------------------------------------------------------------------//#
#//-----------------------------------------------------------------------------//#

#FUNÇÕES DE AGREGAÇÃO  - (MIN, MAX, COUNT, SUM, AVG)
#Importante = As funções não vinculam uma informação adicional que for dada (SELECT min(duracao), nome_filme FROM tbl_filme;)
#Sendo assim, no caso acima os dois não estão entrelaçados, trazendo o primeiro filme(dado) em nome_filme. (A prioridade é para o min(duracao))

#//-----------------------------------------------------------------------------//#

#MIN - MOSTRAR A MENOR DURAÇÃO CADASTRADA NA TABELA FILME (Pode ser qualquer coluna no lugar de duração)

SELECT min(duracao) FROM tbl_filme;

#Não precisa ser apenas Numeros
#Numerico - Irá buscar o menor numero
#Varchar - Irá buscar o menor pela ordem alfabética (A,B,C,D,E...)

SELECT min(nome_filme) FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#MAX - MOSTRAR A MAIOR DURAÇÃO CADASTRADA NA TABELA FILME (Pode ser qualquer coluna no lugar de duração)

SELECT max(duracao) FROM tbl_filme;
SELECT max(nome_filme) FROM tbl_filme; #Coleta em ordem alfabética o nome com mais peso

#Trocando nome da coluna (Se não trocar, o nome será max(duracao))

SELECT max(duracao) maior_duracao FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#AVG - MOSTRAR A MÉDIA DOS DADOS ENCONTRADOS EM UMA COLUNA (Não pode ser usado em caracteres)

SELECT avg(duracao) mediaDuração FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#SUM - MOSTRAR A SOMA DOS DADOS ENCONTRADOS EM UMA COLUNA (Não pode ser usado em caracteres)

SELECT sum(duracao) totalDuração FROM tbl_filme;

#Diversas funções em um SELECT

SELECT sum(duracao) totalMédia, max(duracao) maxDuração, min(duracao) minDuração, avg(duracao) mediaDuração FROM tbl_filme;

#Pegando colunas diferentes

SELECT sum(duracao), sum(ano_lancamento) FROM tbl_filme;

#Soma de sum's 

SELECT sum(duracao) + sum(ano_lancamento) somaAnoEduracao FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#O dado de DECIMAL recebe dois valores (1° é a quantidade de caracteres possíveis (Ou seja, todos os caracteres antes e após vírgula), 2° é a quantidade de números após a vírgula)
#DECIMAL(4,2)
#13.00             [Total de 4 números e 2 após a vírgula]
#DECIMAL(5,2)
#999.99            [Total de 5 números e 2 após a vírgula]

#CAST - Corrigindo as casas decimais (Limite de 10 números e 2 após a vírgula)

SELECT CAST(AVG(duracao) AS DECIMAL(10,2)) FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#COUNT - MOSTRAR A CONTAGEM DE UM DETERMINADO DADO NA TABELA
#SABER QUANTOS FILMES ESTÃO CADASTRADOS

#Qualquer coluna de determinada

SELECT count(nome_filme) FROM tbl_filme;

#Caso for nula, há uma maneira de evitar a contaminação
#Com o asteristico, todas as linhas estão sendo contadas (Não evitando campos nulos)
SELECT count(*) FROM tbl_filme;

#//-----------------------------------------------------------------------------//#

#Selecionando todo o elenco feminino (tbl_ator) 
SELECT count(*) FROM tbl_ator WHERE sexo = "F";

#Somando a duração de todos os filmes de Terror
SELECT sum(duracao) FROM tbl_filme WHERE FK_id_genero='1';

#Informar o número de ID(Gênero) e apresentar qual o gênero correspondente deste ID
SELECT genero from tbl_genero WHERE id_genero='6';

#Selecionar o nome do filme de maior duração (SUBQUERY)
SELECT nome_filme nomeFilmeMaiorDuração from tbl_filme where duracao = (SELECT max(duracao) FROM tbl_filme);
#Selecionar o nome do filme de menor duração (SUBQUERY)
SELECT nome_filme nomeFilmeMenorDuração from tbl_filme where duracao = (SELECT min(duracao) FROM tbl_filme);

#//-----------------------------------------------------------------------------//#

#ORDER BY

#Deixa em ordem alfábetica (Caracteres)
SELECT * FROM tbl_filme ORDER BY nome_filme;
SELECT min(nome_filme) FROM tbl_filme;

#Diferença com o MIM() --> Esta função só da um SELECT no primeiro elemento
#				 ORDER BY --> Dá um SELECT geral mostrando os todos os dados em ordem alfabetica

#//------------------------------//#

#CARACTERE - ASC/DESC#

#ASC - Order afabetica - A,B,C,D,E (Já vem por padrão, entã onã oe necessário colocar)
#DESC - Ordem afabetica - Z,Y... (Não vem por padrão)

SELECT * FROM tbl_filme ORDER BY nome_filme ASC;
SELECT * FROM tbl_filme ORDER BY nome_filme DESC;

#//------------------------------//#

SELECT * FROM tbl_filme ORDER BY ano_lancamento;

#Utilizando um campo númerico (Vem por ASC por padrão)

#//------------------------------//#

#NUMERICO - ASC/DESC#

#ASC - Order = numerica - 1,2,3,4,5 (Já vem por padrão, entã onã oe necessário colocar)
#DESC - Ordem afabetica - 5,4,3,2,1 (Não vem por padrão)

SELECT * FROM tbl_filme ORDER BY ano_lancamento ASC;
SELECT * FROM tbl_filme ORDER BY ano_lancamento DESC;

#//------------------------------//#

#Ordenando duas tabelas

SELECT * FROM tbl_filme ORDER BY ano_lancamento DESC, nome_filme DESC;

#//-----------------------------------------------------------------------------//#

#GROUP BY

#Este elemento agrupa os elementos, ou seja, ele agrupa todos os itens e exibe o primeiro item correspondente a este

#Por exemplo - Há dois itens com 2017 / Três itens com 2020 / Um item com 2000
#O que será exibido é (O primeiro item com 2017[Agrupou]) / (O primeiro item com 2020[Agrupou]) / (O primeiro item com 2000[único])

SELECT ano_lancamento FROM tbl_filme GROUP BY ano_lancamento;

#//------------------------------//#

#GRUPO BY + COUNT
#Quantos filmes existem para cada ano?

SELECT count(*) totalFilmes, ano_lancamento FROM tbl_filme GROUP BY ano_lancamento; 

#Explicação

#GROUP BY - Coluna ano_lancamento
#Variável interna com o nome do ano (Caso houver mais, vai somando nesta variável)
#Por final, exibe os valores na coluna totalFilme neste caso

#SELECIONE QUANTOS ATORES E QUANTAS ATRIZES ESTÃO CADASTRADAS
#totalSexo é o nome da coluna que irá armazenas os valores somados pelo count(*)
#A tabela sexo mostrará os sexos agrupados (F e M)
#GROUP BY (Agrupa os itens [F e M])
#ORDER BY (Agrupa em ordem (Desc) - Decrscente - Numerais)

SELECT count(*) totalSexo, sexo FROM tbl_ator GROUP BY sexo ORDER BY totalSexo DESC; 


#Colocando mais filtros e Ordenando em ordem alfabetica após (Utilizando o OR para adicionar mais parâmetros)

SELECT * FROM tbl_filme WHERE nome_filme LIKE "a%" OR nome_filme LIKE "h%" OR nome_filme LIKE "e%" OR nome_filme LIKE "f%" ORDER BY nome_filme;

#//-----------------------------------------------------------------------------//#

#EXERCÍCIOS#

# 1- Selecionar todos os atores que comecem com a letra "A".
SELECT * FROM tbl_ator WHERE nome_ator LIKE "A%";

# 2- Selecionar a maior duracao dos filmes cadastrados. 
SELECT duracao, nome_filme FROM tbl_filme WHERE duracao = (SELECT max(duracao) FROM tbl_filme);

# 3- Selecionar a menor duracao dos filmes lancado entre os anos 2000 e 2010.
SELECT duracao, nome_filme, ano_lancamento FROM tbl_filme WHERE ano_lancamento > 1980 AND ano_lancamento < 2010 AND duracao = (SELECT min(duracao) FROM tbl_filme);

# 4- Selecionar os filmes exibibindo apenas aqueles que pertencerem ao genero "Ação".
SELECT nome_filme FROM tbl_filme WHERE FK_id_genero = 2 ORDER BY nome_filme;

# 5- Selecionar os filmes exibindo aqueles que pertecerem ao genero "Drama" e que tenham sido lançados apos o ano 2010.
SELECT nome_filme, ano_lancamento FROM tbl_filme WHERE FK_id_genero = 4 AND ano_lancamento > 2010;

# 6- Exibir todos os filmes e seus anos de lancamentos organizando da seguinte maneira (ordem de ano do mais novo para o mais velho e nome do filme em ordem alfabetica).
SELECT nome_filme, ano_lancamento FROM tbl_filme ORDER BY nome_filme, ano_lancamento; #-----#

# 7- Exibir a soma da duracao de todos os filmes que foram lançados entre 2010 e 2018 e pertecerem ao genero "ficçao"
SELECT sum(duracao) SomaDuracao FROM tbl_filme WHERE ano_lancamento BETWEEN 2010 AND 2018 AND FK_id_genero = 6;

# 8- Exibir quantos filmes foram lancados antes do ano 2000.
SELECT nome_filme, ano_lancamento FROM tbl_filme WHERE ano_lancamento < 2000 ORDER BY ano_lancamento DESC;

# 9- Exibir qual a media de duracao dos filmes lancados apos o ano 2000.
SELECT CAST(AVG(duracao)AS DECIMAL(10,0)) MediaDuracao FROM tbl_filme WHERE ano_lancamento > 2000;

# 10- Quantos filmes pertecem a cada um dos generos.
SELECT count(*) totalFilme, FK_id_genero FROM tbl_filme GROUP BY FK_id_genero ORDER BY totalFilme DESC; 

# 11- Exibir em ordem alfabetica quais atores e em quais anos nasceram entre 1960 e 1980.
SELECT nome_ator, dt_nascimento FROM tbl_ator WHERE dt_nascimento BETWEEN "1960/01/01" AND "1980/01/01" ORDER BY nome_ator;  #-----#

# 12- Exibir todas informações sobre os atores do mais jovem para o mais velho
SELECT * FROM tbl_ator ORDER BY dt_nascimento DESC;

# 13- Selecionar quantos filmes foram lancados em cada um dos anos.
SELECT count(*) totalFilme, ano_lancamento FROM tbl_filme GROUP BY ano_lancamento ORDER BY totalFilme DESC;

# 14- Exibir quantos diretores pertencem a cada pais.
SELECT count(*) diretoresTotal, nacionalidade FROM tbl_diretor GROUP BY nacionalidade;

# 15- exibir o total de filmes, a soma das durações e a media das duracoes para cada um dos generos de filmes organizando da menor media para a maior.
SELECT count(*) totalGenero, sum(duracao), cast(avg(duracao)AS DECIMAL(10,0)) duracaoMedia, FK_id_genero FROM tbl_filme GROUP BY FK_id_genero ORDER BY duracaoMedia;

# 16- Selecionar todos os filmes que contenham a silaba "DE" no nome e em ordem alfabetica de Z-A.
SELECT * FROM tbl_filme WHERE nome_filme LIKE "%de%" ORDER BY nome_filme DESC;

#//-----------------------------------------------------------------------------//#

#Filtros - LIMIT
#Em resumo, o LIMIT mostra os resultados de pouco em pouco (Instalando um limite de exibição númerico)
#Primeiro parâmetro (0) - A partir de qual item (No caso, ele começa no 1)
#Segfunda parâmetro (10) - Quantidade de itens a ser exibido 

SELECT * FROM tbl_ator LIMIT 0,10;

SELECT * FROM tbl_filme LIMIT 10; #Pode ser informado apenas a quantidade do Itens

#//-----------------------------------------------------------------------------//#

#Filtros IN
#Consultas com OR -> Pode ser substituida por IN
#Este operador tem a funcionalidade de achar as informações especificadas dentro do IN()

#Selecione todos os filmes do genêro Terror, Ação, Comédia e Drama
SELECT * FROM tbl_filme WHERE FK_id_genero = 1 OR FK_id_genero = 2 
						   OR FK_id_genero = 3 OR FK_id_genero = 4;
                           
#Modo simplificado com IN() - Removendo os OR's
SELECT * FROM tbl_filme WHERE FK_id_genero IN(1,2,3,4);


#Query mais complexa (Coleta a quantidade de filmes do genêro Terror, Ação, Comédia e Drama, após os anos 2000, 
#    				  agrupando elementos pelo genêro e colocando em ordem decrescente no campo totalFilme)

SELECT count(*) totalFilme, ano_lancamento, nome_filme FROM tbl_filme WHERE FK_id_genero IN(1,2,3,4)
													   AND ano_lancamento > 2000
													   GROUP BY ano_lancamento ORDER BY totalFilme DESC;

#Query mais complexa (Coleta a quantidade de filmes do genêro Terror, Ação, Comédia e Drama, após os anos 2000, 
#    				  agrupando elementos pelo genero e colocando em ordem decresente no campo FK_id_genero)

SELECT count(*) totalFilme, FK_id_genero FROM tbl_filme WHERE FK_id_genero IN(1,2,3,4)
							AND ano_lancamento > 2000
							GROUP BY FK_id_genero
                            ORDER BY FK_id_genero DESC;

#//-----------------------------------------------------------------------------//#

#Filtros DISTINCT
#Parecido com o GROUP BY, entretanto, mostra apenas as colunas
#Em resumo, ele mostra os itens sem repetição, entretanto, não pode ser usado em funções de agregação, ou seja, [count() / max() / min() / etc]

SELECT nacionalidade FROM tbl_diretor GROUP BY nacionalidade;
SELECT DISTINCT(nacionalidade) FROM tbl_diretor;

#GROUP BY com Função de agregação (DISTINCT não funciona nesse caso) 
SELECT count(*), nacionalidade FROM tbl_diretor GROUP BY nacionalidade;

#//-----------------------------------------------------------------------------//#

#Filtros - HAVING
#O comando HAVING é semelhante ao WHERE
#Entretanto, a sua difrença está em identificar a quantidade de resultados.
#É utilizado com GROUP BY, isso porque o GROUP BY agrupa os itens iguais e o HAVING é aplicado como filtro,
#podendo mostrar quem tem mais de 1 resultado/2 resultados/3 resultados e etc. 

SELECT * FROM tbl_diretor WHERE nacionalidade = "Brasil";
SELECT * FROM tbl_diretor HAVING nacionalidade = "Brasil";

#Cenário único do Having (Cláusula WHERE do grupo BY)
#Selecionar quantos diretores existem em cada país e exibir apenas os resultado com mais de dois diretores.

SELECT count(*) totalDiretores, nacionalidade FROM tbl_diretor 
											  GROUP BY nacionalidade
											  HAVING totalDiretores > 1
                                              ORDER BY nacionalidade;

#SELECIONAR QUANTOS FILMES FORMA LANÇADOS EM CADA UM DOS ANOS ENTRE
#OS ANOS 1980 A 2000 E EXIBIR APENAS OS RESULTADOS ONDE HAVER
#MAIS DE 4 FILMES

SELECT count(*) totalFilme, ano_lancamento FROM tbl_filme WHERE ano_lancamento 
										   BETWEEN 1980 AND 2000
                                           GROUP BY ano_lancamento
                                           HAVING totalFilme > 4
                                           ORDER BY totalFilme DESC;

#//-----------------------------------------------------------------------------//#

#Filtros/Funções - CURDATE() / NOW()
#Funções que trazem o valor da data/hora atual (Pode ser usado como valor de UPDATE e INSERT)

SELECT curdate(); #Data (Ano/Mês/Dia) - campo DATA
SELECT now();     #Data e hora (Ano/Mês/Dia) - (Horas/Minuto/Segundo) - Campo DATATIME

#//-----------------------------------------------------------------------------//#

#Filtros/Funções - DAY() MONTH() YEAR() HOUR() MINTE() SECOND() DAYOFWEEK() DAYOFMONTH() DAYOFYEAR()

#SELECIONE TODOS OS ATORES/ATRIZES QUE NASCERAM ENTRE 1980 E 1990
SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN '1980-01-01' AND '1990-12-31';

#SELECIONAR TODOS OS ATORES/ATRIZES QUE NASCERAM EM 1980.
SELECT * FROM tbl_ator HAVING year(dt_nascimento) = 1980;

#SELECIONAR TODOS OS ATORES/ATRIZES QUE NASCERAM NO DIA 15.
SELECT * FROM tbl_ator WHERE day(dt_nascimento) = 15;

#Horário Atual
SELECT hour(now());
#Minutos Atuais
SELECT minute(now());
#Segunda Atuais
SELECT second(now());

#Dia da Semana atual
SELECT dayofweek(now());
#Dia do Mês atual
SELECT dayofmonth(now());
#Dia do ano atual
SELECT dayofyear(now());

SELECT * FROM tbl_ator;

#//-----------------------------------------------------------------------------//#

#Filtros/Funções - INTERVAL

#No que tange este comando, oferece a possibilidade de criar um intervalo em datas, o que pode ser negativo ou positivo.

SELECT now() - INTERVAL 10 second;

SELECT now() - INTERVAL 5 minute;

SELECT now() - INTERVAL 1 hour;

SELECT now() + INTERVAL 3 day;

SELECT now() + INTERVAL 3 month;

SELECT now() - INTERVAL 1 year;

#VALOR ESTATICO (TRÊS INTERVAL)

SELECT "2010-10-10" + INTERVAL 2 HOUR - INTERVAL 3 DAY - INTERVAL 10 SECOND;

SELECT "2010-10-10" - INTERVAL 1 YEAR - INTERVAL 6 MONTH - INTERVAL 80 WEEK;

#EXEMPLO COM DATAS EM UMA COLUNA REAL

SELECT * FROM tbl_ator WHERE dt_nascimento = "1974-06-04" + INTERVAL 1 YEAR;

#UTILIZANDO O BETWEEN

SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN "1974-06-04" AND "1980-06-04" + INTERVAL 1 YEAR;

SELECT * FROM tbl_ator;

#//-----------------------------------------------------------------------------//#

#Filtros/Funções - SUBQUERY

SELECT (SELECT now() + INTERVAL 2 DAY) + INTERVAL 1 MONTH;

#APRESENTAR O NOME E DURAÇÃO DO FILME MAIS LONGO


#ERRADO - O NOME SUBMETIDO PELO BANCO NÃO É A NOMENCLATURA DO MAIS LONGIVO FILME
SELECT nome_filme, max(duracao) FROM tbl_filme; 


#CORRETO - ENTRETANTO, A DURAÇÃO RESULTANTE É NECESSÁRIA PARA A CONSULTA
SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = 200; 

#CÓDIGO FINAL (MAIOR DURAÇÃO) /----------------------------/

SELECT max(duracao) FROM tbl_filme; #SELECIONANDO A MAIOR DURAÇÃO DO FILME

#CORRETO - O NOME SUBMETIDO PELO BANCO É A NOMENCLATURA DO MAIS LONGIVO FILME
SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (SELECT max(duracao) FROM tbl_filme); 

#/----------------/DUAS SUBQUERYS/----------------/#

#SELECIONANDO DUAS SUBQUERYS QUE RETORNAM DOIS VALORES (MAIOR DURAÇÃO E MENOR DURAÇÃO) [OR]
#Com o OR, os resultados devem ser obrigatoriamente de uma tabela específica

SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (SELECT max(duracao) FROM tbl_filme) OR duracao = (SELECT min(duracao) FROM tbl_filme); #CORRETO - O NOME SUBMETIDO PELO BANCO É A NOMENCLATURA DO MAIS LONGIVO FILME

#SELECIONANDO DUAS SUBQUERYS QUE RETORNAM DOIS VALORES (MAIOR DURAÇÃO E MENOR DURAÇÃO) [UNION]
#Com o UNION, é possível juntar dados de tabelas diferentes em um SELECT 

SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (SELECT max(duracao) FROM tbl_filme) UNION  
SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (SELECT min(duracao) FROM tbl_filme);


#Utilizando Váias tabelas com o UNION

SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (SELECT max(duracao) FROM tbl_filme) UNION  
SELECT nome_ator, dt_nascimento FROM tbl_ator WHERE dt_nascimento = (SELECT max(dt_nascimento) FROM tbl_ator) UNION
SELECT nome_ator, dt_nascimento FROM tbl_ator WHERE dt_nascimento = (SELECT min(dt_nascimento) FROM tbl_ator);


#//-----------------------------------------------------------------------------//#

SELECT nome_diretor FROM tbl_diretor;
SELECT count(*) quantidade, FK_id_diretor FROM tbl_filme GROUP BY FK_id_diretor;



SELECT nome_diretor, nome_filme FROM tbl_filme 
			JOIN tbl_diretor ON FK_id_diretor = id_diretor
			GROUP BY nome_filme;

#//-----------------------------------------------------------------------------//#

#JOIN

#Exemplo inicial

SELECT a.nome_livro, b.nome_categoria, c.nome_editora FROM tbl_livros a
	   JOIN tbl_Categoria b ON a.FK_Categoria = b.codigo_categoria
       JOIN tbl_Editora c ON a.FK_Editora = c.codigo_editora;
       
       
#Nomenclaturas a / b / c 
#As tabelas recebem as nomenclaturas também para indicar aonde o dado é alocado 
#Comparação entre a chave estrangeira e primária - Libera o uso de todos os dados da tabela que recebe o JOIN

#EXEMPLOS

#EXIBIR A QUANTIDADE DE FILMES QUE CADA DIRETOR TRABALHOU

SELECT nome_diretor, count(*) quantidadeFilmes FROM tbl_filme
	   JOIN tbl_diretor ON FK_id_diretor = id_diretor
       GROUP BY nome_diretor;
	
#Em resumo, quando ocorre a comparação de FK e Primary Key, a linha representada pela coluna é recebida pelo join

# Eduardo  1 (FK_genero)
# 1 (Primary Key) - Masculino

# Eduardo - Masculino

#No caso abaixo, o count é reponsável por contar todos os campos, e após isso, o GROUP BY junta o nome_diretor atribuindo a cada FK nas linhas
       
SELECT a.nome_diretor, count(*) quantidadeFilmes FROM tbl_diretor a
	   JOIN tbl_filme ON FK_id_diretor = id_diretor
       GROUP BY nome_diretor;       
       

#EXERCÍCIOS PARA PRÁTICA

#SELECIONAR TODOS OS FILMES QUE FOREM DO GENÊRO "TERROR" E FORAM LANÇADOS POR DIRETORES BRASILEIROS

SELECT a.nome_filme, b.nome_diretor, c.genero FROM tbl_filme a
	   JOIN tbl_diretor b ON FK_id_diretor = id_diretor
       JOIN tbl_genero c ON FK_id_genero = id_genero
       WHERE nacionalidade = "Brasil" AND genero = "Terror";
  
 #Não exibindo (c.genero)
 
SELECT a.nome_filme, b.nome_diretor FROM tbl_filme a
	   JOIN tbl_diretor b ON FK_id_diretor = id_diretor
       JOIN tbl_genero c ON FK_id_genero = id_genero
       WHERE b.nacionalidade = "Brasil" AND c.genero = "Terror";
       

#SELECIONAR O NOME  E DATA DE NASCIMENTO DOS DIRETORES QUE LANÇARAM FILMES DE COMÉDIA COM DURAÇÃO MAIOR QUE 130MN

# (b.genero) e (a.duracao) não precisa aparecer (Pode ser usada internamente)

SELECT c.nome_diretor, c.dt_nascimento, b.genero, a.duracao FROM tbl_filme a
	   JOIN tbl_diretor c ON FK_id_diretor = id_diretor
       JOIN tbl_genero b ON FK_id_genero = id_genero
       WHERE a.duracao > 100 AND b.genero = "Comedia";
       
# Sem exibir (b.genero) e (a.duracao)
       
SELECT c.nome_diretor, c.dt_nascimento FROM tbl_filme a 
	   JOIN tbl_diretor c ON FK_id_diretor = id_diretor
       JOIN tbl_genero b ON FK_id_genero = id_genero
       WHERE a.duracao > 100 AND b.genero = "Comedia";
       
       

#Exercícios - CORREÇÃO

#---------------# Metodologia - JOIN #---------------#
       
# 1° -> Saber quais dados você querem exibir
# 2° -> Aonde estes dados estão salvos
# 3° -> Fazer o relacionamento entre as tabelas
# 4° -> Aplicar os filtros (Caso necessário)

# 1 #

# 1° -> GENERO / NOME_DIRETOR / NACIONALIDADE / NOME_FILME
# 2° -> TBL_GENERO / TBL_DIRETOR / TBL_DIRETOR / TBL_FILME
# 3°  
#	3.1 -> Colocar todos os campos que queremos exibir
#   3.2 -> Escolher uma tabela de origem para o percurso
#   3.3 -> Fazer o relacionamento entre as tabelas necessárias
#   3.4 -> Aplicar os filtros (Se necessário)

SELECT nome_filme, genero, nome_diretor, nacionalidade FROM tbl_diretor
	   JOIN tbl_filme ON id_diretor = FK_id_diretor
       JOIN tbl_genero ON id_genero = FK_id_genero
	   WHERE genero = "Terror" AND nacionalidade = "Brasil";

#//-----------------------------------------------------------------------------------//#

# LEFT JOIN
# Neste caso, ele pega os itens do Lado Direito

# Diferente do JOIN Convencional, o LEFT JOIN coleta os atributos que possuem itens que possuem relacionamentos e os que também não tem 

SELECT a.genero FROM tbl_filme b LEFT JOIN tbl_genero a ON a.id_genero = FK_id_genero;

# Filtrando apenas generos que não possuem relacionamento

SELECT a.genero FROM tbl_filme b LEFT JOIN tbl_genero a ON a.id_genero = FK_id_genero WHERE FK_id_genero IS NULL;


# RIGHT JOIN (Inverso do LEFT)
# Neste caso, ele pega os itens do Lado Direito

SELECT a.genero FROM tbl_genero a  LEFT JOIN tbl_filme b ON a.id_genero = b.FK_id_genero;

SELECT a.genero FROM tbl_genero a LEFT JOIN tbl_filme b ON a.id_genero = b.FK_id_genero  WHERE b.FK_id_genero IS NULL;

# FULL ALTER JOIN (Não funciona no SQL, entretanto, ele serve para Coletar tudo [Direita e Esquerda])






       
       