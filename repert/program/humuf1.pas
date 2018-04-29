program muf1 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
           1: s2:=s2|'vall sos';
           2: s2:=s2|'hist¢ria';
           3: s2:=s2|'nem hist¢ria';
           4: s2:=s2|'elbesz‚l“';
           5: s2:=s2|'le¡r¢ vagy ‚rtekez“';
           6: s2:=s2|'bibliai';
           8: s2:=s2|'liturgikus vagy paraliturgikus eredet';
           9: s2:=s2|'bibliai';
          10: s2:=s2|'pr‚dik ci¢s ‚nek';
          13: s2:=s2|'zsolt r';
          14: s2:=s2|'jeremi d';
          15: s2:=s2|'r”vid foglalat';
          16: s2:=s2|'himnusz';
          17: s2:=s2|'antifona';
          18: s2:=s2|'szekvencia';
          23: s2:=s2|'dogmatika';
          24: s2:=s2|'alkalmi ‚nek';
          25: s2:=s2|'mindennapi vagy nnepnapi lelki ‚nek';
          26: s2:=s2|'Urvacsora-‚nek';
          27: s2:=s2|'k t‚-‚nek';
          28: s2:=s2|'Szent H roms g-‚nek';
          29: s2:=s2|'Credo magyar zat';
          30: s2:=s2|'Miaty nk-‚nek';
          31: s2:=s2|'T¡zparancsolat-‚nek';
          32: s2:=s2|'h zas‚nek';
          33: s2:=s2|'keresztel‚si ‚nek';
          34: s2:=s2|'b”lcs“dal';
          35: s2:=s2|'temet‚si ‚nek';
          36: s2:=s2|'dics‚ret';
          37: s2:=s2|'h laad¢ ‚nek';
          38: s2:=s2|'k”ny”rg‚s';
          39: s2:=s2|'vall st‚tel';
          40: s2:=s2|'Szentl‚lek invok ci¢';
          41: s2:=s2|'tanuls g';
          42: s2:=s2|'j¢ kereszty‚ni cselekedetre int“ ‚nek';
          43: s2:=s2|'h¡v“k biztat sa';
          44: s2:=s2|'siralom';
          45: s2:=s2|'h¡v“k vigasztal sa';
          47: s2:=s2|'a vil g hi baval¢s g r¢l sz¢l¢ ‚nek';
         100: s2:=s2|'benedicamus';
         102: s2:=s2|'im ds g';
         103: s2:=s2|'muzulm n';
         104: s2:=s2|'szerzetesi regula';
         107: s2:=s2|'hitvita';
         123: s2:=s2|'var zsige';
         124: s2:=s2|'Szent kir ly-himnusz';
         125: s2:=s2|'legenda';
         126: s2:=s2|'M ria-siralom';
         130: s2:=s2|'M ria-‚nek';
         134: s2:=s2|'bibliai vil gkr¢nika';
         200: s2:=s2|'cantio';
         201: s2:=s2|'bibliai dr ma';
         202: s2:=s2|'doxol¢gia';
         203: s2:=s2|'vall sos embl‚ma';
         255: s2:=s2|'Urfelmutat si ‚nek';
         256: s2:=s2|'benedicamus parafr zis';
         257: s2:=s2|'asztali  ld s';
         258: s2:=s2|'nekek ‚neke';
         259: s2:=s2|'£tonj r¢knak ‚neke';
         260: s2:=s2|'rab‚nek';
         300: s2:=s2|'egyh zt”rt‚neti kivonat';
         301: s2:=s2|'k”zel kort rsi';
         302: s2:=s2|'r‚gi';
        end;
end;

begin
  while size(s1)>1 do begin
    s3:=substr(s1,1,3);
    s1:=substr(s1,5,255);
    eset;
    if size(s1)>1 then s2:=s2|' -- ';
  end;
end.
