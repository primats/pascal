program Integral_metodom_sred_prmg;
uses crt;
{Вычисление интеграла методом средних прямоугольников}
const
  {Исходные данные: e - точность вычисления интеграла;
   a - нижний предел; b - верхний предел интегрирования}
   e:real = 0.00000001; a:real = 0; b:real= 6.0;
  var
    IntSum:real;
 function f(x:real):real;{ Определение функции}
  begin
    f:=sin(x)/x;
    {Функция Гаусса}
    {f:=exp(-sqr(x)/2)/sqrt(2*pi);}
    {Для тестирования}
    {f:=sqr(x);} {f:=cos(x);}
   end;
 procedure Integral(e, a, b :real; var i2:real);
 {Процедура вычисления интеграла
     begin       { методом средних прямоугольников}
   var
      i1,d,s:real; i,n:word;
      {d=b-a делится на n отрезков;n на каждом шаге удваивается
      i1- сумма площадей n прямоугольников c основанием d/n,
      i2- сумма площадей 2n прямоугольников c основанием d/(2n)}
   begin
     d:=b-a;
     {Высота прямоугольника равна значению функции в средней точке
      каждого из отрезков длины (b-a)/n}
     i1:=(f(a+d/4)+f(b-d/4))*d/2;  {для n=2}
     {для n=4}
     i2:=(f(a+d/8)+f(a+3*d/8)+f(a+5*d/8)+f(a+7*d/8))*d/4;
     n:=8;
     while abs(i2-i1) >= e do
       begin
         s:=0;
         for i:=1 to n do s:=s+f(a+(2*i-1)*d/(2*n));
         i1:=i2;  i2:=s*d/n;
         writeln('I= ',IntSum:10:9, ', n=',n:6);
         n:=2*n
       end;
   end;
Begin
   clrscr;
   Integral(e, a, b ,IntSum);
   writeln('Интеграл методом средних прямоугольников');
   writeln('от a=',a:4:2,' до b=',b:4:2,' с точностью ',e:10:9);
   writeln('I= ',IntSum:10:9);
   readln;
End.
