{Вычисление площади, ограниченной тремя графиками,
нахождение точек пересечения графиков методом
половинного деления, вычисление площади методом средних прямоугольников,
вывод графиков на экран в графическом режиме}
program plosh_graf_uravn_integral;
 uses crt,graph;
 const
    minx=90;maxx=550;{Левая и правая границы системы координат}
    miny=460;maxy=40; {Нижняя и верхняя границы системы координат}
    minmasx=0;maxmasx=3.5; {Огграничения по допустимому масштабу}
    minmasy=0;maxmasy=2.5;
    n=100; {Размер массива, по которому строится график}
    e=0.00001;{Точность вычисления корня}

type
 func=function(x:real):real;
var
   {gd,gm - номер драйвера и номер графического режима}
   gd,gm,i,j,nolx,noly:integer;
   edx,edy,a,b,x1,x2,x3,s1,s2:real;
   {Mассивы вводимых точек по x и по у}
   fp1,fp2,fp3:array[1..n] of pointtype;
   ss1:string;
   {$F+}
   function f1(x:real):real;
    begin
      f1:=exp(-sqr(x))+0.5
    end;
   function f2(x:real):real;
    begin
     f2:=ln(sqr(x)+2)
    end;
   function f3(x:real):real;
    begin
     f3:=2*cos(2*x/3)
    end;
   function f21(x:real):real;
    begin
     f21:=f2(x)-f1(x)
    end;
   function f23(x:real):real;
    begin
     f23:=f2(x)-f3(x)
    end;
    function f31(x:real):real;
     begin
      f31:=f3(x)-f1(x)
     end;
procedure integral(f:func;a,b:real; var s1:real);
 var
    i1,s,d:real;n,k:integer;   { Процедура вычисления интеграла }
 begin                       { от  f от a до b c точностью e  }
     d:=b-a;               { методом центральных прямоугольников }
     i1:=d*(f(a+d/4)+f(b-d/4))/2;
     s:=f(a+d/8)+f(a+3*d/8)+f(a+5*d/8)+f(a+7*d/8);
     s1:=d*s/4;
     n:=8;
     while abs(s1-i1)>=e do
      begin
        s:=0;
        for i:=1 to n do
          s:=s+f(a+(2*i-1)*d/(2*n));
        i1:=s1; s1:=s*d/n;
        n:=2*n;
      end;
 end;
procedure reshur(f:func; a,b:real; var x:real);
 var
   c:real;
 begin
    while (b-a)>e do
     begin
       c:=((a+b)/2);
       if f(a)*f(c)<0
       then b:=c else a:=c
      end;
    x:=c;
  end;
procedure grafregim;
  {Установка графического режима и масштаба вывода на экран
  (edx, edy - количество пикселей в единице по оcям X и Y)}
 begin
    {Предполагается, что путь к графическому драйверу egavga.bgi
     d:\tp\bgi,если не так, то нужно исправить}
     gd:=detect;initgraph(gd,gm,'d:/tp/bgi');
     if graphresult<>grok then halt(1);
     cleardevice;
     {Масштаб вывода на экран, положение начала координат}
     edx:=(maxx-minx)/(maxmasx-minmasx);
     edy:=-(maxy-miny)/(maxmasy-minmasy);
     nolx:=round(maxx-maxmasx*edx);
     noly:=round(maxy+maxmasy*edy)
  end;
 procedure osikoord;
   {Рисует оси координат}
   var
      i:integer;stri:string;
   begin
    setcolor(blue);
    line(nolx,miny,nolx,maxy);{ocь y}
    line(minx,noly,maxx,noly);{ось x}
    line(nolx-5,maxy+15,nolx,maxy); {Стрелка для оси y}
    line(nolx+5,maxy+15,nolx,maxy); {Стрелка для оси y}
    line(maxx-15,noly+5,maxx,noly); {Стрелка для оси x}
    line(maxx-15,noly-5,maxx,noly); {Стрелка для оси x}
    outtextxy(nolx-10,maxy,'Y');{Вывод Y}
    outtextxy(maxx,noly+10,'X');{Вывод X}
   {Вывод значений по оси X}
    j:=0;
    for i:=round(minmasx) to round(maxmasx)-1 do
     begin
      str(i,stri);
      if i<>0 then
       begin
        outtextxy(minx+j*round(edx),noly+10,stri);
        line(minx+j*round(edx),noly-5,minx+j*round(edx),noly);
       end;
       j:=j+1
     end;
     j:=0;
{    Вывод значений по оси Y}
    for i:=round(minmasy) to round(maxmasy)-1 do
     begin
      str(i,stri);
      if i<>0 then
       begin
        outtextxy(nolx-20,miny-j*round(edy),stri);
        line(nolx+5,miny-j*round(edy),nolx,miny-j*round(edy));
       end;
      j:=j+1;
     end;
   end;
procedure grafiki;
 var
   d:real;
   begin
     setbkcolor(white);
     d:=(maxmasx-minmasx)/n; {единиц графика на точку по X}
     for i:=1 to n do
      begin
       fp1[i].x:=round( nolx+(i-1)*d*edx);
       fp2[i].x:=fp1[i].x;
       fp3[i].x:=fp1[i].x;
       fp1[i].y:=round( noly-f1((i-1)*d)*edy );
       fp2[i].y:=round( noly-f2((i-1)*d)*edy );
       fp3[i].y:=round( noly-f3((i-1)*d)*edy );
      end;
     setcolor(magenta);
     outtextxy(400,160,'1: y=exp(-x^2)+0.5');
     for i:=1 to n do  drawpoly(i,fp1);
     setcolor(blue);
     outtextxy(400,180,'2: y=ln(2+x^2)');
     for i:=1 to n do drawpoly(i,fp2);
     setcolor(red);
     outtextxy(400,200,'3: y=2*cos(2x/3)');
     for i:=1 to n do  drawpoly(i,fp3)
   end;
Begin
 grafregim; osikoord; grafiki;
 readln; RestoreCrtMode;
 TextBackGround(Blue);  TextColor(Yellow); clrscr;
 writeln('Промежуток для поиска корней: от a до b');
 write( ' a= '); readln(a);  write(' b= '); readln(b);
 writeln('Координаты пересечения графиков');
 writeln('Первое уравнение exp(-x^2)+0.5=ln(2+x*x) ');
 reshur(f21,a,b,x1); writeln('x1=',x1:6:4);
 writeln('Второе уравнение ln(2+x*x)=2*cos(2x/3)');
 reshur(f23,a,b,x2); writeln('x2=',x2:6:4);
 writeln('Третье уравнение exp(-x*x+0.5)=2*cos(2x/3) ');
 reshur(f31,a,b,x3); writeln('x3=',x3:6:4);
 integral(f21,x1,x2,s1);integral(f31,x2,x3,s2);
 writeln('Площадь между вторым и первым  графиками ',s1:6:4);
 writeln('Площадь между третьим и первым графиками ',s2:6:4);
 s1:=s1+s2;
 writeln('Площадь равна ',s1:6:4);   readln;
 SetGraphMode(gm);
 osikoord; grafiki;
 str(s1:10:6,ss1);
 outtextxy(200,240,'Площадь, ограниченная тремя графиками ='+ss1);
 readln
End.


