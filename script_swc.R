##======================================================================
## Estrutura de dados
##======================================================================

##----------------------------------------------------------------------
## Criar um arquivo CSV
## nome,idade,usa_linux
## Fernando,34,TRUE
## Steve,40,FALSE
## Zissou,38,TRUE

##----------------------------------------------------------------------
## Le arquivo e confere estruturas
dados <- read.csv("meus_dados.csv")
str(dados)
summary(dados)
dados$nome
dados$idade

##----------------------------------------------------------------------
## Vetorização
dados$idade + 10
dados$idade + dados$nome

##----------------------------------------------------------------------
## Tipos de dados
typeof(dados$idade)
## double
## integer
## complex
## logical
## character

typeof(3.14)
typeof(1)
typeof(1L)
typeof(1+1i)
typeof(TRUE)
typeof("texto")

## Outro CSV com alteração
## nome,idade,usa_linux
## Fernando,34,TRUE
## Steve,40,FALSE
## Zissou,38 ou 39,TRUE
dados2 <- read.csv("meus_dados2.csv")
str(dados2)
dados2$idade + 10
class(dados)
class(dados2)

##----------------------------------------------------------------------
## Adicionando colunas
dim(dados)
dados$cor <- c("azul", "branco", "vermelho")
str(dados)
## OU
dados <- cbind(dados, time = c("A", "B", "C"))

##----------------------------------------------------------------------
## Adicionando linhas
str(dados)
dados$nome <- as.character(dados$nome)
dados$time <- as.character(dados$time)
dados <- rbind(dados, list("Ze", 30, FALSE, "rosa", "D"))
str(dados)
dados
