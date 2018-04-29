Program CENTER(s1 : String; lw, occ : Real; s2 : String) [FORMAT];
Var  sp255 : String;
Begin
  s2:='';
  sp255:='                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'                                                  ';
  sp255:=sp255|'     ';
  If (s1<>'') then
    begin
      If Size(s1)>lw then s2:=Substr(s1,1,lw)
                     else
                       begin
                         s2:=Substr(sp255,1,(lw-Size(s1))/2)|s1;
                         s2:=s2|Substr(sp255,1,lw-Size(s2));
                       end;
    end;
End.