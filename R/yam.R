#Vecteur contenant les diff�rents succ�s ou echec du yam
yamV = list()

#On essaie 10000 fois
for(j in 1:10000){
  #On commence avec 5 d�s
  n=5
  yam = FALSE
  #On a le droit � 3 essais
  for (i in 1:3) {
    lance = sample(1:6,n,replace=TRUE)
    nb6 = sum(lance==6)
    #Si le d� est �gal � 6 on ne le relance pas
    n=n-nb6
    #Quand on tous les d�s sont �gaux � 6 on a r�ussi � faire un Yam de 6
    if(n==0){
      yam=TRUE
      break
    }
  }
  #On rajoute l'essaie au vecteur
  yamV = append(yamV,yam)
}

#On calcule la probabilit� de faire un yam
print(mean(yamV==TRUE))
