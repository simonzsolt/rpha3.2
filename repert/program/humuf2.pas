program muf2 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
          48: s2:=s2|'vil gi';
          49: s2:=s2|'hist¢ria';
          50: s2:=s2|'nem hist¢ria';
          51: s2:=s2|'elbesz‚l“';
          52: s2:=s2|'le¡r¢ vagy ‚rtekeze“';
          53: s2:=s2|'mor lis vagy politikai';
          54: s2:=s2|'erotikus';
          56: s2:=s2|'nem fikt¡v';
          57: s2:=s2|'kital lt t”rt‚netmond s';
          58: s2:=s2|'arisztokratikus regiszter';
          59: s2:=s2|'popul ris vagy v g ns';
          61: s2:=s2|'humanista iskolai';
          63: s2:=s2|'udvari';
          64: s2:=s2|'popul ris';
          66: s2:=s2|'humanista iskolai';
          68: s2:=s2|'t”rt‚nelmi';
          69: s2:=s2|'kort rsi tud¢s¡t¢';
          74: s2:=s2|'napt rvers';
          76: s2:=s2|'partimen';
          77: s2:=s2|'embl‚ma';
          78: s2:=s2|'szerelmi k”sz”nt‚s';
          80: s2:=s2|'t”r”k beyt ford¡t sa';
          81: s2:=s2|'aenigma';
          82: s2:=s2|'n“i dal';
          83: s2:=s2|'latrik nus vers';
          84: s2:=s2|'gab';
          86: s2:=s2|'in laudem';
          87: s2:=s2|'heged“s ‚nek';
          88: s2:=s2|'v g ns szat¡ra';
          89: s2:=s2|'politikai propaganda';
          90: s2:=s2|'epistola dedicatoria';
          91: s2:=s2|'tanuls g';
          92: s2:=s2|'id‚zet';
          93: s2:=s2|'sententia';
          95: s2:=s2|'epicedium';
         109: s2:=s2|'halotti';
         115: s2:=s2|'utaz si vers';
         118: s2:=s2|'missilis lev‚l';
         119: s2:=s2|'alba';
         120: s2:=s2|'Horatius-par¢dia';
         121: s2:=s2|'t ncdal';
         127: s2:=s2|'jogszab ly';
         128: s2:=s2|'j t‚k';
         129: s2:=s2|'cs¡zi¢';
         210: s2:=s2|'epigramma';
         211: s2:=s2|'udvari dr ma';
         212: s2:=s2|'mez“gazdas gi k”ltem‚ny';
        end;
end;

begin
  while size(s1)>1 do begin
    s3:=substr(s1,1,3);
    s1:=substr(s1,5,255);
    eset;
    if size(s1)>1 then s2:=s2|' -- ';
  end;
end.
