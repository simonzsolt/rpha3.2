program syll(s1:string);
    var j,k,l,m,p:real; n,o,s,z:string;

  procedure mess(par:string);
    begin
     clearmsg; cursor(23,4); writeln(par);
    end;

  procedure ujkep;
    begin
     mess('more ...'); n:=inkey; if n='x' then o:=n; cleardata; l:=0;
    end;

  procedure ujsor;
    begin
     j:=0; if l=21 then ujkep; l:=l+1; cursor(l,40);
    end;

  procedure blokk;
    begin
     write('�'); j:=j+1; if j=30 then ujsor; p:=0;
    end;

begin
  s:=' ';
  if dbn<>'DATA' then open('DATA');
  while (z<>'x') and (s<>'x') do
  begin
    cleardata; mess('prefix:');
    cursor(23,12); readln(s); if s<>'x' then
    begin
      UC(s); o:=s; l:=1; k:=0; p:=0; j:=0; m:=find(s);
      if size(s)=0 then mess('Inverted file defect') else
      begin
        n:=o;
        while (substr(s,1,size(o))=o) and (n<>'x') do
        begin
          cursor(l,5); write(s); cursor(l,40);
          while nxtpost>=0 do begin k:=k+1; p:=p+1; if p=5 then blokk; end;
          write('�'); p:=0; j:=0; cursor(l,76); writeln(encint(k,4)); k:=0;
          if n<>'x' then begin s:=nxtterm; ujsor; end;
        end;
      end;
      if n<>'x' then z:=inkey;
    end;
  end;
end.