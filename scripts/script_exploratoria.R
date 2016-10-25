## Analise exploratoria de dados

## Importar os dados do Gapminder em
## http://www.leg.ufpr.br/~fernandomayer/dados
url <- "http://www.leg.ufpr.br/~fernandomayer/dados/pib_gapminder.csv"
## Importando pela url
dados <- read.table("dados/pib_gapminder.csv", header = TRUE,
                    sep = ",", dec = ".", as.is = TRUE)
str(dados)

## Analise exploratoria de dados

## Identificando variaveis

## Quais sao os paises?
unique(dados$pais)
length(unique(dados$pais))
# Quantos casos para cada pais (tabela de frequencia)
length(dados$pais[dados$pais == "Brazil"])
table(dados$pais)

## Quantos anos existem? Quais?
unique(dados$ano)
length(unique(dados$ano))
table(dados$ano)

## Quais são os continentes?
unique(dados$continente)
length(unique(dados$continente))
table(dados$continente)
table(dados$continente)/sum(table(dados$continente))
prop.table(table(dados$continente))
addmargins(table(dados$continente))
addmargins(prop.table(table(dados$continente)))

## Tabelas de dupla entrada
table(dados$ano, dados$continente)
addmargins(table(dados$ano, dados$continente))

## Graficos para variaveis qualitativas
barplot(table(dados$continente))
barplot(table(dados$continente),
        xlab = "Continentes",
        ylab = "Frequência",
        main = "Ocorrência dos continentes")
barplot(sort(table(dados$continente)))
barplot(sort(table(dados$continente), decreasing = TRUE))

pie(table(dados$continente))

## Variaveis quantitativas
mean(dados$expVida)
sd(dados$expVida)
var(dados$expVida)
cv(dados$expVida)
sd(dados$expVida)/mean(dados$expVida)
## Criando a função CV
cv <- function(x){
    sd(x)/mean(x)
}
class(cv)
max(dados$expVida)
min(dados$expVida)
range(dados$expVida)
amp(dados$expVida)
max(dados$expVida) - min(dados$expVida)
diff(range(dados$expVida))

amp <- function(x){
    diff(range(x))
}

summary(dados$expVida)
quantile(dados$expVida)
fivenum(dados$expVida)

## Construindo tabelas de frequencia para var. quantitativas
sqrt(length(dados$expVida))
nclass.Sturges(dados$expVida)
nclass.FD(dados$expVida)
range(dados$expVida)
seq(23.599, 82.603, length.out = 12)
diff(seq(23.599, 82.603, length.out = 12))
classes <- cut(dados$expVida,
               breaks = seq(23.599, 82.603, length.out = 12),
               include.lowest = TRUE)
classes
table(classes)
addmargins(table(classes))
dim(dados)
length(classes)

## Frequencia relativa
prop.table(table(classes))
addmargins(prop.table(table(classes)))
cbind("f" = addmargins(table(classes)),
      "fr" = addmargins(prop.table(table(classes))))

# Histograma
hist(dados$expVida)
hist(dados$expVida,
     breaks = seq(23.599, 82.603, length.out = 12),
     include.lowest = TRUE)
hist(dados$expVida, nclass = 30)

hist(dados$expVida, freq = FALSE, labels = TRUE)

# Boxplot
boxplot(dados$expVida)
boxplot(dados$pibPercap)

par(mfrow = c(1, 2))
boxplot(dados$expVida[dados$pais == "Brazil"],
        ylim = c(40, 80),
        ylab = "Expectativa de vida",
        main = "Brasil")
boxplot(dados$expVida[dados$pais == "Uruguay"],
        ylim = c(40, 80),
        ylab = "Expectativa de vida",
        main = "Uruguai")
par(mfrow = c(1, 1))
length(unique(dados$pais))

boxplot(expVida ~ pais, data = dados)
boxplot(expVida ~ continente, data = dados)

## Fazer boxplots de expVida para os paises:
# Brasil
# Uruguai
# Argentina
# Chile
# Paraguai
# Colombia
# Equador
## Veja ?subset



