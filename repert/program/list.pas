program list;
var n,o: real; e,v,s91,s101,s111: string;
begin
    clear;
    e:='RMG';
    v:='RRR';
    assign('out','c:\poem\wrk\lista.doc');
    if dbn<>'ALAP' then open('ALAP');
    while e<=v do begin 
      n:=find(e);
      cursor(4,1); clearln; writeln(e); 
      while nxtpost>=0 do
          begin
            n:=record(posting('MFN'));
            if n=0 then begin
              s101:=field(fieldn(101,1));
              s111:='-'|field(fieldn(111,1));
              writeln(out,s101|s111);
              s91:=field(fieldn(121,1));
              if s91<>'' then writeln(out,'c¡m_£j: '|s91);
              s91:=field(fieldn(122,1));
              if s91<>'' then writeln(out,'c¡m_bet–h¡v: '|s91);
              s91:=field(fieldn(131,1));
              if s91<>'' then writeln(out,'nyomdahely: '|s91);
              s91:=field(fieldn(132,1));
              if s91<>'' then writeln(out,'id“pont: '|s91);
              s91:=field(fieldn(142,1));
              if s91<>'' then writeln(out,'felekezet: '|s91);
              writeln(out,'');
            end;
          end;
      e:=nxtterm;
    end;
end.