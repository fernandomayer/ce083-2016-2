##======================================================================
## Indexação e seleção condicional
##======================================================================

##----------------------------------------------------------------------
## Indexação de vetores

## Vetor de contagens
cont <- c(8, 4, NA, 9, 6, 1, 7, 9)
cont

## Para acessar o valor que está na quarta posição
cont[4]
## Nas posições 1, 4, e 8
cont[c(1, 4, 8)]
ind <- c(1, 4, 8)
cont[ind]

## Todos menos os que estão nas posições 1, 4, e 8
cont[-c(1, 4, 8)]

## Seleciona os elementos de 1 a 5
cont[1:5]
## Seleciona os elementos nas posições ímpar
cont[seq(1, 8, by = 2)]

## Exercícios (ver material)
x <- c(88, 5, 12, 13)
x
x[3]
x[1]
x[c(2,4)]
x[c(4,2)]
x[-c(1, 4)]
y <- c(x[1:3], 168, x[4])
y

## Para selecionar os NAs
cont[is.na(cont)]
## Para selecionar todos menos os NAs
cont[!is.na(cont)]

## Para substituir os NAs por algum valor (ex.: 0)
cont[is.na(cont)] <- 0
cont

## Para especificar NA para algum valor
is.na(cont) <- 3 # é a posição
cont
## Mais seguro do que
# cont[3] <- NA

##----------------------------------------------------------------------
## Vetores nomeados

## Atribui as letras "a", "b", ..., "h" para os componentes de cont
names(cont)
names(cont) <- letters[1:length(cont)]
names(cont)
cont
?letters

## Acessando o quarto elemento
cont["d"]
## Acessando o sexto e o primeiro elemento
cont[c("f", "a")]

##----------------------------------------------------------------------
## Indexação de matrizes
mat <- matrix(1:9, nrow = 3)
mat

## Acessando o elemento da linha 2 e coluna 3
mat[2, 3]

## Acessando todas as linhas da coluna 1
mat[, 1]
## Note que o resultado é um vetor
class(mat[, 1])

## Acessando todas as colunas da linha 1
mat[1, ]

## Note que o resultado traz sempre um vetor (dimensão reduzida). Se a
## intenção for manter a estrutura bidimensional de matriz, então é
## preciso especificar o argumento drop
mat[3, 2]
mat[3, 2, drop = FALSE]
mat[1, ]
mat[1, , drop = FALSE]
mat[, 2]
mat[, 2, drop = FALSE]
## Veja
?"["

## Para acessar mais de uma linha e/ou coluna
mat[c(1, 3), c(2, 3)]

##----------------------------------------------------------------------
## Matrizes nomeadas

## Nomes das colunas
colnames(mat) <- LETTERS[1:3]
mat
## Todas as linhas da coluna B
mat[, "B"]
## Elemento da linha 1 e coluna C
mat[1, "C"]

## Nomes das linhas
rownames(mat) <- LETTERS[24:26]
mat
## Todas as colunas da linha X
mat["X", ]
## Elemento da linha Y e coluna A
mat["Y", "A"]

##----------------------------------------------------------------------
## Indexação de listas

lis <- list(c(3, 8, 7, 4), mat, 5:0)
lis

## Para acessar o segundo componente
lis[[2]]

## Para acessar o terceiro valor do primeiro componente
lis[[1]]
lis[[1]][3]

## Como o segundo componente é uma matriz, a indexação segue a mesma
## lógica
lis[[2]][2, 3]
lis[[2]]["Z", "C"]

## Lista com componentes nomeados
lis <- list(vetor1 = c(3, 8, 7, 4), mat = mat, vetor2 = 5:0)
## Ou
## names(lis) <- c("vetor1", "mat", "vetor2")
lis

## Acesando o segundo componente
lis$mat
## Linha 2 e coluna 3
lis$mat[2, 3]
## Terceiro elemento do primeiro componente
lis$vetor1[3]

## Ou usando colchetes
lis[["mat"]]
lis[["vetor1"]][3]

##----------------------------------------------------------------------
## Indexação de data frames
da <- data.frame(A = 4:1, B = c(2, NA, 5, 8))
da

## Como possui duas dimensões, segue a mesma lógica de matrizes
da[2, 1]
da[, 2]
da[, "B"]
da[1, ]

## O drop também funciona
da[2, 1, drop = FALSE]
da[, 2, drop = FALSE]
da[, "B", drop = FALSE]
da[1, , drop = FALSE]

## Usando o "nome" da linha
row.names(da)
da["1", ]

## Como o data frame é um caso particular de lista, então os componentes
## (nesse caso, colunas) podem ser acessados com $
names(da)
da$A

## Para acessar o terceiro elemento da coluna B
da$B[3]
## Segundo e quarto da coluna B
da$B[c(2, 4)]

## Para lidar com NAs em data frames
da[is.na(da), ] # nao retorna o resultado esperado
## É necessário especificar as colunas
da[is.na(da$A), ]
da[is.na(da$B), ]

## Para remover as linhas com NA
da[!is.na(da$B), ]
## Note que a linha inteira é excluida

## A função complete.cases facilita essa seleção
complete.cases(da)
da[complete.cases(da), ]

##----------------------------------------------------------------------
## A função with()

with(da, A) # é o mesmo que
da$A

## O terceiro elemento da coluna B
da$B[3]
with(da, B[3])

## Exercícios (ver material)
mm <- matrix(1:12, nrow = 4)
mm[4, 2]
mm[-3, -2]
ll <- list(v1 = 1:10, v2 = letters[1:7], mm = mm)
ll
ll[[1]][5:3]
ll[[2]][-c(2,6)]
ll[[3]][, 3]
ll$v3 <- rnorm(30, 12, 2)
dd <- data.frame(Letras = LETTERS[1:10],
                 Numeros = c(runif(7, 1, 5), rep(NA, 3)))
dd
dd[1:2, ]
dd[9:10, ]
dd[6, 1]
dd[4, 2]
sum(is.na(dd$Numeros))
sum(!complete.cases(dd))
dd <- dd[complete.cases(dd), ]
dd
dd$Numeros2 <- 1:nrow(dd)
dd
ll$l1 <- list(A = 1:5, B = letters[1:6])
ll$l1$A[4]
ll$l1$B[3]
