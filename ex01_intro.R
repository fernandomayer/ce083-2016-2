## ----setup, include=FALSE------------------------------------------------
source("setup_knitr.R")

## ---- eval=FALSE---------------------------------------------------------
## ##----------------------------------------------------------------------
## ## 1. Faça a importação destes dados para o R.
## url <- "http://www.leg.ufpr.br/~fernandomayer/dados/milsa.csv"
## milsa <- read.table(url, header = TRUE, sep = ",", dec = ".")
## str(milsa)
## ##----------------------------------------------------------------------
## ## 2. Considerando a variável "estado civil" (`Est.civil`):
## # a. Faça tabelas de frequência absoluta e relativa
## table(milsa$Est.civil)
## prop.table(table(milsa$Est.civil))
## # b. Faça um gráfico de barras e um de setores ("pizza")
## barplot(table(milsa$Est.civil))
## pie(table(milsa$Est.civil))
## ##----------------------------------------------------------------------
## ## 3. Considerando a variável "grau de instrução" (`Inst`):
## # a. Faça tabelas de frequência absoluta e relativa
## table(milsa$Inst)
## prop.table(table(milsa$Inst))
## # b. Faça um gráfico de barras e um de setores ("pizza")
## barplot(table(milsa$Inst))
## pie(table(milsa$Inst))
## ##----------------------------------------------------------------------
## ## 4. Considerando a variável "número de filhos" (`Filhos`):
## # a. Faça tabelas de frequência absoluta, relativa e acumulada
## table(milsa$Filhos)
## prop.table(table(milsa$Filhos))
## cumsum(table(milsa$Filhos))
## # b. Faça um gráfico com as frequências relativas e outro com as
## # frequências relativas acumuladas
## plot(prop.table(table(milsa$Filhos)))
## plot(cumsum(prop.table(table(milsa$Filhos))), type = "S",
##      axes = FALSE)
## axis(1, at = 1:5, labels = c(0, 1, 2, 3, 5))
## axis(2)
## box()
## ##----------------------------------------------------------------------
## ## 5. Considerando a variável "salário" (`Salario`):
## # a. Verifique os valores máximo e mínimo e qual seria o número
## # adequado de classes para a construção de uma tabela de
## # frequência para resumir esta variável
## range(milsa$Salario)
## nclass.Sturges(milsa$Salario)
## classes <- cut(milsa$Salario, breaks = nclass.Sturges(milsa$Salario))
## table(classes)
## # b. Faça um histograma
## hist(milsa$Salario)
## ##----------------------------------------------------------------------
## ## 6. Considerando as variáveis "estado civil" (`Est.civil`) e "grau de
## ## instrução" (`Inst`):
## # a. Faça uma tabela de contingência para resumir o cruzamento
## # destas duas variáveis
## tab <- table(milsa$Est.civil, milsa$Inst)
## # b. A partir da tabela de contingância, faça um gráfico de barras
## # (veja como ficam as barras sobrepostas e lado a lado)
## par(mfrow = c(1,2))
## barplot(tab, legend = TRUE)
## barplot(tab, beside = TRUE, legend = TRUE)
## par(mfrow = c(1,1))
## ##----------------------------------------------------------------------
## ## 7. Considerando as variáveis "grau de instrução" (`Inst`) e
## ## "salário" (`Salario`):
## # a. Faça um *boxplot* para verificar a relação entre estas duas
## # variáveis
## boxplot(Salario ~ Inst, data = milsa)
## # b. Calcule a média e o desvio-padrão dos salários para cada grau
## # de instrução
## with(milsa, tapply(Salario, Inst, mean))
## with(milsa, tapply(Salario, Inst, sd))
## ##----------------------------------------------------------------------
## ## 8. Considerando as variáveis `Anos` e `Meses`:
## # a. Calcule a idade como $\text{Anos} + \text{Meses}/12$ (criando
## # uma nova "coluna" chamada `Idade`)
## milsa$Idade <- milsa$Anos + milsa$Meses/12
## ##----------------------------------------------------------------------
## ## 9. Considerando as variáveis `Salario` e `Idade`:
## # a. Faça um gráfico para explorar a relação entre estas duas
## # variáveis
## plot(Salario ~ Idade, data = milsa)
## # b. Calcule a correlação entre estas duas variáveis
## cor(milsa$Idade, milsa$Salario)

## ---- eval=FALSE---------------------------------------------------------
## ##----------------------------------------------------------------------
## ## Usando a variável Salario
## mean(milsa$Salario)
## var(milsa$Salario)
## sd(milsa$Salario)
## median(milsa$Salario)
## quantile(milsa$Salario)
## ##----------------------------------------------------------------------
## ## Usando a variável Filhos
## mean(milsa$Filhos, na.rm = TRUE)
## var(milsa$Filhos, na.rm = TRUE)
## sd(milsa$Filhos, na.rm = TRUE)
## median(milsa$Filhos, na.rm = TRUE)
## quantile(milsa$Filhos, na.rm = TRUE)

## ---- eval=FALSE---------------------------------------------------------
## ##----------------------------------------------------------------------
## data(USArrests)
## str(USArrests)
## ##----------------------------------------------------------------------
## ## a. Qual o número médio e mediano de cada um dos crimes?
## crimes <- c("Murder", "Assault", "Rape")
## apply(USArrests[, crimes], 2,
##       function(x) c(Media = mean(x), Mediana = median(x)))
## ##----------------------------------------------------------------------
## ## b. Encontre a mediana e quartis para cada crime.
## apply(USArrests[, crimes], 2, quantile)
## ##----------------------------------------------------------------------
## ## c. Encontre o número máximo e mínimo para cada crime.
## apply(USArrests[, crimes], 2, range)
## apply(USArrests[, crimes], 2,
##       function(x) c(Min = min(x), Max = max(x)))
## ##----------------------------------------------------------------------
## ## d. Faça um gráfico adequado para o número de assassinatos
## ## (`Murder`).
## hist(USArrests$Murder)
## ##----------------------------------------------------------------------
## ## e. Faça um *boxplot* para o número de estupros (`Rape`).
## boxplot(USArrests$Rape)
## ##----------------------------------------------------------------------
## ## f. Verifique se há correlação entre os diferentes tipos de crime.
## plot(USArrests[, crimes])
## cor(USArrests[, crimes])
## ##----------------------------------------------------------------------
## ## g. Verifique se há correlação entre os crimes e a proporção de
## ## população urbana.
## plot(USArrests)
## cor(USArrests)
## ##----------------------------------------------------------------------
## ## h. Encontre os estados com maior e menor ocorrência de cada tipo de
## ## crime.
## # Murder
## row.names(USArrests)[which.min(USArrests$Murder)]
## row.names(USArrests)[which.max(USArrests$Murder)]
## # Assault
## row.names(USArrests)[which.min(USArrests$Assault)]
## row.names(USArrests)[which.max(USArrests$Assault)]
## # Rape
## row.names(USArrests)[which.min(USArrests$Rape)]
## row.names(USArrests)[which.max(USArrests$Rape)]
## ##----------------------------------------------------------------------
## ## i. Encontre os estados com maior e menor ocorrência per capta de cada
## ## tipo de crime.
## # Os crimes estao em numeros por 100.000 habitantes. Para calcular o
## # numero de crimes per capta (por habitante), basta dividir cada coluna
## # por 100.000, e multiplicar pela porporcao de populacao urbana
## USArrests <- transform(USArrests, Murder2 = Murder/100000 * UrbanPop,
##                        Assault2 = Assault/100000 * UrbanPop,
##                        Rape2 = Rape/100000 * UrbanPop)
## # Murder per capta
## row.names(USArrests)[which.min(USArrests$Murder2)]
## row.names(USArrests)[which.max(USArrests$Murder2)]
## # Assault per capta
## row.names(USArrests)[which.min(USArrests$Assault2)]
## row.names(USArrests)[which.max(USArrests$Assault2)]
## # Rape per capta
## row.names(USArrests)[which.min(USArrests$Rape2)]
## row.names(USArrests)[which.max(USArrests$Rape2)]
## ##----------------------------------------------------------------------
## ## j. Encontre os estados com maior e menor ocorrência do total de crimes.
## # Cria uma coluna com o total de crimes
## USArrests <- transform(USArrests, Total = Murder + Assault + Rape)
## row.names(USArrests)[which.min(USArrests$Total)]
## row.names(USArrests)[which.max(USArrests$Total)]
## ##----------------------------------------------------------------------
## ## k. Calcule a média de crimes (entre `Murder`, `Assault` e `Rape`)
## ## para cada estado.
## apply(USArrests[, crimes], 1, mean)

## ---- eval=FALSE, echo=FALSE, include=FALSE------------------------------
## ## a
## pbinom(0, size = 5, prob = 0.3)
## dbinom(0, size = 5, prob = 0.3)
## ## b
## dbinom(2, size = 5, prob = 0.3)
## ## c
## pbinom(2, size = 5, prob = 0.3, lower.tail = FALSE)

## ---- echo=FALSE, eval=FALSE, include=FALSE------------------------------
## # multiplica horas por 60 minutos para ter emails/min
## (lambda <- 720/(8*60))
## 
## ## a
## t <- 6
## (mu <- lambda * t)
## ## P[X >= 3] = 1 - P[X < 3]
## 1 - (dpois(0, mu) + dpois(1, mu) + dpois(2, mu))
## ppois(2, mu, lower.tail = FALSE)
## 
## ## b
## t <- 4
## (mu <- lambda * t)
## ppois(0, mu)
## dpois(0, mu)

## ---- eval=FALSE---------------------------------------------------------
## ## a
## pnorm(13.2, 13, 0.1) - pnorm(13, 13, 0.1)
## ## b
## pnorm(13.25, 13, 0.1, lower.tail = FALSE)
## ## c
## pnorm(13.1, 13, 0.1) - pnorm(12.8, 13, 0.1)
## ## d
## pnorm(13.2, 13, 0.1) - pnorm(13.1, 13, 0.1)

## ---- eval=FALSE---------------------------------------------------------
## ##----------------------------------------------------------------------
## sigma <- 200
## n <- 400
## xbarra <- 1000
## ##----------------------------------------------------------------------
## ## a.
## xbarra + (qnorm(0.10/2) * (sigma/sqrt(n))) * c(1, -1)
## ##----------------------------------------------------------------------
## ## b.
## xbarra + (qnorm(0.05/2) * (sigma/sqrt(n))) * c(1, -1)

## ---- eval=FALSE---------------------------------------------------------
## ##----------------------------------------------------------------------
## mu0 <- 11
## sigma <- 0.8
## n <- 35
## xbarra <- 11.4

