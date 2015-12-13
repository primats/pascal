program ellips_astroida_and_other;
 {Параметрически заданные эллипс, астроида, кардиоида,
  роза Гранди,... }
uses crt,graph;
type
  func=function(x:real):real;
var
  x,y:real;
driver,mode:integer;
cx,cy,mx,my,ex,ey:integer;
procedure OXY;
   var i:integer;
       r:real;
   begin
      {Определение начала координат, GetMaxX, GetMaxY -
       константы, определяющие координаты точек экрана (пикселей).}
      cx:=trunc(GetMaxX/2); cy:=trunc(GetMaxY/2);
      {Оси X и Y}
      line(10,cy,630,cy); line(cx,10,cx,470);
      {Cтрелки на осях координат}
      line(620,cy-5,630,cy); line(620,cy+5,630,cy);
      line(cx-5,20,cx,10);   line(cx+5,20,cx,10);
      outtextxy(cx+10,10,'y');
      outtextxy(GetMaxX-20,cy+10,'x');
      settextstyle(0,0,0);
      {Отметки единиц на осях координат}
      for i:=1 to 10 do
         begin
            line(cx+i*30,cy-5,cx+i*30,cy);
            line(cx-i*30,cy-5,cx-i*30,cy);
            {r - коэффициент сжатия изображения по оси ОY}
            r:=GetMaxY/GetMaxX;
            line(cx,trunc((cx+i*30)*r),cx+5,trunc((cx+i*30)*r));
            line(cx,trunc((cx-i*30)*r),cx+5,trunc((cx-i*30)*r));
         end;
end;
procedure ellips(a,b:real);
  var t:real;
begin
 OXY; t:=0; outtextxy(10,10,'Э Л Л И П С');
 repeat
  x:=a*cos(t); y:=b*sin(t);
  ex:=trunc(cx+x*mx);ey:=trunc(cy-y*my);
  putpixel(ex,ey,red);t:=t+pi/10000;
 until t>2*pi+pi/10000;
end;
{$F+}
function f1(x:real):real;
{Oписание функции от которой берется интеграл}
begin
 f1:=x*x
end;
function f2(x:real):real;
{Oписание функции от которой берется интеграл}
begin
 f2:=x*x*x
end;
{$F-}
procedure astroida(a,b:real);
  var t:real;
begin
 OXY; t:=0;  outtextxy(10,10,' А С Т Р О И Д А');
 repeat
  x:=a*cos(t)*cos(t)*cos(t); y:=b*sin(t)*sin(t)*sin(t);
  ex:=trunc(cx+x*mx);
  ey:=trunc(cy-y*my);
  putpixel(ex,ey,red);
  t:=t+pi/10000;
 until t>2*pi+pi/10000;
end;
procedure kardioida(a,b:real);
  var t:real;
begin
  OXY; t:=0; outtextxy(10,10,'К А Р Д И О И Д А');
  repeat
   x:=a*(1+cos(t))*cos(t); y:=b*(1+cos(t))*sin(t);
   ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
   putpixel(ex,ey,red);t:=t+pi/10000;
  until t>2*pi+pi/10000;
end;
procedure rose(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' РOЗА Гранди');
  repeat
    x:=a*cos(t)*cos(t)*sin(t); y:=b*cos(t)*sin(t)*sin(t);
    ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
    putpixel(ex,ey,red);t:=t+pi/10000;
   until t>2*pi+pi/10000;
end;
procedure experiment1(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' Эксперимент 1 ');
  repeat
    x:=a*cos(t)*cos(t)*sin(t);
    {Изменённая формула для "розы" }
    y:=b*cos(t)*sin(t)*sin(t)*cos(x);
    ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
    putpixel(ex,ey,red);t:=t+pi/10000;
   until t>2*pi+pi/10000;
end;
procedure experiment2(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' Эксперимент 2');
  y:=0;
  repeat
    x:=a*cos(t)*cos(y); y:=b*sin(t)*sin(x);
    ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
    putpixel(ex,ey,red);t:=t+pi/100000;
   until t>2*pi+pi/10000;
end;
BEGIN
  driver:=detect;
  initgraph(driver,mode,'d:\tp\bgi');
  setcolor (blue); setbkcolor(white);
  mx:=trunc((getmaxx-20)/20);
  my:=trunc((getmaxy-20)/20);
  ellips(9,6);    readln; cleardevice;
  astroida(10,6); readln; cleardevice;
  kardioida(5,6); readln; cleardevice;
  rose(25,15);    readln; cleardevice;
  experiment1(25,15); readln; cleardevice;
  experiment2(10,9);  readln; cleardevice;
END.

