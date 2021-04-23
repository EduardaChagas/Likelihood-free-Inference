
readingMPR<-function(dimension, option=0){
  if(dimension == 3){ 
    continua = "../Data/trozos/continuaN6.txt"
    trozo = "../Data/trozos/trozosN6.txt"
  }
  if(dimension == 4){ 
    continua = "../Data/trozos/continuaN24.txt"
    trozo = "../Data/trozos/trozosN24.txt"
  }
  if(dimension == 5){ 
    continua = "../Data/trozos/continuaN120.txt"
    trozo = "../Data/trozos/trozosN120.txt"
  }
  if(dimension == 6){ 
    continua = "../Data/trozos/continuaN720.txt"
    trozo = "../Data/trozos/trozosN720.txt"
  }
  if(dimension == 36){ 
    continua = "../Data/trozos/continuaN36.txt"
    trozo = "../Data/trozos/trozosN36.txt"
  }
  if(dimension == 576){ 
    continua = "../Data/trozos/continuaN576.txt"
    trozo = "../Data/trozos/trozosN576.txt"
  }
  if(dimension == 14400){ 
    continua = "../Data/trozos/continuaN14400.txt"
    trozo = "../Data/trozos/trozosN14400.txt"
  }
  if(dimension == 518400){ 
    continua = "../Data/trozos/continuaN518400.txt"
    trozo = "../Data/trozos/trozosN518400.txt"
  }
  curva1x = read.table(continua, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
  if(option==1) return(curva1x)
  curva1y = read.table(continua, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
  if(option==2) return(curva1y)
  curva2x = read.table(trozo, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
  if(option==3) return(curva2x)
  curva2y = read.table(trozo, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
  if(option==4) return(curva2y)
}