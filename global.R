library(plotly)
x <- read.csv("supply.csv",encoding="UTF-8",header=T,sep=",")
summit_supply <- vector()
summit_affort <- vector()

Nuclear <- vector()
Coal <- vector()
IPP_Coal <- vector()
Co_Gen <- vector()
LNG <- vector()
IPP_LNG <- vector()
Oil <- vector()
Hydro <- vector()
Wind <- vector()
Solar <- vector()
Total_Fire <- vector()
Total_Green <- vector()
# Diesel <- vector()
# nuclear[1] <- sum(x[1,8:13])
for (i in 1:486) { # care excel 1 ,2
    summit_supply[i] <- x[i,2]
    summit_affort[i] <- x[i,3]
  
    Nuclear[i] <-  sum(x[i,8:13])
    
    Coal[i] <-  sum(x[i,14:32])
    IPP_Coal[i] <-  sum(x[i,33:37])
    Co_Gen[i] <- x[i,38]#汽電共生
    LNG[i] <- sum(x[i,39:43])#燃氣
    IPP_LNG[i] <- sum(x[i,44:50])
    Oil[i] <- x[i,51]
    
    Total_Fire[i] <- Coal[i] + IPP_Coal[i] + Co_Gen[i] + LNG[i] + IPP_LNG[i] + Oil[i]
    
    Hydro[i] <- sum(x[i,52:69])
    Wind[i] <- x[i,70]
    Solar[i] <- x[i,71]
    
    Total_Green[i] <- Hydro[i] + Wind[i] + Solar[i]
}

labels <- c("Nuclear","Coal","IPP_Coal","Co_Gen","LNG","IPP_LNG","Oil","Hydro","Wind","Solar")
labels_three_type <- c("Nuclear","Total_Fire","Total_Green")

dff <- read.csv("buy_year.csv",fileEncoding = 'utf-8',header=T,sep=",")
check_box <- c("抽蓄水力(台電)","燃油(台電)","燃煤(台電)","燃氣(台電)","核能(台電)",
"地熱(台電)","慣常水力(台電)","風力(台電)","太陽能(台電)","台電自有電力","燃煤(購電)",
"燃氣(購電)","地熱(購電)","承攬水力(購電)","水力(購電)","風力(購電)","太陽能(購電)",
"生質能(購電)","垃圾沼氣(購電)","汽電共生(購電)")
df_tmp <- dff
for( i in 1:length(df_tmp) ) {
  df_tmp[,i] <- gsub(pattern = " -", replacement = "0",df_tmp[,i])
}
