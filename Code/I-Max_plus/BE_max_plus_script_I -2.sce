clear all
close 
// UPS - M2 ISTR- Decembre 2017
// Lucien RAKOTOMALALA & David TOCAVEN
// BE de controle et simulation - Partie I

// Indices des etats
// Indices =  1  2  3  4  5  6  7  8  9  10  11 12 13  14 15 16  17 
//   X     = [A1 B1 C1 D1 D2 C2 B2 A2 A22 E1 F1 B12 G1 G2 B22 F2 E2]
// Création de A à partir de x_k et x_(k-1)//
A1  =1;
B1  =2;
C1  =3;
D1  =4;
D2  =5;
C2  =6;
B2  =7;
A2  =8;
E1  =9;
F1  =10;
B12 =11;
G1  =12;
G2  =13;
B22 =14;
F2  =15;
E2  =16;

// Matrice dynamique

A0 =full(%zeros(16,16)); 
    // boucle bleu
    A0(A1,B1)    =7;
    
    A0(B1,C1)    =6;
    
    A0(C1,D1)    =4;
    
    A0(D1,D2)    =2;
    
    A0(D2,C2)    =4;
    A0(C2,B2)    = 2;
    A0(B2,B12)    = 0;
    A0(B2,A2)    = 7;
    A0(A2,A1)    = 2;
  
    
    // bloucle noire
    A0(E1,E2)    = 2;
    A0(F1,E1)    = 5;
    A0(B12,F1)    = 3;    
    A0(G1,B12)    = 2;    
    A0(G2,G1)    = 2;
    A0(B22,B2)    = 0;    
    A0(B22,G2)    = 2;    
    A0(F2,B22)    = 3;    
    A0(E2,F2)    = 5;
A1 =full(%zeros(17,17)); 
    
