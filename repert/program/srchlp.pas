program SRCHLP(Ex :String) [MENU];

Var SRC : String;
    RC  : Real;
    k   : Real;
    i   : Real;
    sc  : Real;
    c   : String;
    r   : String;

Begin
  Clear;
  Msg(4);
  ClearBox(6,1,20,80,1);
  Box(6,1,20,80,1);
  Cursor(6,28); Write('HELP PANEL A KERES�SHEZ');
  Box(12,51,12,30,1);
  Box(23,1,3,80,1);
  Cursor(12,57); Write('FREE TEXT KERES�S');
  Cursor(23,1); Write(Chr(195));
  Cursor(23,51); Write(Chr(193));
  Cursor(23,80); Write(Chr(180));
  Cursor(12,80); Write(Chr(180));

  Cursor(7,4); Write('Jel�lj�n  A �s B keresend� sz�vegeket illetve C �s D sz�veget , vagy');
  Cursor(8,4); Write(' #n -t ahol n jel�li az  n-dik  tal�lati halmazt.  Ekkor a k�vetkez�');
  Cursor(9,4); Write('logikai kifejez�seket k�pezhetj�k  A-val  �s  B-vel :');
  Cursor(10,4); Write('A$      : Jobbr�l csonkolt sz�veg');
  Cursor(11,4); Write('A/(t)   : Az A a t azonos�t�j� mez�(k)ben');
  Cursor(12,4); Write('C + D   : C (megenged�) vagy D   ');
  Cursor(13,4); Write('C * D   : C  �s  D               ');
  Cursor(14,4); Write('C ^ D   : C  de nem D            ');
  Cursor(15,4); Write('A (G) B : A �s B ugyanabban a mez�ben');
  Cursor(16,4); Write('A (F) B : A �s B ugyanabban az ism�tl�d�sben');
  Cursor(17,4); Write('A . B   : A �s B egym�s mellett');
  Cursor(18,4); Write('A .. B  : A �s B k�z�tt legfelj. egy sz� lehet');
  Cursor(19,4); Write('A ... B : A �s B k�z�tt legfelj. k�t sz� lehet');
  Cursor(20,4); Write('A $ B   : A �s B egym�s mellett');
  Cursor(21,4); Write('A $$ B  : A �s B k�z�tt pontosan egy sz� lehet');
  Cursor(22,4); Write('A $$$ B : A �s B k�z�tt pontosan k�t sz� lehet');

  Cursor(13,53); Write('Szintaktik�ja :');
  Cursor(14,53); Write(' ? logikai kifejez�s');
  Cursor(15,53); Write('     , vagy         ');
  Cursor(16,53); Write(' ?#n logikai kifejez�s');
  Cursor(17,53); Write('ahol n az n-dik tal�lati');
  Cursor(18,53); Write('halmazt jel�li.');
  Cursor(19,53); Write('A logikai kifejez�s');
  Cursor(20,53); Write('szintaktik�ja megegyezik');
  Cursor(21,53); Write('az IF logikai kifejez�s�nek');
  Cursor(22,53); Write('szintaktik�j�val.');
  For i:=6 to 23 do CHATTR(1,i,1,80);

  Cursor(24,32); Write('ENTER - V�grehajt  :  ESC - Kil�p  :  F1 - HELP');
  CHAttr(-2,24,31,49);

  Repeat
  rc:=EDIT(src,255,2,1,255,-2,' ');
  If rc=1 then
    begin
      Savescr(2);
      rc:=0;
      If Filexist(Path('sys',5)|DBN|'.HLP')=0 then begin rc:=1; Assign('INP',Path('sys',5)|DBN|'.HLP'); end;
      If Filexist(Path('dbn',10)|DBN|'.HLP')=0 then begin rc:=2; Assign('INP',Path('dbn',10)|DBN|'.HLP'); end;
      If (rc=1) or (rc=2) then
        begin
          ClearBox(7,10,18,60,-2);
          Box(7,10,18,60,1);
          c:='A kereshet� mez�k a '|DBN|' adatb�zisban';
          Cursor(7,40-size(c)/2); Write(c);
          Cursor(22,10); Write(chr(195));for i:=1 to 58 do write(chr(196)); write(chr(180));
          CHATTR(-2,22,10,60);
          Cursor(23,12); Write('PgUp - lap felfel�  :  PgDn - lap lefel�  :  ESC - kil�p');
          CHAttr(1,23,11,58);
          CHAttr(1,7,40-size(c)/2,size(c));
          k:=1;
          Repeat
            If rc=1 then Assign('INP',Path('sys',5)|DBN|'.HLP');
            If rc=2 then Assign('INP',Path('dbn',10)|DBN|'.HLP');
            i:=1;
            while (i<k) and not eof(inp) do begin readln(inp,r); i:=i+1; end;
            ClearBox(8,11,14,58,-2);
            while (i<k+14) and not eof(inp) do
              begin
                readln(inp,r);
                cursor(8+i-k,12); Write(substr(r,1,57));
                CHATTR(-2,8+i-k,12,58);
                i:=i+1;
              end;
          Repeat
            sc:=KbdKey(c);
          Until (sc=73) or (sc=81) or (c=chr(27));
          If sc=73 then begin if k>1 then k:=k-14; end;
          If sc=81 then begin if k=i-14 then k:=k+14; end;
          Until c=chr(27);
          AutoType('!79');
        end;
      rc:=1;
      Page(2);
    end;
  Until (rc=0) or (rc=4) or (rc=3);

  Ex:=' ';
  If (src<>'') and (rc<>4) and (rc<>3) then
    begin
      rc:=Search(src);
      If rc=0 then
        begin
          sc:=KbdKey(c);
          Ex:='.'|c;
        end;
    end;
End.