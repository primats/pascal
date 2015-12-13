program reurpol;
 {Решение уравнения половинным делением
  Предвариетльно выводится таблица для локализации корней}
uses crt;
var
   a,b,n,x,d,c,eps,f:real;

function y(x:real):real;
  begin
   y:=sin(ln(abs(x*x+2)))
  end;
Begin
   clrscr; writeln('Таблица значений функции');
   writeln('Введите начальный и конечный концы интервала');
   write('a='); readln (a);
   write('b='); readln(b);
   writeln('Число точек на интервале:');
   write('n='); readln(n);
   d:=(b-a)/n;   x:=a;
   while x<=b do
      begin
         f:=y(x);
         writeln('x=',x:5:3,'  f=',f:5:3);
         x:=x+d
      end;
   readln;
   writeln('Нахождение корня: концы интервала, точность вычисления');
   writeln('(a, b и eps)');
   write('a ='); readln (a); write('b ='); readln(b);
   write('eps =');readln(eps);
   {Концы отрезка имеют разные знаки}
   if y(a)*y(b) < 0 then
      begin
        {До тех пор, пока не достигнута заданная точность}
         repeat
           c:=(a+b)/2;
           {Если найден точный корень, то его вывод и выход}
           if y(c)=0 then
            begin
             writeln('Найден точный корень ', c:6:3);
             readln;
             exit
            end
             else
           {Определение нового промежутка для следующей итерации}
           if y(a)*y(c)<0 then b:=c else a:=c;
         until (b-a)<eps;
         writeln('Kорень с точностью ',eps:8:6);
         writeln('равен ', c:8:6);
      end
   else
     {Если на концах отрезка были одинаковые знаки}
     writeln('Корня нет или он не единственен');
   readln
end.
