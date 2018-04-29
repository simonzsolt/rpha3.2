Procedure Window(lin, col, h, w, frame, color, shadow : Real; title : String);
Var i : real;
Begin
  ClearBox(lin,col,h,w,color);
  Box(lin,col,h,w,frame);
  For i:=1 to h do Chattr(shadow,lin+i,col+w,2);
  Chattr(shadow,lin+h,col+2,w-2);
  If (Size(title)+2 <= w) and (title<>'') then
    begin
      i:=(w-Size(title))/2;
      Cursor(lin,col+i-1);
      Write(' ',title,' ');
      Chattr(color,lin,col+i-1,Size(title)+2);
    end;
End;