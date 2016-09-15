##======================================================================
## Estatística Computacional I --- CE083
## Prof. Fernando de Pol Mayer --- Departamento de Estatística --- DEST
## Exercícios: comandos básicos e classes de objetos
## GABARITO
##======================================================================

## 1. ------------------------------------------------------------------
x <- c(4, 7, 10, 1)
class(x)
## (c)

## 2. ------------------------------------------------------------------
x <- c(4, "a", TRUE)
class(x)
## (b)

## 3. ------------------------------------------------------------------
rep(c("A", "B", "C"), times = c(1, 3, 2))

## 4. ------------------------------------------------------------------
x <- c(4, TRUE)
class(x)
## (a)

## 5. ------------------------------------------------------------------
x <- c(1, 3, 5)
y <- c(3, 2, 10)
rbind(x, y)
## (b)

## 6. ------------------------------------------------------------------
x <- c(5, 10)
y <- c(2, 8)
cbind(x, y)
## (b)

## 7. ------------------------------------------------------------------
## (d)

## 8. ------------------------------------------------------------------
x <- list(2, "a", "b", TRUE)
length(x); class(x)
## (c)

## 9. ------------------------------------------------------------------
x <- 1:4
y <- 2:3
x * y

## 10. -----------------------------------------------------------------
x <- 1:4
y <- 2:4
x + y

## 11. -----------------------------------------------------------------
da <- structure(list(
    Ozone = c(41L, 36L, 12L, 18L, NA, 28L, 23L, 19L, 8L, NA, 7L, 16L),
    Solar.R = c(190L, 118L, 149L, 313L, NA, NA, 299L, 99L, 19L, 194L,
                NA, 256L),
    Wind = c(7.4, 8, 12.6, 11.5, 14.3, 14.9, 8.6, 13.8, 20.1, 8.6,
             6.9, 9.7),
    Temp = c(67L, 72L, 74L, 62L, 56L, 66L, 65L, 59L, 61L, 69L,
             74L, 69L),
    Month = c(5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L),
    Day = 1:12),
    .Names = c("Ozone", "Solar.R", "Wind", "Temp", "Month", "Day"),
    class = "data.frame", row.names = c(NA, -12L))
da <- da[, -6]
names(da) <- c("Ozonio", "Rad.Solar", "Vento", "Temp", "Mes")
da$Mes <- 1:12
da$Estacao <- "Verao"
da$Estacao[da$Mes %in% c(4,5,6)] <- "Outono"
da$Estacao[da$Mes %in% c(7,8,9)] <- "Inverno"
da$Estacao[da$Mes %in% c(10,11,12)] <- "Primavera"
dados <- da
dados
## (a)
class(dados)
## (b)
class(dados$Ozonio)
## (c)
class(dados$Mes)
## (d)
class(dados$Estacao)

## 12. -----------------------------------------------------------------
dados$Ozonio
## NA significa um valor perdido (não disponível)

## 13. -----------------------------------------------------------------
dados$Rad.Solar >= 180

## 14. -----------------------------------------------------------------
dados2 <- structure(list(
    Racao = structure(c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 3L, 3L,
                        3L, 3L, 3L, 4L, 4L, 4L, 4L, 4L),
                      .Label = c("A", "B", "C", "D"), class = "factor"),
    Ganho.Peso = c(35L, 19L, 31L, 15L, 30L, 40L, 35L, 46L, 41L, 33L,
                   39L, 27L, 20L, 29L, 45L, 27L, 12L, 13L, 28L, 30L)),
    .Names = c("Racao", "Ganho.Peso"), class = "data.frame",
    row.names = c(NA, -20L))
dados2
str(dados2)
## (a)
class(dados2)
## (b)
dim(dados2)
## (c)
names(dados2)
## (d)
class(dados2$Racao)
class(dados2$Ganho.Peso)

## 15. -----------------------------------------------------------------
runif(n = 10, 15, 5) # errada
## (d)

## 16. -----------------------------------------------------------------
seq(from = 1, to = 20, by = 4)

## 17. -----------------------------------------------------------------
epoca <- factor(c("Verao", NA, "Verao", NA, "Outono", "Outono",
                  "Inverno", "Inverno", NA, NA, "Primavera", NA))
levels(epoca)
## (d)
