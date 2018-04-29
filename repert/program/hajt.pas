program hajt;
var a,b,j,m,o: real; e,s,v,w,z,key,key1: string;
   
   procedure cim;
     begin
       w:=substr(field(fieldn(142,1)),1,1);
       if w='' then w:='x';
       j:=record(m);
       z:=substr(field(fieldn(b,o-1)),1,11);
       if z=substr(field(fieldn(b,o)),1,11) then a:=1;
     end;

   procedure cikl;
     begin
       while o<=nocc(b) do begin
         a:=0;
         z:=substr(field(fieldn(b,o)),1,2);
         case z of
           '18': key:='MKEVB1-';
           '19': key:='MKEVB0-';
           '27': key:='RMG-';
           '28': key:='RMNY-';
           '29': key:='RMK1-';
         end;
         key:=key|substr(field(fieldn(b,o)),4,4); key1:=key;
         if substr(field(fieldn(b,o)),8,1)='/' then
            key:=key|substr(field(fieldn(b,o)),9,1); 
         if find(key)=0 then begin
                               j:=nxtpost;
                               if record(posting('MFN'))=0 then cim;
                             end
                        else if find(key1)=0 then begin
                               j:=nxtpost;
                               if record(posting('MFN'))=0 then cim;
                             end
                                                           else w:='x';
         if a=0 then s:=s|w else a:=0;
         o:=o+1;
       end;
     end;

begin
    clear;
    write('   kezd“ incipit: '); readln(e); uc(e); e:='INC='|e;
    write('befejez“ incipit: '); readln(v); uc(v); v:='INC='|v;
    if dbn<>'DATA' then open('DATA');
    while e<=v do begin
      j:=find(e);
      cursor(4,1); clearln; writeln(e);
      while nxtpost>=0 do
          begin
            m:=posting('MFN'); j:=record(m); s:='';
            b:=52; o:=1; cikl;
            b:=51; o:=1; cikl;
            j:=record(m); j:=flddel(fieldn(48,1));
            j:=fldadd(48,1,s); update;
            j:=find(e); j:=nxtpost;
            while posting('MFN')<>m do j:=nxtpost;
          end;
      e:=nxtterm;
    end;
end.
