Program FDSPL(s1 : String; lw, occ : Real; s2 : String) [FORMAT];
Var  sp255 : String;
     sbe   : String;
Begin
  s2:='';
  sp255:='                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'     ';
  If (s1<>'') and FilExist(s1)=0 then
    begin
      Assign('INP',s1);
      Repeat
        Readln(Inp,sbe);
        If Size(sbe) > lw Then s2:=s2|Substr(sbe,1,lw)
                          Else s2:=s2|sbe|Substr(sp255,1,lw-Size(sbe));
      Until Eof(Inp);
    end
  Else s2:='File Not Found !';
End.