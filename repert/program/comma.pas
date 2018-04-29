program comma (s1:string; lw,occ: real; s2:string) [FORMAT];

var i: real;
    c: string;

begin
i:=1;
s2:='';
while i<=size(s1) do
  begin
    c:=substr(s1,i,1);
    if c<>',' then s2:=s2|c;
    i:=i+1;
  end;
end.
