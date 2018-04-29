program PFTSEL ( ex : string) [MENU];

{Select or edit Display format(s) }

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
  s:=DBN;
  If Filexist(path('sys',5)|s|'.FDT')=0 then Assign('INP',path('sys',5)|s|'.FDT/k')
                                        Else Assign('INP',path('dbn',10)|s|'.FDT/k');
  Repeat
    Readln(INP,c);
    s:=Substr(c,1,2);
  Until s='F:';
  c:=Substr(c,3,60);
  Line:=Conv(c);
  Repeat
    Readln(Inp,c);
    s:=Substr(c,1,2);
    If s='F:' Then
      begin
        c:=Substr(c,3,60);
        Line:=Line|Conv(c);
      end;
  Until s='S:';
  Assign('INP','');
  j:=Size(Line)/6;
  If j>1 then
    begin   {   10 3}
      Window(1,7,63,10,11,1,2,5,'Formats');
      Attr(' ',-1,25,1,80);
      Write('Up/Down -Locate | ENTER -Select | ESC -Quit | SPACE BAR -Edit the last selected');
      For i:=1 to 8 do
        begin
          Cursor(7+i,65); Write('³');
        End;
      s:=Line;
      m:=j;
      i:=1;
      Repeat
        Cursor(7+i,66);
        Writeln(Substr(s,(i-1)*6+1,6));
        i:=i+1;
      Until (i=m+1) or (i=9);
      i:=i-1;
      j:=1;
      Repeat
        If m>i Then
          begin
            Cursor(15,64);
            Write(Chr(31));
          end
        Else
          begin
            Cursor(15,64);
            Write(' ');
          end;
        If i>8 Then
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
                          If i>8 Then
                            begin
                              i:=i-1;
                              Scroll(8,66,8,6,2,-1);
                              Writeln(Substr(s,(i-8)*6+1,6));
                            end;
               end;
          80 : begin
                 rc:=m;
                 If m>8 Then rc:=8;
                 If j<rc Then j:=j+1
                         Else
                           If i<m Then
                             begin
                               i:=i+1;
                               Scroll(8,66,8,6,2,1);
                               Writeln(Substr(s,(i-1)*6+1,6));
                             end;
               end;
        end;
      Until (c=Chr(27)) or (c=Chr(13)) or (c=' ');
      Page(1);
      Ex:=' ';
      If c=' ' Then Ex:='.F';
      If c=Chr(13) Then
        begin
          rc:=i-8;
          If rc<0 Then rc:=0;
          c:=Substr(s,(rc+j-1)*6+1,6);
          GETFMT('@'|c);
        end;
    end
  Else ex:='.F';
End.
