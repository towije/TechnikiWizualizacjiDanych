setwd("C:/Users/Paulina/Desktop/III semestr/Techniki wizualizacji danych/Praca domowa 2")

data<-read.csv("PD.csv", sep=";", h=T)

library(ggplot2)

n<-sum(data[1,-1])
col<-c("#c0eaa3","#a6e491","#82c76a","#74b15e","#578546")

ggplot(data)+
  geom_bar(stat="identity", aes(x=oceniany, y=(zdecydowanie_zle+raczej_zle+nie_wiem+
                                                 raczej_dobrze+zdecydowanie_dobrze)/n, 
                                fill="1. Zdecydowanie dobrze"))+
  geom_bar(stat="identity", aes(x=oceniany, y=(zdecydowanie_zle+raczej_zle+nie_wiem+raczej_dobrze)/n,
                                fill="2. Raczej dobrze"))+
  geom_bar(stat="identity", aes(x=oceniany, y=(zdecydowanie_zle+raczej_zle+nie_wiem)/n,
                                fill="3. Nie wiem"))+
  geom_bar(stat="identity", aes(x=oceniany, y=(zdecydowanie_zle+raczej_zle)/n,
                                fill="4. Raczej �le"))+
  geom_bar(stat="identity", aes(x=oceniany, y=zdecydowanie_zle/n,
                                fill="5. Zdecydowanie �le"))+
  scale_fill_manual(name="",values=col)+
  theme(axis.text.x = element_text(size=15, face="bold"), axis.text.y=element_blank(),
        axis.ticks=element_blank(), panel.background=element_blank(), 
        legend.text=element_text(size=10), plot.title=element_text(size=30, hjust=0.15))+
  xlab("")+
  ylab("")+
  ggtitle("Wyniki sonda�u TNS (07-11/10/2016)")+
  geom_text(aes(x=oceniany, y=1-(zdecydowanie_dobrze/(2*n)),
                label=paste(round(zdecydowanie_dobrze*100/n),"%")),hjust=0.5)+
  geom_text(aes(x=oceniany, y=1-(zdecydowanie_dobrze/n)-(raczej_dobrze/(2*n)),
                label=paste(round(raczej_dobrze*100/n),"%")),hjust=0.5)+
  geom_text(aes(x=oceniany, y=1-(zdecydowanie_dobrze/n)-(raczej_dobrze/n)-(nie_wiem/(2*n)),
                label=paste(round(nie_wiem*100/n),"%")),hjust=0.5)+
  geom_text(aes(x=oceniany, y=1-(zdecydowanie_dobrze/n)-(raczej_dobrze/n)-(nie_wiem/n)-
                  (raczej_zle/(2*n)),label=paste(round(raczej_zle*100/n),"%")),hjust=0.5)+
  geom_text(aes(x=oceniany, y=1-(zdecydowanie_dobrze/n)-(raczej_dobrze/n)-(nie_wiem/n)-
                  (raczej_zle/n)-(zdecydowanie_zle/(2*n)),
                label=paste(round(zdecydowanie_zle*100/n),"%")),hjust=0.5)

