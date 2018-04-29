program dalmo;
var j,m: real; e,s,v,z: string;

begin
    clear;
    write('   kezd“ incipit: '); readln(e); uc(e); e:='INC='|e;
    write('befejez“ incipit: '); readln(v); uc(v); v:='INC='|v;
    if dbn<>'ALAP' then open('ALAP');
    while e<=v do begin
      j:=find(e);
      cursor(4,1); clearln; writeln(e);
      while nxtpost>=0 do
          begin
            m:=posting('MFN'); j:=record(m); s:='';
            z:='DAL-CON='|field(fieldn(1,1));
            if find(z)=0 then
               while nxtpost>=0 do
                 if record(posting('MFN'))=0 then
                    s:=s|field(fieldn(1,1))|'%';
            j:=record(m); s:=substr(s,1,size(s)-1);
            j:=fldadd(65,1,s); update;
            j:=find(e); j:=nxtpost;
            while posting('MFN')<>m do j:=nxtpost;
          end;
      e:=nxtterm;
    end;
end.