program rmdt (s1:string; lw,occ: real; s2:string) [FORMAT];
  var k:real;
      p,w:string;
  begin
      s2:='';
      if occ>0 and occ<=nocc(53) then
       begin
         k:=position(s1,'RMDT',1);
         if k>0 then begin s2:=substr(s1,1,k+4);
                           w:=substr(s1,k+5,30);
                           k:=position(w,'SZ',1);
                           if k>0 then begin
                                       w:=substr(w,1,k-1);
                                       p:=' #';
                                       end
                                  else p:=' ';
                           s2:=s2|p|encint(val(w),1);
                     end
         else s2:=s1;
       end;
end.