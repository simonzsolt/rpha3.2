program code (s1:string; lw,occ: real; s2:string) [FORMAT];
  begin
      s2:='';
      case  substr(s1,1,3) of
       'v22':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='en ';
               2: s2:='non post�rieurement � ';
               3: s2:='non ant�rieurement � ';
               4: s2:='environ ';
               5: s2:='avant environ ';
               6: s2:='entre ';
               7: s2:='en ';
             end;
       'v23':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='non chant�. ';
               2: s2:='chant�. ';
               3: s2:='probablement chant�. ';
               4: s2:='Non chant�. ';
               5: s2:='Chant�. ';
               6: s2:='Probablement chant�. ';
             end;
       'v24':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Sign� par';
               2: s2:='';
               3: s2:='Attribu� par la post�rit� imm�diate �';
               4: s2:='Attribu� par la post�rit� tardive �';
               5: s2:='Sign� au niveau du recueil par';
               6: s2:='Sign� anagrammatiquement par';
             end;
       'v30':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Colophon registrant les circonstances de la composition';
               2: s2:='Sans colophon';
               3: s2:='Colophon douteux';
             end;
       'v33':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Acrostiche';
               2: s2:='Sans acrostiche';
               3: s2:='Acrostiche douteux';
             end;
       'v41':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Texte int�gral ';
               2: s2:='Texte fragmentaire ';
               3: s2:='Texte fragmentaire mais l''�tendue du texte int�gral est connue, ';
             end;
       'v44':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='M�tre strophique syllabo-tonique, ';
               3: s2:='M�tre probablement prosa�que mais traduit de vers, ';
               4: s2:='M�tre quantitatif impr�cis, ';
               5: s2:='M�tre strophique tonique mais non syllabique, ';
               6: s2:='Hexam�tre ';
               7: s2:='Distique ';
               8: s2:='M�tre quantitatif autre que l''hexam�tre et le distique, ';
              10: s2:='M�tre tonique non strophique, non syllabique mais avec des rimes, ';
              11: s2:='M�tre probablement prosa�que mais rythmique, ';
              12: s2:='M�tre en vers et prose alternativement, ';
              15: s2:='M�tre altern� ';
              16: s2:='M�tre � tendence syllabique, ';
              17: s2:='M�tre syllabique, ';
              18: s2:='M�tre bas� sur le nombre des mots, ';
              19: s2:='M�tre imitant celui des s�quences victoriennes, ';
              30: s2:='M�tre strophique syllabo-tonique (d''apr�s une r�f�rence m�lodique), ';
             end;
      end;
  end.