#Application

#On pose X la var des gains de Jean et Y celle de Marie(sur un jour)
#E(un pari) = 1*18/38 - 1*20/38 = -2/38  =-1/19
#E(X)=E(10 paris)=-10E(un pari)=-10/38=-5/19
#E(Y)=E(15 paris)=-15/38
#X=sum(Xpi)
#X2=100*Xp^2 Ex2 = 100*E(Xp^2)


Ex = -5/19
Ey = -15/38

varXp = (1-Ex)^2*18/38+(-1-Ex)^2*20/38
EXp = -1/19
varX = 10*varXp
varY = 15*varXp


print(varX)
sY = sqrt(varY)

#Les gains de Marie et de Jean sont ind�pendants donc cov(X,Y)=0

#d)
#Si ils jouent pendant 100 jours, on multiplie juste les deux var par 100

#E(100X)=100E(X)
#var(100X)=100�var(X) et var(100Y)=100�*var(Y),cov(100X;100Y)=100�*cov(X,Y)
n=1000
Gainv = c()
GainVM =c()
for (i in 1:5000) {
  
  X=sample(c(-1,1),n,replace=TRUE,c(20/38,18/38))
  Y=sample(c(-1,1),500,replace=TRUE,c(20/38,18/38))
  Z=X+Y
  Gain = sum(X)
  GainM = sum(Z)
  Gainv = append(Gainv,Gain)
  GainVM = append(GainVM,GainM)
  
  
}
mean(Gainv)
print(Gainv)
hist(Gainv,freq=FALSE,breaks=25,col="red",main="Histogramme des gains de Jean")
t = seq(-800,800,0.1)
norm = dnorm(t,mean = EXp*n,sd = sqrt(n*varXp))
lines(t,norm, col="blue", lwd=2)


�=EXp*n
s=sqrt(n*varXp)
q=0
for(gain in Gainv){
  if(gain>�-2*s && gain<�+2*s){
    q=q+1
  }
}
f = q/length(Gainv)
print(f)
#2.3

plot(Gainv, GainVM, pch=19,cex=0.5, col=rgb(1,0.59,0.59,alpha=0.5))
cv = cov(Gainv,GainVM)
print(cv)
hist(c(1,2,3))