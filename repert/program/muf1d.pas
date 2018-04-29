program muf1 (s1:string; lw,occ: real; s2:string) [FORMAT];

var s3:string;

procedure eset;
begin
    case val(s3) of
           1: s2:=s2|'poŠme eccl‚siastique';
           2: s2:=s2|'pr‚sent‚ comme histoire';
           3: s2:=s2|'non pr‚sent‚ comme histoire';
           4: s2:=s2|'narratif';
           5: s2:=s2|'descriptif ou d‚lib‚ratif';
           6: s2:=s2|'biblique';
           8: s2:=s2|'d''origine liturgique ou para-liturgique';
           9: s2:=s2|'biblique';
          10: s2:=s2|'sermonnaire';
          13: s2:=s2|'un psaume';
          14: s2:=s2|'dit j‚r‚miade';
          15: s2:=s2|'au r‚sum‚';
          16: s2:=s2|'un hymne';
          17: s2:=s2|'une antienne';
          18: s2:=s2|'une s‚quence';
          20: s2:=s2|'un intro‹t';
          21: s2:=s2|'un magnificat';
          23: s2:=s2|'dogmatique';
          24: s2:=s2|'concernant un ‚v‚nement';
          25: s2:=s2|'chant spirituel quotidien ou solennel';
          26: s2:=s2|'expliquant la communion sous les deux espŠces';
          27: s2:=s2|'cat‚chisant les innocents';
          28: s2:=s2|'expliquant la Trinit‚';
          29: s2:=s2|'expliquant le credo';
          30: s2:=s2|'expliquant le pater';
          31: s2:=s2|'expliquant le d‚calogue';
          32: s2:=s2|'marital';
          33: s2:=s2|'baptismal';
          34: s2:=s2|'une berceuse';
          35: s2:=s2|'fun‚raire';
          36: s2:=s2|'une louange';
          37: s2:=s2|'rendant des actions de grƒces';
          38: s2:=s2|'une supplication';
          39: s2:=s2|'une confession publique';
          40: s2:=s2|'invoquant le Saint-Esprit';
          41: s2:=s2|'conclusif';
          42: s2:=s2|'exhortant le croyant … agir en bon chr‚tien';
          43: s2:=s2|'encourageant le croyant';
          44: s2:=s2|'plaintif';
          45: s2:=s2|'consolant le croyant';
          47: s2:=s2|'de la vanit‚ du monde';
         100: s2:=s2|'un benedicamus';
         101: s2:=s2|'pour pr‚parer le croyant … la mort';
         102: s2:=s2|'une priŠre';
         103: s2:=s2|'un hymne musulman';
         104: s2:=s2|'une description des observances de la vie monastique';
         107: s2:=s2|'controversiste';
         123: s2:=s2|'une incantation';
         124: s2:=s2|'exaltant un roi saint';
         125: s2:=s2|'une l‚gende';
         126: s2:=s2|'une plainte de Marie';
         130: s2:=s2|'louant Marie';
         134: s2:=s2|'une chronique du monde';
         200: s2:=s2|'un cantique';
         201: s2:=s2|'dramatique';
         202: s2:=s2|'doxologique';
         203: s2:=s2|'embl‚matique';
         255: s2:=s2|'pour l''‚l‚vation';
         256: s2:=s2|'un benedicamus paraphras‚';
         257: s2:=s2|'un b‚n‚dicit‚';
         258: s2:=s2|'le Cantique des cantiques';
         259: s2:=s2|'chanson de pelerin';
         260: s2:=s2|'d''un captif';
         300: s2:=s2|'traitant l''histoire eccl‚siastique';
         301: s2:=s2|'des temps relativement r‚cents';
         302: s2:=s2|'des temps anciens';
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