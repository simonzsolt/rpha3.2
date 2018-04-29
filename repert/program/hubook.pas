program book (s1:string; lw,occ: real; s2:string) [FORMAT];
   var j,m,n: real;
       z0,z1,w0,w1,w2,w3,w4,wk,key,key1: string;

   procedure cim;
     begin
       s2:=field(fieldn(122,1));
       if size(s2)=0 then s2:=field(fieldn(121,1));
       w3:=field(fieldn(131,1));
       if size(w3)=0 then w3:='***';
       w2:=field(fieldn(132,1)); wk:='';
       if size(w2)=0 then w2:=', ***' else w2:=', '|w2;
       w4:=substr(field(fieldn(142,1)),1,1);
       case w4 of
         'p': w4:=' {protest ns}';
         'e': w4:=' {evang‚likus}';
         'r': w4:=' {reform tus}';
         'm': w4:=' {muzulm n}';
         'v': w4:=' {vil gi}';
         'k': w4:=' {katolikus}';
         'u': w4:=' {unit rius}';
         's': w4:=' {szombatos}';
       end;
       w0:=substr(z1,18,4);
       j:=record(n); j:=val(substr(z1,2,2));
       z0:=substr(field(fieldn(j,occ-1)),1,11);
       if z0=substr(z1,5,11) then begin
         s2:=''; w1:=''; w2:=''; w3:=''; w4:='';
       end;
       if w0<>'' then begin
         while substr(w0,1,1)='0' do w0:=substr(w0,2,3);
         if w1='' then w0:='p. '|w0 else w0:=' p. '|w0;
       end;
     end;

procedure torzs;
  begin
    j:=nxtpost;
    if record(posting('MFN'))=0 then 
    if (size(field(fieldn(55,1)))>0) and (w1<>'') then w1:=w1|', [fakszimile kiad s]';
    if w1<>'' then w1:=w1|')';
    case val(substr(z1,5,1)) of
     1: cim; 
     2: begin cim; if size(s2)>0 then s2:=s2|'..., '; s2:=s2|w3; end;
    end;
    s2:=s2|w2|w4|w1|w0;
  end;

 begin {main}
   s2:=''; n:=val(substr(s1,1,4)); z1:=substr(s1,5,256);
   if (occ>0) and (occ<=nocc(val(substr(z1,2,2)))) then begin
     m:=val(substr(z1,5,2));
     case m of
       18: begin key:='MKEVB1-'; w1:='(S '; end;
       19: begin key:='MKEVB0-'; w1:='(H '; end;
       27: begin key:='RMG-'   ; w1:='(HH '; end;
       28: begin key:='RMNY-'  ; w1:='(RMNy '; end;
       29: begin key:='RMK1-'  ; w1:='(RMK I '; end;
     end;
     key:=key|substr(z1,8,4); key1:=key;
     if substr(z1,12,1)='/' then key:=key|substr(z1,13,1); 
     w1:=' '|w1|encint(val(substr(z1,8,4)),0);
     if substr(z1,12,1)='/' then w1:=w1|substr(z1,12,2); 
     if substr(z1,12,1)='-' then w1:=w1|'/'|substr(z1,13,1);
     if substr(z1,14,1)<>' ' then w1:=w1|substr(z1,14,2);
     if find(key)=0 then torzs
                    else if find(key1)=0 then torzs
                                         else begin 
                                         s2:='*-*-*-*';
                                         j:=record(n);
                                         end;
   end;
end.