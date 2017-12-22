clear all
close 
// UPS - M2 ISTR- Decembre 2017
// Lucien RAKOTOMALALA & David TOCAVEN
// BE de controle et simulation - Partie I

// Indices des etats
// Indices =  1  2  3  4  5  6  7  8  9  10  11 12 13  14 15 16  17 
//   X     = [A1 B1 C1 D1 D2 C2 B2 A2 A22 E1 F1 B12 G1 G2 B22 F2 E2]

A1  =1;
B1  =2;
C1  =3;
D1  =4;
D2  =5;
C2  =6;
B2  =7;
A2  =8;
A22 =9;
E1  =10;
F1  =11;
B12 =12;
G1  =13;
G2  =14;
B22 =15;
F2  =16;
E2  =17;

// Matrice dynamique

A =full(%zeros(17,17)); 
    // boucle bleu
    A(A1,D2)    =7+6+4+2;
    
    A(B1,D2)    =6+4+2;
    
    A(C1,D2)    =4+2;
    
    A(D1,D2)    =2;
    
    A(D2,E2)    =4+6+3+5+2;
    A(D2,A22)   =4+6+7+2;
    
    A(C2,A22)   =6+7+2;
    A(C2,E2)    =6+3+5+2;
    
    A(B2,A22)   =7+2;
    A(B2,E2)    =3+5+2;
    
    A(A2,A22)   =2;
    
    A(A22,A1)   =0;
    
    // bloucle noire
    A(E2,G1)    =5+3+2+2;
    A(E2,A22)   =5+3+7+2;
    A(E2,E2)    =5+3+3+5+2;
    
    A(F2,G1)    =3+2+2;
    A(F2,A22)   =3+7+2;
    A(F2,E2)    =3+3+5;
    
    A(B22,G1)   =2+2;
    A(B22,A22)  =7+2;
    A(B22,E2)   =3+5;
    
    A(G2,G1)    =2;
    A(G1,E2)    =2+3+5+2;
    
    A(B12,E2)   =3+5+2;
    
    A(F1,E2)    =5+2;
    A(E1,E2)    =2;

// Vecteur propre & Valeur(s) propre(s)   
//[Vect_prop, Val_prop]= eigenspace(A); 
[Val_prop,Vect_prop,p,c,n]=howard(A)    
// Val_prop = 18
// Vect_prop = [ 3 ; -4 ; -10 ; -14 ; 2 ; -2 ; -8 ; -31; -15 ; ...
//              -16 ; -11 ; -8 ; -6 ; -22 ; -10 ; -7 ; 0  ]
// vecteur d'état initial
X0 = full(%zeros(17,1));
    X0(A2)= 3;
    X0(A22)=5;
    X0(G2)= 8;
    X0(D1)= 1;
    X0(E1)= 3;
    X0(F1)= 8;
    X0(C1)= 5;
    X0(B12)= 11;
    X0(G1)= 13;
    X0(C2)= 17;
    X0(D2)= 21;
    X0(B2)= 11;
    X0(F2)= 14;
    X0(B1)= 11;
    X0(B22)= 11;
    X0(E2)= 19;
    X0(A1)= 18;
// Dates de départs de tous les trains venants de toutes les gares possibles
X=full(%zeros(17,10));
X(:,1)=X0(:);
for(i = 2:10)
    X(:,i)=A*X(:,i-1);
end
X(B2,:) // Dates de départs des 10 premiers trains venants de B en C
// Différence de temps entre les départs
Xcy =full(%zeros(17,9));
for(i = 1:9)
    Xcy(:,i)=X(:,i+1)-X(:,i);
end
Xcy // On voit qu'à partir du 5ème départs, les trains 
    // mettent 18ut à effectuer leurs trajets. La gare A2 
    X2 = howard(A)
// temps inter-arrivées identiques
X=full(%zeros(17,10));
X(:,1)=Vect_prop;
for(i = 2:10)
    X(:,i)=A*X(:,i-1);
end
// Différence de temps entre les départs
Xcy =full(%zeros(17,9));
for(i = 1:9)
    Xcy(:,i)=X(:,i+1)-X(:,i);
end
// Ajout d'un train

E12 = 18;

// Nouvelle matrice dynamique avec un train en plus 
A2 = full(%zeros(18,18));
   // boucle bleu
    A2(A1,D2)    =7+6+4+2;
    
    A2(B1,D2)    =6+4+2;
    
    A2(C1,D2)    =4+2;
    
    A2(D1,D2)    =2;
    
    A(D2,E2)    =4+6+3+5+2;
    A(D2,A22)   =4+6+7+2;
    
    A(C2,A22)   =6+7+2;
    A(C2,E2)    =6+3+5+2;
    
    A(B2,A22)   =7+2;
    A(B2,E2)    =3+5+2;
    
    A(A2,A22)   =2;
    
    A(A22,A1)   =0;
    
    // bloucle noire
    A(E2,G1)    =5+3+2+2;
    A(E2,A22)   =5+3+7+2;
    A(E2,E2)    =5+3+3+5+2;
    
    A(F2,G1)    =3+2+2;
    A(F2,A22)   =3+7+2;
    A(F2,E2)    =3+3+5;
    
    A(B22,G1)   =2+2;
    A(B22,A22)  =7+2;
    A(B22,E2)   =3+5;
    
    A(G2,G1)    =2;
    A(G1,E2)    =2+3+5+2;
    
    A(B12,E2)   =3+5+2;
    
    A(F1,E2)    =5+2;
    A(E1,E2)    =2;
