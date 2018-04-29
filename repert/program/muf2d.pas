program muf2 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
          48: s2:=s2|'poŠme profane';
          49: s2:=s2|'pr‚sent‚ comme histoire';
          50: s2:=s2|'non pr‚sent‚ comme histoire';
          51: s2:=s2|'narratif';
          52: s2:=s2|'descriptif ou d‚lib‚ratif';
          53: s2:=s2|'moral ou politique';
          54: s2:=s2|'‚rotique';
          56: s2:=s2|'non fictif';
          57: s2:=s2|'romanesque ou fictif';
          58: s2:=s2|'du registre aristocratisant';
          59: s2:=s2|'du registre popularisant ou vagant';
          61: s2:=s2|'du registre humaniste ou scolaire';
          63: s2:=s2|'du registre aristocratisant';
          64: s2:=s2|'du registre popularisant ou vagant';
          66: s2:=s2|'du registre humaniste ou scolaire';
          68: s2:=s2|'relatant des ‚v‚nements d''un pass‚ lointain';
          69: s2:=s2|'relatant des ‚v‚nements d''un pass‚ imm‚diat';
          74: s2:=s2|'du calendrier';
          76: s2:=s2|'un tenson';
          77: s2:=s2|'embl‚matique';
          78: s2:=s2|'saluant une dame';
          80: s2:=s2|'traduit d''un beyt turque';
          81: s2:=s2|'‚nigmatique';
          82: s2:=s2|'une chanson de femme';
          83: s2:=s2|'satyrique ou os‚';
          84: s2:=s2|'oriental';
          85: s2:=s2|'didactique, traitant l''amour';
          86: s2:=s2|'exaltant la vie militaire';
          87: s2:=s2|'de caractŠre jongleur';
          88: s2:=s2|'satyrique';
          89: s2:=s2|'de propagande politique';
          90: s2:=s2|'d‚dicatoire';
          91: s2:=s2|'une affabulation';
          92: s2:=s2|'une citation';
          93: s2:=s2|'‚pigrammatique';
          95: s2:=s2|'n‚crologique';
         109: s2:=s2|'embl‚matique';
         115: s2:=s2|'d''un r‚fugi‚ ou d''un pŠlerin';
         118: s2:=s2|'une lettre missive';
         119: s2:=s2|'une aubade';
         120: s2:=s2|'une parodie d''Horace';
         121: s2:=s2|'une chanson de danse';
         127: s2:=s2|'une rŠgle juridique';
         128: s2:=s2|'des paroles d''un petit jeu';
         129: s2:=s2|'un Cisio-Janus';
         210: s2:=s2|'‚pigrammatique';
         211: s2:=s2|'dramatique';
         212: s2:=s2|'agricole';
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