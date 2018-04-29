program book (s1:string; lw,occ: real; s2:string) [FORMAT];
   var j,m,n,z2: real;
       z0,z1,z3,w0,w1,w2,w3,w4,wk,key,key1: string;

   procedure cim;
     begin
       s2:=field(fieldn(122,1));
       if size(s2)<>0 then s2:='<MI>'|s2|'<D>' else
                           s2:='<MI>'|field(fieldn(121,1))|'<D>';
       w3:=field(fieldn(131,1));
       if size(w3)=0 then w3:='***';
       w2:=field(fieldn(132,1)); wk:='';
       if substr(w2,size(w2),1)='?' then begin
           w2:=substr(w2,1,size(w2)-2); wk:=' ?'; end;
       if substr(w2,3,1)='.' then begin
          if size(w2)=7 then w2:=substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
          if size(w2)=28 then w2:='fin du '|substr(w2,1,2)|'ÆMDSUØe<D>, dÇbut du '|substr(w2,16,2)|'ÆMDSUØe<D> siäcles' else
          case substr(w2,9,4) of
            'm†so': w2:='2ÆMDSUØme<D> moitiÇ du '|substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
            'vÇge': w2:='fin du '|substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
            'kîze': w2:='milieu du '|substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
            'elej': w2:='dÇbut du '|substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
            'elsì': w2:='1ÆMDSUØre<D> moitiÇ du '|substr(w2,1,2)|'ÆMDSUØe<D> siäcle';
          end;
        end;
       if w2='16-17. sz.' then w2:='16ÆMDSUØe<D>--17ÆMDSUØe<D> siäcles';
       if substr(w2,7,6)='s Çvek' then w2:='les '|substr(w2,1,4);
       if substr(w2,5,1)='-' then j:=11 else j:=6;
       case substr(w2,j,4) of
         'elìt': w2:='a<->vant '|substr(w2,1,j-2);
         'ut†n': w2:='a<->präs '|substr(w2,1,j-2);
         'kîrÅ': w2:='en<->vi<->ron '|substr(w2,1,j-2);
       end;
       w2:=w2|wk;
       if size(w2)=0 then w2:=', ***' else w2:=', '|w2;
       w4:=substr(field(fieldn(142,1)),1,1);
       case w4 of
         'p': w4:=' {protestant}';
         'e': w4:=' {lu<->thÇ<->rien}';
         'r': w4:=' {cal<->vi<->nis<->te}';
         'm': w4:=' {mu<->sul<->man}';
         'v': w4:=' {pro<->fa<->ne}';
         'k': w4:=' {ca<->tho<->li<->que}';
         'u': w4:=' {u<->ni<->tai<->re}';
         's': w4:=' {ju<->da<->ã<->sant}';
       end;
       w0:=substr(z1,11,4);
       j:=record(n);
       z0:=substr(field(fieldn(z2,occ-1)),1,11);
       if z0=substr(s1,9,11) then begin
         s2:=''; w1:=''; w2:=''; w3:=''; w4:='';
       end;
       if w0<>'' then begin
         while substr(w0,1,1)='0' do w0:=substr(w0,2,3);
         if w1='' then w0:='p. '|w0 else w0:=' p. '|w0;
         if substr(z1,16,1)='A' then w0:=w0|'ÆMDSUØr<D>';
         if substr(z1,16,1)='B' then w0:=w0|'ÆMDSUØv<D>';
       end;
     end;

procedure torzs;
  begin
    j:=nxtpost;
    if record(posting('MFN'))=0 then 
    if (size(field(fieldn(55,1)))>0) and (w1<>'') then w1:=w1|', [Çd. fac-similÇ]';
    if w1<>'' then w1:=w1|')';
    case val(substr(s1,9,1)) of
     1: cim; 
     2: begin cim; if size(s2)>0 then s2:=s2|'..., '; s2:=s2|w3; end;
    end;
    s2:=s2|w2|w4|w1|w0;
  end;

 begin {main}
   s2:=''; n:=val(substr(s1,1,4));
   z2:=val(substr(s1,6,2));
   m:=val(substr(s1,9,2));
   z1:=substr(s1,12,size(s1)-11);
   if (occ>0) and (occ<=nocc(z2)) then begin
     case m of
       18: begin key:='MKEVB1-'; w1:='(S '; end;
       19: begin key:='MKEVB0-'; w1:='(H '; end;
       27: begin key:='RMG-'   ; w1:='(HH '; end;
       28: begin key:='RMNY-'  ; w1:='(RMNy '; end;
       29: begin key:='RMK1-'  ; w1:='(RMK I '; end;
     end;
     z3:=substr(z1,5,1);
     key:=key|substr(z1,1,4); key1:=key;
     if z3='/' then key:=key|substr(z1,6,1); 
     w1:=' '|w1|encint(val(substr(z1,1,4)),0);
     if z3='/' then w1:=w1|substr(z1,5,2); 
     if z3='-' then w1:=w1|'/'|substr(z1,6,1);
     if substr(z1,7,1)<>' ' then w1:=w1|substr(z1,7,2);
     if find(key)=0 then torzs
                    else if find(key1)=0 then torzs
                                         else begin 
                                         s2:='*-*-*-*';
                                         j:=record(n);
                                         end;
   end;
end.