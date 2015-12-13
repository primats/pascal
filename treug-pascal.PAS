program vyvod_treugolnika_paskalya;
{Вывод треугольника Паскаля}
uses crt;
const n=15;
type
   vector = array[0..15] of word;
var
   v1,v2:vector; i,j:integer; X,Y:byte;
begin
  clrscr;
  gotoXY(26,1);writeln('Треугольник Паскаля');
  gotoXY(36,3);write('1');
  gotoXY(34,4);write('1   1');
  v1[0]:=1;v1[1]:=2;v1[2]:=1;
  gotoXY(28,5);
  for i:=0 to 2 do write(v1[i]:4,' ');
  Y:=6;X:=26;
  for j:=3 to n do
    begin
      for i:=0 to n do v2[i]:=v1[i];
      for i:=0 to n do
       begin
        if (i=0) or (i=j) then v1[i]:=1 else
        if i<j then  v1[i]:=v2[i-1]+v2[i];
       end;
      gotoXY(X,Y);
      for i:=0 to j do write(v1[i]:4, ' ');
      Y:=Y+1;X:=X-2;
    end;
  readln;
end.