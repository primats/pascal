program binomialnye_koefficienty;
{���᫥��� �᫠ ��⠭�� �� n �� k}
  uses crt;
  var
      s,n,k,k1,k2:extended; ch:char;
begin
 clrscr;
 repeat
  {���� ��室��� ������: ���ਬ��, n=20000, k=5100,
   १���� � �⮬ ��砥 �㤥� ࠢ�� 2.12644895964682087E+4929
   � ���� 楫�� �᫮, ᮤ�ঠ饥 4930 ���}
   write('n=');readln(n);
   write('k=');readln(k);
   if  (k>=1) and (k<=n) then
    begin
      s :=1;
      k1:=1;k2:=n-k+1;
      repeat
        if k1<=k then
         begin
          s:=s/k1;
          k1:=k1+1;
         end;
        if k2<=n then
         begin
          s:=s*k2;
          k2:=k2+1;
         end;
      until (k1=k+1) and (k2=n+1);
      writeln(s:30:0)
    end
     else
     writeln('���ࠢ���� ���� ������');
     writeln('��室 - Escape, �த������� Enter');
     ch:=readkey;
 until ch=#27; {��室 �� �ணࠬ�� �� ������ Esc, ��� 27}
end.