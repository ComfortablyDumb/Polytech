//Exercice 1
/*

P=rand(5,5)
e = 1E-20
A = P*diag([ones(4,1);e])*inv(P)
//En théorie det(A)=e
disp(det(A))
disp(det(diag([ones(4,1);e])))
//On constate qu'il y a une erreur dans le calcule du déterminant(sûrement du à des erreurs dans le calcul de inv(P))
*/

//Exercice 2

//n=10000

/*
for i=1:1000
    A=rand(8,n)*rand(n,6)
    disp(rank(A))
end
*/

// Quand n<=6 on a rank(A)=n et quand n>=6 on a rank(A)=6. Comme A prend des valeurs quasi-continues il y a très peu de chance qu'elle soit non-inversible (et donc de rang non maximal)

/*
function y=MatAlea01(m,n)
    y=modulo(floor(rand(m,n)*100),2)
endfunction

for i=1:1000
    A=MatAlea01(8,n)*MatAlea01(n,6)
    
    disp(rank(A))
           
end
*/

//A n'a pas pas été inversible une fois, cela reste très rate mais plus probable.

// A prend moins de valeurs donc il y a plus de chance que ces colonnes/lignes soient colinéaires.

//Exercice 3

//A=[1 1/2 1/2 ;0 1/2 -1/2 ; 0 -1/2 1/2]
/*
disp(A)
disp(A*A)

//A^2=A donc A est une projection

disp(kernel(A))


// On sait que Im(A)=Ker(Id-A)

disp(kernel(eye(3,3)-A))


function [y,z]=decomp(x,A)
    n = size(A,1)
    y = (eye(n,n)-A)*x
    z = A*x
    
endfunction

x=[1 1 1]'
[y,z]=decomp(x,A)

disp([y,z])
*/

//Exercice 4
/*
n=9

u=rand(n,1)
v=rand(n,1)

w = v-(u'*v)/(u'*u)*u

disp(w'*u)
*/

//Exercice 5

function F=FreeMat(A)
    //Extrait une famille libre à partir des vecteurs de A (en colonne)
    F(:,1)=A(:,1)
    for i=2:size(A,2)
        if(rank(F)<rank([F A(:,i)])) then
            F(:,i)=A(:,i)
        end
    end
endfunction

function s=ps(u,v)
    s=u'*v
endfunction

function p=projOrtho(x,A)
    n = size(A,2)
    m = size(A,1)
    p=zeros(m,1)
    
    //disp(n)
    for i=1:n
        
        u = A(:,i)
        
        //disp(u)
        p = p + ps(u,x).*u./(norm(u)^2)  
    end
endfunction

function U=GS(A)
    U = A
    U(:,1)=U(:,1)/norm(U(:,1))
    for i=2:size(U,2)
        
        U(:,i)= U(:,i) - projOrtho(U(:,i),U(:,1:i-1))
        U(:,i) = U(:,i)/norm(U(:,i))
        
    end
    U(:,size(U,2))=U(:,size(U,2))/norm(U(:,size(U,2)))
endfunction

function [Q,R]=Qr(A)
    Q=GS(A)
    R=triu(Q'*A)
endfunction

n=5; u=1:n; u=u'; c2=cos(2*u); c=cos(u); s=sin(u);
A=[u c2 ones(n,1) rand()*c.*c exp(u) s.*s];
disp(A)
U=GS(A)
disp(U)
disp(U'*U)
disp(GS(U))

//U'U n'est pas égale à l'identité
//GS(U)!=U alors que U est orthonormale









 






