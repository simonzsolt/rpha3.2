Program NUMBER(s1 : String; lw, occ : Real; s2 : String) [FORMAT];

Begin
  If nocc(val(s1)) >= occ then s2:=EncInt(occ,3)|'. '
                          else s2:='';
End.