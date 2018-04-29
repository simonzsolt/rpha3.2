Program wsnsel(s1 : string) [menu];


Var
   Line,c,s   : String;
   i,j,k,sc   : Real;
   ss,sline   : String;

Procedure Window(lin, col, h, w, frame, color, shadow : Real; title : String);
Var i : real;
Begin
  ClearBox(lin,col,h,w,color);
  Box(lin,col,h,w,frame);
  For i:=1 to h do Chattr(shadow,lin+i,col+w,2);
  Chattr(shadow,lin+h,col+2,w-2);
  If (Size(title)+2 <= w) and (title<>'') then
    begin
      i:=(w-Size(title))/2;
      Cursor(lin,col+i-1);
      Write(' ',title,' ');
      Chattr(color,lin,col+i-1,Size(title)+2);
    end;
End;


   Begin
     s:=DBN;
     s1:='.N';
     If Filexist(path('sys',5)|s|'.FDT')=0 then Assign('INP',path('sys',5)|s|'.FDT')
                                           Else Assign('INP',path('dbn',10)|s|'.FDT');
     Repeat
       Readln(INP,line);
       s:=Substr(line,1,2);
     Until s='W:';
     line:=substr(line,3,255);
     j:=Size(line)/6;
     If j>1 then
       begin
         i:=1;
         SaveScr(1);
         Window(6,60,4+j,11,1,3,-1,'');
         Readln(Inp,sline);
         ss:=Substr(sline,1,2);
         sline:=Substr(sline,3,255);
         If ss='W:' then
           begin
             Cursor(8+j,61);
             Write('PgDn-More');
             Chattr(4,8+j,61,9);
           end;
         For k:=1 to j do
           begin
             Cursor(7+k,62);
             Write(Substr(Line,(k-1)*6+1,6));
             Chattr(3,7+k,62,7);
           end;
         Repeat
           If (sc=81) and (ss='W:') then
             begin
               line:=sline;
               s:=ss;
               Readln(Inp,sline);
               ss:=Substr(sline,1,2);
               sline:=substr(sline,3,255);
               j:=Size(line)/6;
               i:=1;
               Page(1);
               Window(6,60,4+j,11,1,3,-1,'');
               If ss='W:' then
                 begin
                   Cursor(8+j,61);
                   Write('PgDn-More');
                   Chattr(4,8+j,61,9);
                 end;
               For k:=1 to j do
                 begin
                   Cursor(7+k,62);
                   Write(Substr(Line,(k-1)*6+1,6));
                   Chattr(3,7+k,62,7);
                 end;
             end;
           Cursor(7+i,62);
           Chattr(0,7+i,62,7);
           sc:=KbdKey(c);
           Cursor(7+i,62);
           Chattr(3,7+i,62,7);
           Case sc of
             71 : {home}  i:=1;
             72 : {up}    If i>1 then i:=i-1 else i:=j;
             80 : {down}  If i<j then i:=i+1 else i:=1;
             79 : {end}   i:=j;
           end;
         Until (c=Chr(13)) or (c=chr(27));
         If c=chr(13) then
           begin
             sc:=worksheet(substr(line,6*(i-1)+1,6));
             s1:='.N';
           end
         else s1:=' ';
       end;
   End.
