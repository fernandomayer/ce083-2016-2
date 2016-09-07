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

##======================================================================
## Classes

##----------------------------------------------------------------------
## Vetores
num <- c(10, 5, 2, 4, 8, 9)
num
typeof(num)
class(num)

## Para criar inteiros
x <- c(10L, 5L, 2L, 4L, 8L, 9L)
## ou use as.character
x
class(x)

## Compare os tamanhos de armazenamento
object.size(num)
object.size(x)

## Representacao numerica
set.seed(123)
x <- runif(10)
x
## numero de digitos significativos
getOption("digits")

## Para alterar em tela
print(x, digits = 1)
print(x, digits = 7) # padrão
print(x, digits = 22)
## Alterando para o formato cientifico
format(x, scientific = TRUE)

##----------------------------------------------------------------------
## Sequencias de numeros

## seq
1:10
seq(1, 10)
seq(from = 1, to = 10, by = 2)
seq(from = 1, to = 10, length.out = 15)

## rep
rep(1, 10)
rep(c(1, 2, 3), 5)
rep(c(1, 2, 3), times = 5)
rep(c(1, 2, 3), times = c(5, 2, 2))
rep(c(1, 2, 3), each = 5)
rep(c(1, 2, 3), times = c(5, 5, 5))

##----------------------------------------------------------------------
## Regra da reciclagem
num
num * 2
num * num
num + c(2, 4, 1)
num + c(2, 4, 1, 3)

##----------------------------------------------------------------------
## Atributos de vetores
names(num)
length(num)
class(num)
names(num) <- LETTERS[1:6]
num
names(num)
