program binomialnye_koefficienty;
{Вычисление числа сочетаний из n по k}
  uses crt;
  var
      s,n,k,k1,k2:extended; ch:char;
begin
 clrscr;
 repeat
  {Ввод исходных данных: например, n=20000, k=5100,
   результат в этом случае будет равен 2.12644895964682087E+4929
   то есть целое число, содержащее 4930 цифр}
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
     writeln('Неправильный ввод данных');
     writeln('Выход - Escape, продолжение Enter');
     ch:=readkey;
 until ch=#27; {выход из программы по клавише Esc, код 27}
end.