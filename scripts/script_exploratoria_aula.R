## Importa dados
dados <- read.table("dados/pib_gapminder.csv", header = TRUE,
                    sep = ",", dec = ".", as.is = TRUE)
str(dados)

## Faz um subset, criando dados2
paises <- c("Brazil", "Uruguay", "Argentina", "Chile",
            "Paraguay", "Colombia", "Ecuador")
dados2 <- subset(dados, pais %in% paises)
str(dados2)

## Cria figura em PDF
pdf("fig.pdf", width = 8, height = 6)
plot(expVida ~ pibPercap, data = dados2)
dev.off()

## Cria uma tabela com as médias de expVida por pais
aggregate(expVida ~ pais, data = dados2, mean)
