//**** TP 3 Un problème de Command
// Placement des transitions 
x1 = 1; 
x2 = 2; 
x3 = 3; 
x4 = 4; 
x5 = 5; 
x6 = 6; 
x7 = 7; 
x8 = 8; 
x9 = 9;
 
// Creation de l'espace d'état
// Matrice dynamique 
A = %zeros(9,9); 
 // J'ai inversé les lignes et colonnes
A(x6,x1) = 1; 
A(x7,x1) = 4; 
A(x2,x2) = 2; 
A(x6,x3) = 4; 
A(x7,x3) = 7; 
A(x1,x4) = 1; 
A(x5,x4) = 5; 
A(x8,x4) = 4; 
A(x6,x5) = 6; 
A(x7,x5) = 9; 
A(x1,x5) = 2; 
A(x5,x5) = 6; 
A(x8,x5) = 5; 
A(x5,x7) = 4; 
A(x4,x8) = 4; 
A(x4,x9) = 1;
 
 // Problème résolu avec transposition
A = (full(A))'; 

// Matrice de commande
B = %zeros(9,2);

B(x2,2) = 2;
B(x4,2) = 4;
B(x5,2) = 5;
B(x6,1) = 1;

B = full(B)


// Matice C
C = %zeros(1,9);

C(1,x9)=4;

//******************************      Fonctions de transfert
h_0 = C*B;
h_0 = full(h_0)




