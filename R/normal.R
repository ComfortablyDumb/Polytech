# La fonction rnorm g�n�re des valeurs al�atoires suivant une loi normale
# continue
# rnorm(n, mu, sigma) g�n�re n valeurs al�atoires de la loi
# Norm(mu, sigma^2)
# Nous pouvons tester les probabilit�s 0.68 et 0.95 de la loi normale
# centr�e r�duite
x = rnorm(10000,0,1)
mean(abs(x) < 1)
mean(abs(x) < 2)

 # dnorm est la densit� de probabilit�
 # Loi normale centr�e r�duite
 z = seq(-6,6,.01) # 'sequence' de -6 � 6 par pas de 0.01
 plot(z,dnorm(z,0,1), type="l", col="blue", lwd=3)
 # Si on ajoute d'autres densit�s
 lines(z,dnorm(z,1,1), col="red", lwd=3)
 lines(z,dnorm(z,0,2), col="green", lwd=3)

 # pnorm est la fonction de r�partition
 # Loi normale centr�e r�duite
 z = seq(-6,6,.01)
 plot(z,pnorm(z,0,1), type="l", col="blue", lwd=3)
 # d'autres
 lines(z,pnorm(z,1,1), col="red", lwd=3)
 lines(z,pnorm(z,0,2), col="green", lwd=3)
 
 data = rnorm(1000,0,1)
 hist(data)
 
 hist(data, breaks=2)
 