Program DEKOD(s1 : String; lw, occ : Real; s2 : String) [FORMAT];

Var ss : String;
    ks : Real;
    Fn : String;
    s  : String;

Begin
  s2:='';
  fn:=Substr(s1,1,Position(s1,'**',1)-1);
  s :=Substr(s1,Position(s1,'**',1)+2,255);
  If (s1<>'') and (fn<>'') and (s<>'') and FilExist(fn)=0 then
    begin
      Assign('INP',fn);
      uc(s);
      Repeat
        Readln(inp,ss);
        ks:=Position(ss,'-',1);
      Until (eof(inp)) or (Substr(ss,1,ks-1)=s);
      If Substr(ss,1,ks-1)=s then s2:=Substr(ss,ks+1,255)
                             else s2:='Ismeretlen kod';
    end
  Else s2:='File Not Found';
End.
