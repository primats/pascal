program metod_simpsona;
{Вычисление интеграла методом Симпсона}
 uses crt;
 const
     a:real=0; b:real=1; epsilon:real=0.0000000001;
 var
     s:real;
 function f(x:real):real;
   begin
     f:=exp(-sqr(x));
     {Для тестирования}
     {f:=sin(x)}
     {if x<>0 then f:=sin(x)/x else f:=1;}
     {f:=exp(-sqr(x)/2)/sqrt(2*pi);}
   end;

 function simpson(a,b,e:real):real;
   var
    s1,s2,s,h:real; i,n,k:longint;
   begin
     k:=2; n:=2*k; h:=(b-a)/n;
     s2:=(f(a)+f(b))*(h/3);
     repeat
       s1:=s2; k:=2*k; h:=(b-a)/(2*k);
       s2:=f(a)+f(b);  s:=0;
       for i:=1 to k do s:=s+f(a+(2*i-1)*h);
       s2:=s2+4*s;
       s:=0;
       for i:=1 to k-1 do s:=s+f(a+2*i*h);
       s2:=s2+2*s;
       s2:=s2*h/3;
       writeln('I=',s2:12:10,', n=',2*k);
     until abs(s2-s1)/15<e;
     simpson:=s2
   end;
Begin
   clrscr;
   writeln('Вычисление интеграла методом  Cимпсона');
   writeln('a=',a:4:2, ' b=', b:4:2, ' epsilon=',epsilon:12:10);
   S:=simpson(a,b,epsilon);
   writeln('Ингеграл от exp(-x*x) = ', S:12:10);
   readln
End.



