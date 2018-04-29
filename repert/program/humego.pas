program mego (s1:string; lw,occ: real; s2:string) [FORMAT];
var i,p,e,r,m,v,k,u,s,x: real; f1,f2: string;
begin
  i:=0; s2:=''; p:=0; e:=0; r:=0; m:=0; v:=0; k:=0; u:=0; s:=0; x:=0;
    while size(s1)>0 do begin
    s1:=substr(s1,2,256); i:=i+1;
    f1:=substr(s1,1,1); f2:='';
    s1:=substr(s1,2,256);
    while (substr(s1,1,1)<>'^') and (size(s1)>0) do begin
      f2:=f2|substr(s1,1,1);
      s1:=substr(s1,2,256);
    end;
    case f1 of
      'p': p:=val(f2);
      'e': e:=val(f2);
      'r': r:=val(f2);
      'm': m:=val(f2);
      'v': v:=val(f2);
      'k': k:=val(f2);
      'u': u:=val(f2);
      's': s:=val(f2);
      'x': x:=val(f2);
    end;
  end;
  if p+e+r+m+v+k+u+s+x>1 then begin
    s2:='A verset tartalmaz¢ forr sok k”zl:';
    if k>0 then begin s2:=s2|' '|encint(k,1)|' katolikus';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if p>0 then begin s2:=s2|' '|encint(p,1)|' protest ns';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if e>0 then begin s2:=s2|' '|encint(e,1)|' evang‚likus';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if r>0 then begin s2:=s2|' '|encint(r,1)|' reform tus';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if u>0 then begin s2:=s2|' '|encint(u,1)|' unit rius';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if s>0 then begin s2:=s2|' '|encint(s,1)|' szombatos';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if m>0 then begin s2:=s2|' '|encint(m,1)|' muzulm n';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if v>0 then begin s2:=s2|' '|encint(v,1)|' vil gi';
                   if i>1 then begin s2:=s2|','; i:=i-1; end;
                 end;
    if x>0 then begin s2:=s2|' '|encint(x,1)|' nem meghat rozott';
                   if x>1 then s2:=s2|'s';
                 end;
    s2:=s2|'.';
  end;
end.