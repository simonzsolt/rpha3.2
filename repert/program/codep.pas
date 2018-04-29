program code (s1:string; lw,occ: real; s2:string) [FORMAT];
  begin
      s2:='';
      case  substr(s1,1,3) of
       'v22':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='en ';
               2: s2:='non pos<->t‚<->ri<->eu<->re<->ment … ';
               3: s2:='non an<->t‚<->ri<->eu<->re<->ment … ';
               4: s2:='environ ';
               5: s2:='avant environ ';
               6: s2:='entre ';
               7: s2:='en ';
             end;
       'v23':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='non chant‚. ';
               2: s2:='chant‚. ';
               3: s2:='probablement chant‚. ';
               4: s2:='Non chant‚. ';
               5: s2:='Chant‚. ';
               6: s2:='Probablement chant‚. ';
             end;
       'v24':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Sign‚ par';
               2: s2:='';
               3: s2:='Attribu‚ par la post‚rit‚ imm‚diate …';
               4: s2:='Attribu‚ par la post‚rit‚ tardive …';
               5: s2:='Sign‚ au ni<->veau du re<->cueil par';
               6: s2:='Sign‚ a<->na<->gram<->ma<->ti<->que<->ment par';
             end;
       'v30':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Co<->lo<->phon registrant les cir<->con<->stan<->ces de la com<->po<->si<->tion';
               2: s2:='Sans co<->lo<->phon';
               3: s2:='Co<->lo<->phon dou<->teux';
             end;
       'v33':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Ac<->ros<->ti<->che';
               2: s2:='Sans ac<->ros<->ti<->che';
               3: s2:='Ac<->ros<->ti<->che dou<->teux';
             end;
       'v41':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='Texte int‚gral ';
               2: s2:='Texte frag<->men<->tai<->re ';
               3: s2:='Texte frag<->men<->tai<->re mais l''‚tendue du texte int‚gral est connue, ';
             end;
       'v44':case val(substr(s1,5,size(s1)-4)) of
               1: s2:='MŠtre stro<->phi<->que syl<->la<->bo-to<->ni<->que, ';
               3: s2:='MŠtre probablement pro<->sa<->‹<->que mais traduit de vers, ';
               4: s2:='MŠtre quan<->ti<->ta<->tif impr‚cis, ';
               5: s2:='MŠtre stro<->phi<->que to<->ni<->que mais non syl<->la<->bi<->que, ';
               6: s2:='HexamŠtre ';
               7: s2:='Dis<->ti<->que ';
               8: s2:='MŠtre quan<->ti<->ta<->tif aut<->re que l''hexamŠtre et le dis<->ti<->que, ';
              10: s2:='MŠtre to<->ni<->que non stro<->phi<->que, non syl<->la<->bi<->que mais avec des rimes, ';
              11: s2:='MŠtre probablement pro<->sa<->‹<->que mais ryth<->mi<->que, ';
              12: s2:='MŠtre en vers et prose alternativement, ';
              15: s2:='MŠtre altern‚ ';
              16: s2:='MŠtre … tendence syl<->la<->bi<->que, ';
              17: s2:='MŠtre syl<->la<->bi<->que, ';
              18: s2:='MŠtre bas‚ sur le nombre des mots, ';
              19: s2:='MŠtre imitant celui des s‚<->quen<->ces victoriennes, ';
              30: s2:='MŠtre stro<->phi<->que syl<->la<->bo-to<->ni<->que (d''aprŠs une r‚f‚rence m‚<->lo<->di<->que), ';
             end;
      end;
  end.