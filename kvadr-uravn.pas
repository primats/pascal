program reshenie_kwadr_lin_uravneniy;
 {Решение уравнения a*x*x+b*x+c=0}
 uses crt;
 var a,b,c,d,x1,x2:real;
Begin
    clrscr;
    writeln ('Введите коэффициенты');
    write ('a=');readln (a);
    write ('b=');readln (b);
    write ('c=');readln (c);
    if (a=0) and (b=0) and (c=0) then
       writeln('Корней бесконечно много')
    else
     if (a=0) and (b=0) and (c<>0) then
     writeln ('Корней нет')
    else
     if (a=0) and (b<>0) then
      begin
       writeln ('Линейное уравнение');
       x1:=-c/b;
       writeln('x=',x1:4:2);
      end
    else
     {Решение квадратного уравнения}
     begin
      d:=sqr(b)-4*a*c;
      if d<0 then
       writeln ('Действительных корней нет!')
      else
       if d=0 then
        begin
         x1:=-b/(2*a);
         writeln('x=',x1:4:2);
        end
       else
        begin
         x1:=(-b+sqrt(d))/(2*a);
         x2:=(-b-sqrt(d))/(2*a);
         writeln ('x1=',x1:4:2, ' x2=',x2:4:2);
        end
     end;
    readln
End.