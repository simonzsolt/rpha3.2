program hlist;
var n,o: real; e,v,s91,s101,s111: string;
begin
    clear;
    e:='MKEVB1';
    v:='MKEVB2';
    assign('out','c:\poem\wrk\slista.doc');
    if dbn<>'ALAP' then open('ALAP');
    while e<=v do begin 
      n:=find(e);
      cursor(4,1); clearln; writeln(e); 
      while nxtpost>=0 do
          begin
            n:=record(posting('MFN'));
            if n=0 then begin
              s91:=field(fieldn(91,1));
              s101:=field(fieldn(101,1));
              s111:='-'|field(fieldn(111,1));
              writeln(out,s101|s111|'     '|s91);
              s91:=field(fieldn(112,1));
              if s91<>'' then writeln(out,'szerz“: '|s91);
              s91:=field(fieldn(113,1));
              if s91<>'' then writeln(out,'ford¡t¢: '|s91);
              s91:=field(fieldn(121,1));
              if s91<>'' then writeln(out,'c¡m_£j: '|s91);
              s91:=field(fieldn(122,1));
              if s91<>'' then writeln(out,'c¡m_bet–h¡v: '|s91);
              s91:=field(fieldn(131,1));
              if s91<>'' then writeln(out,'nyomdahely: '|s91);
              s91:=field(fieldn(132,1));
              if s91<>'' then writeln(out,'id“pont: '|s91);
              s91:=field(fieldn(133,1));
              if s91<>'' then writeln(out,'nyomd sz: '|s91);
              s91:=field(fieldn(141,1));
              if s91<>'' then writeln(out,'m–faj: '|s91);
              s91:=field(fieldn(142,1));
              if s91<>'' then writeln(out,'felekezet: '|s91);
              s91:=field(fieldn(151,1));
              if s91<>'' then writeln(out,'v ros: '|s91);
              s91:=field(fieldn(152,1));
              if s91<>'' then writeln(out,'k”nyvt r: '|s91);
              s91:=field(fieldn(153,1));
              if s91<>'' then writeln(out,'gy–jtem‚ny: '|s91);
              s91:=field(fieldn(154,1));
              if s91<>'' then writeln(out,'k”tet jelzet: '|s91);
              s91:=field(fieldn(155,1));
              if s91<>'' then writeln(out,'sz”veges felold sa: '|s91);
              s91:=field(fieldn(156,1));
              if s91<>'' then writeln(out,'rakt ri jelzet: '|s91);
              s91:=field(fieldn(160,1));
              if s91<>'' then writeln(out,'megjegyz‚s: '|s91);
              writeln(out,'');
            end;
          end;
      e:=nxtterm;
    end;
end.