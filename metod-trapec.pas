program int_met_trap;
{Вычисление интеграла методом трапеций}
uses crt;
 const epsilon:real=0.0001; a:real=0; b:real=6;
var
   s:real;
function f(x:real):real;
  {Подынтегральная функция}
begin
   if x=0 then f:=1 else f:=sin(x)/x;
   {Функции для тестирования}
   {f:=sin(x)}
   {f:=x*x;}
   {f:=exp(-sqr(x));}
end;

function imetrap(a,b:real):real;
  {Функция, реализующая метод трапеций }
var
   n,i:longint;
   s1,s2,h,v:real;
begin
   n:=2; h:=(b-a)/n; s2:=0;
   writeln('Промежуточные значения интеграла');
   repeat
      s1:=0;
      for i:=1 to n-1 do  s1:=s1+f(a+i*h);
      s1:=(s1+f(a)/2+f(b)/2)*h;
{Промежуточные значения}
      writeln(s1:9:7,', n=',n);
      n:=2*n;  v:=s2; s2:=s1; s1:=v;
      h:=(b-a)/n
   until abs(s2-s1)<epsilon;
{Результат}

   imetrap:=s2;
end;
Begin
   clrscr;
   s:=imetrap(a,b);
   writeln('Интеграл =',s:9:7,' с точностью ',epsilon:6:4);
   readln
End.
