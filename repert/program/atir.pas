program atir;
var k,p,r,e,s,u,m,v,x,j,n: real; a,b,c,w: string;

begin
    clear;
    write('   kezd“ incipit: '); readln(a); uc(a); a:='INC='|a;
    write('befejez“ incipit: '); readln(b); uc(b); b:='INC='|b;
    if dbn<>'DATA' then open('DATA');
    while a<=b do begin
      j:=find(a);
      cursor(4,1); clearln; writeln(a);
      while nxtpost>=0 do
          begin
            n:=posting('MFN'); j:=record(n);
            k:=0; p:=0; r:=0; e:=0; s:=0; u:=0; m:=0; v:=0; x:=0;
            c:=field(fieldn(48,1)); w:='';
            j:=flddel(fieldn(48,1));
            while size(c)>0 do begin
              case substr(c,1,1) of
                'k': k:=k+1;
                'p': p:=p+1;
                'r': r:=r+1;
                'e': e:=e+1;
                's': s:=s+1;
                'u': u:=u+1;
                'm': m:=m+1;
                'v': v:=v+1;
                'x': x:=x+1;
              end;
              c:=substr(c,2,255);
            end;
            if k>0 then w:=w|'^k'|encint(k,1);
            if p>0 then w:=w|'^p'|encint(p,1);
            if r>0 then w:=w|'^r'|encint(r,1);
            if e>0 then w:=w|'^e'|encint(e,1);
            if s>0 then w:=w|'^s'|encint(s,1);
            if u>0 then w:=w|'^u'|encint(u,1);
            if m>0 then w:=w|'^m'|encint(m,1);
            if v>0 then w:=w|'^v'|encint(v,1);
            if x>0 then w:=w|'^x'|encint(x,1);
            if size(w)>0 then begin j:=fldadd(48,1,w); update; end;
            j:=find(a); j:=nxtpost;
            while posting('MFN')<>n do j:=nxtpost;
          end;
      a:=nxtterm;
    end;
end.
