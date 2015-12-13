program elliptichesky_paraboloid;
{Декартова система координат в трехмерном пространстве,
 построение эллиптического параболоида}
  uses crt,graph;
var
   cx,cy,driver,mode,z,i:integer;
begin
  driver:=detect; initgraph(driver,mode,'d:\tp\bgi');
  repeat {повторение в цикле, пока не будет нажат Enter}
    setcolor (blue);{цвет осей координат}
    {Положение начала координат}
    cx:=round((15/32)*getmaxx);cy:=round((3/4)*getmaxy);
    outtextxy(20,20,'Эллиптический параболоид');
    {Система координат, ось X} line(cx,cy,getmaxx-10,cy);
    {подпись и стрелка по оси X }
    outtextXY(getmaxx-30,cy-20,'X');line(getmaxx-30,cy-5,getmaxx-10,cy);
    line(getmaxx-30,cy+5,getmaxx-10,cy);
    {подптсь и стрелка на оси Z } line(cx,cy,cx,0);  outtextXY(cx+10,10,'Z');
    {стрелки по оси Z }line(cx-5,20,cx,0);line(cx+5,20,cx,0);
    {Ось Y }line(cx,cy,round(getmaxx/6),getmaxy-10);
    {подпись и стрелка на оси Y } outtextxy(round(getmaxx/6)-10,getmaxy-20,'Y');
    line(round(getmaxx/6),getmaxy-10,round(getmaxx/6)+20,getmaxy-15);
    line(round(getmaxx/6),getmaxy-10,round(getmaxx/6)+15,getmaxy-25);
    {Цикл вывода эллипсов с одной и той же координатой по оси X,
     но с увеличением координаты по оси Z и полуосей }
    for z:=0 to round(getmaxx/7) do
     begin
      setbkcolor(white);setcolor(red);
      ellipse(cx,cy-trunc(z*z/30),0,360,trunc(z*3),trunc(z/2));
      delay(10);{замедление вывода, задержка перед выводом следующего эллипса}
     end;
    {Задержка 3000 милисекунд перед следующим выводом}
    delay(3000);cleardevice;
  until keypressed
end.
