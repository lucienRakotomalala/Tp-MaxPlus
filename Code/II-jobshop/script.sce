// 
AM1 = 1;
AM2 = 2;
BM1 = 3;
BM2 = 4;

// AM2 > AM1 > BM1 > BM2

A1 = full(%zeros(4,4));
A1(AM1,AM1) = 10 ;
A1(AM1,BM1) = 7;
A1(AM1,BM2) = 9;

A1(AM2,AM1) = 4;
A1(AM2,BM2) = 3;

A1(BM1,AM1) = 14;
A1(BM1,BM1) = 11;
A1(BM1,BM2) = 13;

A1(BM2,AM1) = 21;
A1(BM2,BM1) = 18;
A1(BM2,BM2) = 20;

// AM2 | BM1 > BM2 | AM1
A2 = full(%zeros(4,4));
A2(AM1,AM1) = 11 ;
A2(AM1,BM2) = 10 ;

A2(AM2,AM1) = 4 ;
A2(AM2,BM2) = 3 ;

A2(BM1,AM1) = 4 ;
A2(BM1,BM2) = 3 ;

A2(BM2,AM1) = 11 ;
A2(BM2,BM2) = 10 ;

// BM1 > BM2 > AM2 > AM1
A3 = full(%zeros(4,4));
A3(AM1,AM1) =20 ;
A3(AM1,AM2) = 15;
A3(AM1,BM2) = 19;

A3(AM2,AM1) = 14;
A3(AM2,AM2) = 9;
A3(AM2,BM2) = 13;

A3(BM1,AM1) = 4;
A3(BM1,BM2) = 3;

A3(BM2,AM1) = 11;
A3(BM2,AM2) = 6;
A3(BM2,BM2) = 10;
