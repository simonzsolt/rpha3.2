program csere;
var p: real; a,a1,e,i,o: string;
begin
  clear;
  write(' input file: '); readln(i); assign('inp','c:\poem\wrk\'|i);
  write('output file: '); readln(o); assign('out','c:\poem\wrk\'|o);
  readln(INP,a);
  while not EOF(INP) do begin
    e:=a; writeln(e); p:=0;
    readln(INP,a);
    while substr(e,size(e),1)=' ' do e:=substr(e,1,size(e)-1);
    while substr(a,1,1)=' ' do a:=substr(a,2,size(a)-1);
    p:=position('(<[{оп#''/',substr(e,size(e),1),1);
    p:=p+position('.,!:?-@оп>)]}''/',substr(a,1,1),1);
    if (substr(e,size(e)-3,4)='<MI>') or (substr(e,size(e)-3,4)='<MB>') or (substr(e,size(e)-2,3)='<D>') then p:=p+1;
    if substr(a,1,2)='--' then a:=' '|a;
    write(OUT,e);
    if p<1 then write(OUT,' ');
  end;
  write(OUT,a);
end.
