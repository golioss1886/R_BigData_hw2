library(plotly)
x <- read.csv("supply.csv",encoding="UTF-8",header=T,sep=",")
S <- x
x[,8]
nuclear <- vector()
# nuclear[1] <- sum(x[1,8:13])
nuclear
for (i in 1:486) { # care excel 1 ,2
    nuclear[i] <-  sum(x[i,8:13])
}
fire <- vector()
for (i in 1:486) { # care excel 1 ,2
    fire[i] <-  sum(x[i,14:32])
}
Coal <- vector()
for (i in 1:486) { # care excel 1 ,2
    Coal[i] <-  sum(x[i,33:37])
}
labels <- c("nuclear","fire","Coal")
fig <- plot_ly(labels = labels,values = c(nuclear[2],fire[1],Coal[1]) ,type = "pie")
fig

anchor <- as.Date("2020-01-01")
as.numeric(as.Date("2020-01-03") - anchor)
