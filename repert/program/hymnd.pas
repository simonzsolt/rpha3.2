program hymn (s1:string; lw,occ: real; s2:string) [FORMAT];

var p: real;
    e,f: string;

begin
  if substr(s1,1,2)='AH' then
    begin
      s2:=e|'AH,'|f|' t. ';
      p:=position(s1,',',4);
      s2:=s2|substr(s1,4,p-3)|' p. '|substr(s1,p+1,255);
    end;
  if substr(s1,1,2)='CH' then s2:=e|'Ch'|f|' #'|substr(s1,4,255);
end.
