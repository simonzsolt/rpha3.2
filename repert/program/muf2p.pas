program muf2 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
          48: s2:=s2|'poŠme profane';
          49: s2:=s2|'pr‚sent‚ comme his<->toi<->re';
          50: s2:=s2|'non pr‚sent‚ comme his<->toi<->re';
          51: s2:=s2|'narratif';
          52: s2:=s2|'des<->crip<->tif ou d‚lib‚ratif';
          53: s2:=s2|'moral ou po<->li<->ti<->que';
          54: s2:=s2|'‚<->ro<->ti<->que';
          56: s2:=s2|'non fictif';
          57: s2:=s2|'ro<->ma<->nes<->que ou fictif';
          58: s2:=s2|'du re<->gis<->tre aristocratisant';
          59: s2:=s2|'du re<->gis<->tre popularisant ou vagant';
          61: s2:=s2|'du re<->gis<->tre humaniste ou sco<->lai<->re';
          63: s2:=s2|'du re<->gis<->tre aristocratisant';
          64: s2:=s2|'du re<->gis<->tre popularisant ou vagant';
          66: s2:=s2|'du re<->gis<->tre humaniste ou sco<->lai<->re';
          68: s2:=s2|'relatant des ‚v‚nements d''un pass‚ loin<->tain';
          69: s2:=s2|'relatant des ‚v‚nements d''un pass‚ imm‚diat';
          74: s2:=s2|'du ca<->len<->drier';
          76: s2:=s2|'un tenson';
          77: s2:=s2|'em<->bl‚<->ma<->ti<->que';
          78: s2:=s2|'saluant une dame';
          80: s2:=s2|'tra<->duit d''un beyt tur<->que';
          81: s2:=s2|'‚<->nig<->ma<->ti<->que';
          82: s2:=s2|'une chanson de femme';
          83: s2:=s2|'sa<->ty<->ri<->que ou os‚';
          84: s2:=s2|'oriental';
          85: s2:=s2|'di<->dac<->ti<->que, trai<->tant l''a<->mour';
          86: s2:=s2|'exaltant la vie mi<->li<->tai<->re';
          87: s2:=s2|'de caractŠre jong<->leur';
          88: s2:=s2|'sa<->ty<->ri<->que';
          89: s2:=s2|'de propagande po<->li<->ti<->que';
          90: s2:=s2|'d‚<->di<->ca<->toi<->re';
          91: s2:=s2|'une af<->fa<->bu<->la<->tion';
          92: s2:=s2|'une ci<->ta<->tion';
          93: s2:=s2|'‚<->pi<->gram<->ma<->ti<->que';
          95: s2:=s2|'n‚<->cro<->lo<->gi<->que';
         109: s2:=s2|'em<->bl‚<->ma<->ti<->que';
         115: s2:=s2|'d''un r‚fugi‚ ou d''un pŠlerin';
         118: s2:=s2|'une lettre missive';
         119: s2:=s2|'une aubade';
         120: s2:=s2|'une parodie d''Horace';
         121: s2:=s2|'une chanson de danse';
         127: s2:=s2|'une rŠgle ju<->ri<->di<->que';
         128: s2:=s2|'des paroles d''un petit jeu';
         129: s2:=s2|'un Cisio-Janus';
         210: s2:=s2|'‚<->pi<->gram<->ma<->ti<->que';
         211: s2:=s2|'dra<->ma<->ti<->que';
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