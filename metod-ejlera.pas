program metod_euler;
{Решение диф. уравнения методом Эйлера}
 uses crt;
 const n = 10000;
 var
   x0, y0, xk, h , x: real;
function f(x,y:real):real;
{Рассматривается диф. уравнение y'= f(x,y)}
 begin
  f:=-4*y+8*x*x+3
  {Для упражнения}
  {f:=x*sqrt(y);}
 end;
 procedure euler(x0, y0, xk:real);
 {Процедура метода Эйлера}
  var dx:real;
  begin
      dx:=(xk - x0)/n;
    repeat
     y0:=y0+dx*f(x0, y0);
     x0:=x0 + dx
    until x0 > xk;
    writeln('x  = ', x0 - dx:4:2,'   y  = ',y0:4:2)
  end;
Begin
 clrscr;
 write('Введите x0  ');readln(x0);
 write('Введите y0  ');readln(y0);
 write('Введите xk  ');readln(xk);
 writeln('Начальные условия');
 writeln('x0 = ',x0:4:2,'   y0 = ',y0:4:2);
 h:=(xk - x0)/5; x:=x0;
 writeln('Таблица для пяти промежуточных точек');
 repeat
   x:=x+h;
   euler(x0, y0, x);
 until abs(x-xk)<h/2;
 writeln('Конец расчета');
 readln
End.
