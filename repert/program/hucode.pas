program code (s1:string; lw,occ: real; s2:string) [FORMAT];
  begin
      s2:='';
      case  substr(s1,1,3) of
       'v22':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='';
               2: s2:='nem kÇsìbb, mint ';
               3: s2:='nem kor†bban, mint ';
               4: s2:='kb. ';
               5: s2:='kor†bban, mint kb. ';
               6: s2:='';
               7: s2:='vagy ';
             end;
       'v23':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='szîvegvers. ';
               2: s2:='Çnekvers. ';
               3: s2:='bizonytalan, hogy ÇnekeltÇk-e. ';
               4: s2:='Szîvegvers. ';
               5: s2:='ênekvers. ';
               6: s2:='Bizonytalan, hogy ÇnekeltÇk-e. ';
             end;
       'v24':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Szerezte';
               2: s2:='';
               3: s2:='A korabeli hagyom†ny szerint szerezte';
               4: s2:='A modern kutat†s szerint szerezte';
               5: s2:='A kîtet szign†l†sa szerint szerezte';
               6: s2:='Az anagramma felold†sa szerint szerezte';
             end;
       'v30':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='A kolofon t†jÇkoztat a szereztetÇs kîrÅlmÇnyeirìl';
               2: s2:='Nincs kolofon';
               3: s2:='A kolofon lÇte bizonytalan';
             end;
       'v33':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Akrosztichonja';
               2: s2:='Nincs akrosztichonja';
               3: s2:='Az akrosztichon lÇte bizonytalan';
             end;
       'v41':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='A szîveg teljes ';
               2: s2:='A szîveg tîredÇk ';
               3: s2:='A szîveg tîredÇk, de ismerjÅk a teljes terjedelmet, ';
             end;
       'v44':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Sz¢tagsz†ml†l¢, izo-strofikus, ';
               3: s2:='Bizonytalan, hogy vers vagy pr¢za, ';
               4: s2:='Bizonytalan verselÇsß, idìmÇrtÇkes, ';
               5: s2:='Bizonytalan verselÇsß, sz¢tagsz†ml†l¢, izostofikus, ';
               6: s2:='Hexameter ';
               7: s2:='Disztichon ';
               8: s2:='IdìmÇrtÇkes, de nem hexameter vagy disztichon, ';
              10: s2:='Hangs£lyos, nem strofikus, nem sz¢tagsz†ml†l¢ r°mtelen, ';
              11: s2:='Bizonytalan, hogy vers vagy ritmikus pr¢za, ';
              12: s2:='Verssorok Çs pr¢za v†ltakoz†sa, ';
              15: s2:='V†ltakoz¢ metrum£ ';
              16: s2:='Sz¢tagsz†ml†l¢ tendenci†t mutat¢, ';
              17: s2:='Sz¢tagsz†ml†l¢, ';
              18: s2:='Sz¢sz†ml†l¢, ';
              19: s2:='Szekvenci†t imit†l¢, ';
              30: s2:='N¢tajelzÇs, a metruma kikîvetkeztetett, ';
             end;
      end;
  end.