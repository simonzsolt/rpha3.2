program DBSSEL ( ex : string) [MENU];

{ Select another data base }

Var
   Line,c,s   : String;
   i          : Real;
   sc         : Real;
   rc         : Real;
   m          : Real;
   j          : Real;

Procedure Window(save, lin, col, h, w, frame, color, shadow : Real; title : String);
Var
          i : real;
Begin
  If (save>0) and (save<5) Then SaveScr(save);
  ClearBox(lin,col,h,w,color);
  If (frame>0) and (frame<3) Then Box(lin,col,h,w,frame);
  For i:=1 to h do Chattr(shadow,lin+i,col+w,2);
  Chattr(shadow,lin+h,col+2,w-2);
  If (Size(title)+2 <= w) and (title<>'') then
    begin
      i := (w-Size(title))/2;
      Cursor(lin,col+i-1);
      Write(' ',title,' ');
      Chattr(color,lin,col+i-1,Size(title)+2);
    end;
End;

Function Conv( s : String ) : String;
Var   rs : String;
      ss : String;
Begin
  rs:='';
  Repeat
    ss:=Substr(s,1,6);
    s :=Substr(s,7,60);
    ss:=Substr(ss|'      ',1,6);
    rs:=rs|ss;
  Until s='';
  Conv:=rs;
End;

Begin
  Line:='';
  If Filexist(path('sys',5)|'DBNS.SYS')=0 then
    begin
      Assign('INP',path('sys',5)|'DBNS.SYS/k');
      Readln(INP,c);
      Assign('INP','');
      Line:=c;
    end;
  j:=Val(EncInt(Size(Line)/6,1));
  Window(1,7,63,10,11,1,2,5,'Name(s)');
  Attr(' ',-1,25,1,80);
  Write('  Up/Down -Locate | ENTER -Select | ESC -Quit | INS -Insert | DEL -Delete');
  For i:=1 to 8 do
    begin
      Cursor(7+i,65); Write('³');
    End;
  s:=Line;
  m:=j;
  i:=0;
  Repeat
    Cursor(8+i,66);
    Writeln(Substr(s,i*6+1,6));
    i:=i+1;
  Until (i=m) or (i=8);
  i:=0;
  If m>0 Then i:=1;
  j:=1;
  Repeat
    If m>i+7 Then
      begin
        Cursor(15,64);
        Write(Chr(31));
      end
    Else
      begin
        Cursor(15,64);
        Write(' ');
      end;
    If i>1 Then
      begin
        Cursor(8,64);
        Write(Chr(30));
      end
    Else
      begin
        Cursor(8,64);
        Write(' ');
      end;
    ChAttr(1,7+j,66,6);
    sc:=KbdKey(c);
    ChAttr(2,7+j,66,6);
    Case sc of
      72 : begin
             If j>1 Then j:=j-1
                    Else
                      If i>1 Then
                        begin
                          i:=i-1;
                          Scroll(8,66,8,6,2,-1);
                          Writeln(Substr(s,(i-1)*6+1,6));
                        end;
           end;
      80 : begin
             If i+j-1<m Then j:=j+1;
             If j=9 Then
               begin
                 j:=8;
                 If i+7<m Then
                   begin
                     i:=i+1;
                     Scroll(8,66,8,6,2,1);
                     Writeln(Substr(s,(i+6)*6+1,6));
                   end;
               end;
           end;
      82 : begin
             SaveScr(3);
             Scroll(7+j,66,8-j+1,6,2,-1);
             c:='';
             sc:=Edit(c,6,7+j,66,6,2,' ');
             If (sc=0) and (c<>'') Then
               begin
                 c:=Substr(c|'      ',1,6);
                 s:=Substr(s,1,(i+j-2)*6)|c|Substr(s,(i+j-2)*6+1,Size(s));
                 m:=m+1;
                 If m=1 Then i:=1;
               end
              Else Page(3);
           end;
      83 : begin
             If s<>'' Then
               begin
                 s:=Substr(s,1,(i+j-2)*6)|Substr(s,(i+j-2)*6+7,Size(s));
                 Scroll(7+j,66,8-j+1,6,2,1);
                 c:=Substr(s,(i+6)*6+1,6);
                 Cursor(15,66);
                 Writeln(c);
                 If i+j-1=m Then
                   begin
                     AutoType('!72');
                   end;
                 m:=m-1;
                 If m=0 Then i:=0;
               end;
           end;
    end;
  Until (c=Chr(27)) or (c=Chr(13));
  Page(1);
  Ex:=' ';
  If c=Chr(13) Then
    begin
      c:=Substr(s,(i+j-2)*6+1,6);
      Open(c);
    end;
  If s<>Line Then
    begin
      Assign('OUT',path('sys',5)|'DBNS.SYS/k');
      Writeln(Out,s);
      Assign('OUT','');
    end;
End.
