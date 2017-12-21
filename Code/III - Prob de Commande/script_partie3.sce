//**** TP 3 Un probl�me de Command
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
 
// Creation de l'espace d'�tat
// Matrice dynamique 
A = %zeros(9,9); 
 // J'ai invers� les lignes et colonnes
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
 
 // Probl�me r�solu avec transposition
A = (full(A))'; 

// Matrice de commande
B = %zeros(9,2);

B(x2,2) = 2;
B(x4,2) = 4;
B(x5,2) = 5;
B(x6,1) = 1;

B = full(B);


// Matice C
C = %zeros(1,9);

C(1,x9)=4;

//******************************      Fonctions de transfert
H_0 = C*B; // Fonctionde transfert pour i=0

n = 5;
H = %zeros(n,2);
for i = 1:n
    H(i,:) = C*(A^i)*B;    
end
H= [H_0 ; H]
H = full(H);

// **************************  R�ponsedu syst�me pour une commande donn� :
u = [2 5 14 14 16 27;
     0 3 11 17 20 23];
 Y = [];
for i = 1:n+1
    
    Y = [Y H(i,:)*u(:,i)];    
end

