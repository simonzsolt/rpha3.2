program muf1 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
           1: s2:=s2|'po<->Š<->me ecc<->l‚<->si<->as<->ti<->que';
           2: s2:=s2|'pr‚sent‚ comme his<->toi<->re';
           3: s2:=s2|'non pr‚sent‚ comme his<->toi<->re';
           4: s2:=s2|'narratif';
           5: s2:=s2|'des<->crip<->tif ou d‚lib‚ratif';
           6: s2:=s2|'bib<->li<->que';
           8: s2:=s2|'d''origine li<->tur<->gi<->que ou pa<->ra-li<->tur<->gi<->que';
           9: s2:=s2|'bib<->li<->que';
          10: s2:=s2|'ser<->mon<->nai<->re';
          13: s2:=s2|'un psau<->me';
          14: s2:=s2|'dit j‚r‚miade';
          15: s2:=s2|'au r‚sum‚';
          16: s2:=s2|'un hymne';
          17: s2:=s2|'une an<->tien<->ne';
          18: s2:=s2|'une s‚<->quen<->ce';
          20: s2:=s2|'un intro‹t';
          21: s2:=s2|'un ma<->gni<->fi<->cat';
          23: s2:=s2|'dog<->ma<->ti<->que';
          24: s2:=s2|'concernant un ‚v‚nement';
          25: s2:=s2|'chant spirituel quo<->ti<->dien ou solennel';
          26: s2:=s2|'ex<->pli<->quant la com<->mu<->nion sous les deux espŠces';
          27: s2:=s2|'cat‚chisant les innocents';
          28: s2:=s2|'ex<->pli<->quant la Trinit‚';
          29: s2:=s2|'ex<->pli<->quant le credo';
          30: s2:=s2|'ex<->pli<->quant le pater';
          31: s2:=s2|'ex<->pli<->quant le d‚<->ca<->lo<->gue';
          32: s2:=s2|'marital';
          33: s2:=s2|'baptismal';
          34: s2:=s2|'une ber<->ceu<->se';
          35: s2:=s2|'fu<->n‚<->rai<->re';
          36: s2:=s2|'une lou<->an<->ge';
          37: s2:=s2|'rendant des ac<->tions de grƒces';
          38: s2:=s2|'une supp<->li<->ca<->tion';
          39: s2:=s2|'une con<->fes<->sion pub<->li<->que';
          40: s2:=s2|'in<->vo<->quant le Saint-Es<->prit';
          41: s2:=s2|'conclusif';
          42: s2:=s2|'exhortant le croy<->ant … agir en bon chr‚<->tien';
          43: s2:=s2|'en<->cou<->ra<->geant le croy<->ant';
          44: s2:=s2|'plain<->tif';
          45: s2:=s2|'consolant le croy<->ant';
          47: s2:=s2|'de la vanit‚ du monde';
         100: s2:=s2|'un benedicamus';
         101: s2:=s2|'pour pr‚parer le croyant … la mort';
         102: s2:=s2|'une priŠre';
         103: s2:=s2|'un hymne musulman';
         104: s2:=s2|'une des<->crip<->tion des observances de la vie mo<->nas<->ti<->que';
         107: s2:=s2|'controversiste';
         123: s2:=s2|'une in<->can<->ta<->tion';
         124: s2:=s2|'exaltant un roi saint';
         125: s2:=s2|'une l‚gende';
         126: s2:=s2|'une plain<->te de Marie';
         130: s2:=s2|'lou<->ant Marie';
         134: s2:=s2|'une chro<->ni<->que du monde';
         200: s2:=s2|'un can<->ti<->que';
         201: s2:=s2|'dra<->ma<->ti<->que';
         202: s2:=s2|'do<->xo<->lo<->gi<->que';
         203: s2:=s2|'em<->bl‚<->ma<->ti<->que';
         255: s2:=s2|'pour l''‚<->l‚<->va<->tion';
         256: s2:=s2|'un benedicamus paraphras‚';
         257: s2:=s2|'un b‚n‚dicit‚';
         258: s2:=s2|'le Can<->ti<->que des canti<->ques';
         259: s2:=s2|'chanson de pelerin';
         260: s2:=s2|'d''un captif';
         300: s2:=s2|'trai<->tant l''his<->toi<->re ecc<->l‚<->si<->as<->ti<->que';
         301: s2:=s2|'des temps relativement r‚cents';
         302: s2:=s2|'des temps an<->ciens';
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