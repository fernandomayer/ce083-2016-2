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

##----------------------------------------------------------------------
## Outras classes de vetores

## caracter
caracter <- c("brava", "joaquina", "armação")
caracter
typeof(caracter)
class(caracter)

## logical
logico <- caracter == "armação"
logico
logico <- num > 4
logico
typeof(logico)
class(logico)

## Expressoes condicionais e operadores logicos (ver pagina)

## Operadores & (~interseção) e | (união)
num > 4 & num < 8
num > 4 | num < 8
num > 10 | num < 8

##----------------------------------------------------------------------
## Fator
fator <- factor(c("alta","baixa","baixa","media",
                  "alta","media","baixa","media","media"))
fator
class(fator)
levels(fator)
typeof(fator) ## PORQUE?
as.numeric(fator)

## Fatores ordenados
fator <- factor(c("alta","baixa","baixa","media",
                  "alta","media","baixa","media","media"),
                levels = c("alta","media","baixa"))
fator
levels(fator)

## Exercicios (ver página)
ex <- rep(c("A", "B", "C"), times = c(15, 12, 8))
ex
ex == "B"
sum(ex == "B")
ex2 <- runif(100)
ex2
sum(ex >= 0.5)

##----------------------------------------------------------------------
## Misturando classes de objetos

## Coerção implícita
w <- c(5L, "a")
x <- c(1.7, "a")
y <- c(TRUE, 2)
z <- c("a", T)

## > Um vetor só pode conter elementos de uma mesma classe

## Coerção explícita
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.factor(x)

## Lógicos são mapeados como 0 e 1
x <- c(FALSE, TRUE)
x
class(x)
as.numeric(x)

## Quando não é possível fazer a coerção
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
