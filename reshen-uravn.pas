program metod_Newton;
{Решение уравнения f(x) = 0 методом касательных}
uses crt;
const
  delta = 0.001;epsilon=0.00001;
var a, b, x1, x0: real;

function f(x:real):real;
{Oписание  функции}
begin
   f:=x*x*x*x-2*x-4
   {Тестовый пример}
   {f:=sin(x)}
end;

function df(x:real):real;
{Приближенное вычисление производной}
begin
   df:=(f(x+delta)-f(x))/delta;
end;

{Описание метода касательных}
function Newton (x1:real):real;
  var n:integer; x0:real;
begin
   n:=0;
   repeat
      x0:=x1;
      x1:=x0-f(x0)/df(x0);
      writeln('x', n, ' = ',x1:8:5,'        f(x', n, ')=', f(x1):8:5);
      n:=n+1;
   until  abs(x0-x1)<=epsilon;
   writeln('Число итераций =',n);
   Newton:= x1
end;

Begin
   TextBackGround(Blue); TextColor(Yellow);  ClrScr;
   write('Введите приближение x1 = ');readln(x1);
   x0:=Newton(x1);
   writeln('Значение корня с точностью ', epsilon:7:5);
   writeln('x =', x0:8:6);
   readln
End.
