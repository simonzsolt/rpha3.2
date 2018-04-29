program metr (s1:string; lw,occ: real; s2:string) [FORMAT];

var k: real;
    r,q,t: string;

begin
    s2:=''; occ:=0; q:='®MDSD¯'; t:='<D>';
    while occ<nocc(45) do begin
      occ:=occ+1; s1:=field(fieldn(45,occ));
      k:=position('ABCDEFGHIJKLMNOPQRSTUVZXY',substr(s1,1,1),1);
      r:=field(fieldn(163,1));
      if r='' then r:='-' else r:=substr(r,2*occ-1,1);
      if k>0 and r='-' then s2:=s2|substr('abcdefghijklmnopqrstuvzxy',k,1)
                       else s2:=s2|substr(s1,1,1);
      k:=size(s1);
      if k>=4 then s2:=s2|q|encint(val(substr(s1,3,2)),0);
      if k>4  then s2:=s2|'('|encint(val(substr(s1,5,2)),0);
      if k>4  then s2:=s2|','|encint(val(substr(s1,7,2)),0);
      if k>8  then s2:=s2|','|encint(val(substr(s1,9,2)),0);
      if k>10 then s2:=s2|','|encint(val(substr(s1,11,2)),0);
      if k>4  then s2:=s2|')'|t; if k=4 then s2:=s2|t;
      if occ<nocc(45) then s2:=s2|', ';
     end;
end.
