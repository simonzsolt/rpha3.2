PROGRAM PROG10;
VAR I,J,K,N,RC,L: REAL;
    F,LIN: STRING;

PROCEDURE WRT(I,NL,LW: REAL);
VAR L,LL,RC: REAL;
BEGIN
RC:=FORMAT(LW);
RC:=NXTLINE(LIN); L:=I;
LL:=L+NL-1;
WHILE RC=0 DO
 BEGIN
 CURSOR(L,2);
 IF L>LL THEN RC:=1
         ELSE BEGIN WRITELN(LIN); RC:=NXTLINE(LIN); END;
 L:=L+1;
 END;
END;

Procedure Display;
Begin
CURSOR(2,74); WRITE(I:4);

CLEARBOX(2,2,1,28,2);
GETFMT('MDL,(V70/)');
WRT(2,1,28);

CLEARBOX(5,2,4,78,1);
GETFMT('MDL,V24/');
WRT(5,4,78);

CLEARBOX(11,2,2,78,1);
GETFMT('MDL,V70+|; |/');
WRT(11,2,78);

CLEARBOX(15,2,6,78,1);
GETFMT('MDL,V69/');
WRT(15,6,78);

End;



BEGIN
OPEN('CDS');
I:=0;
CLEAR;
BOX(1,1,3,30,2); BOX(1,71,3,10,1);
BOX(4,1,6,80,1);
CURSOR(4,1);WRITELN('Title: ');
BOX(10,1,4,80,1);
CURSOR(10,1);WRITELN('Authors: ');
BOX(14,1,8,80,2);
CURSOR(14,1);WRITELN('Keywords: ');

REPEAT
I:=I+1;
RC:=RECORD(I);
if rc=0 then   { Record exists }
   begin
   Display;
   CURSOR(23,1); WRITE('N[ext record]  Q[uit]'); F:=INKEY; uc(f);
   end;

UNTIL (F='Q') or (rc<0);
END.
