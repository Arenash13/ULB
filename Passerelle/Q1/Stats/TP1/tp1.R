# Ex 1.1
v<-rep(c(4, 6, 3),4)

# Ex 1.2
poids<-c(28, 27.5, 27, 28, 30.5, 30, 31, 29.5, 30, 31, 31, 31.5, 32, 30, 30.5)
poids1<-c(40, 39, 41, 37.5, 43)
nouveau.poids<-c(rep(poids1, 2), tail(poids, n=10))

# Ex 1.3
poids<-poids1
taille<-c(137, 139, 140, 139, 127)
nom<-c("Jean", "Pierre", "Thomas", "Eric", "Simon")
Table1<-data.frame(poids, taille, row.names=nom)
Table1

plus<-subset(Table1, poids >=40)
plus

nomplus<-subset(nom, Table1$poids<40 & Table1$taille >=139)
nomplus

# Ex 1.4
variete<-rep(c(1, 2, 3),c(4, 4, 4))
jutosite<-c(4, 6, 3, 5, 7, 8, 7, 6, 8, 6, 5, 6)
pommes<-data.frame(variete, jutosite)

plot(table(pommes$jutosite))

golden<-subset(pommes, pommes$variete==1)
calville<-subset(pommes, pommes$variete==2)
belle_boskoop<-subset(pommes, pommes$variete==3)

plot(table(golden$jutosite))
plot(table(calville$jutosite))
plot(table(belle_boskoop$jutosite))

# Ex 1.5
source("http://www.info.univ-angers.fr/~gh/statgh.r")
ronf<-lit.dar("http://www.info.univ-angers.fr/~gh/Datasets/ronfle.dar")
ronf1<-subset(ronf, RONFLE==1)
ronf0<-subset(ronf, RONFLE==0)

eff_taille_ronf1<-table(ronf1$TAILLE)
eff_taille_ronf0<-table(ronf0$TAILLE)

plot(eff_taille_ronf1, main="Les ronfleurs")
plot(eff_taille_ronf0, main="Les non ronfleurs")

# Ex 1.6
hist(ronf$TAILLE)
hist(ronf$TAILLE, breaks="sturges")
plot(table(ronf$TAILLE), xlab="taille", ylab="effectif")