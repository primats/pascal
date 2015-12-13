program ellips_astroida_and_other;
 {��ࠬ����᪨ ������� ����, ���ந��, ��न����,
  ஧� �࠭��,... }
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
      {��।������ ��砫� ���न���, GetMaxX, GetMaxY -
       ����⠭��, ��।����騥 ���न���� �祪 �࠭� (���ᥫ��).}
      cx:=trunc(GetMaxX/2); cy:=trunc(GetMaxY/2);
      {�� X � Y}
      line(10,cy,630,cy); line(cx,10,cx,470);
      {C�५�� �� ���� ���न���}
      line(620,cy-5,630,cy); line(620,cy+5,630,cy);
      line(cx-5,20,cx,10);   line(cx+5,20,cx,10);
      outtextxy(cx+10,10,'y');
      outtextxy(GetMaxX-20,cy+10,'x');
      settextstyle(0,0,0);
      {�⬥⪨ ������ �� ���� ���न���}
      for i:=1 to 10 do
         begin
            line(cx+i*30,cy-5,cx+i*30,cy);
            line(cx-i*30,cy-5,cx-i*30,cy);
            {r - �����樥�� ᦠ�� ����ࠦ���� �� �� �Y}
            r:=GetMaxY/GetMaxX;
            line(cx,trunc((cx+i*30)*r),cx+5,trunc((cx+i*30)*r));
            line(cx,trunc((cx-i*30)*r),cx+5,trunc((cx-i*30)*r));
         end;
end;
procedure ellips(a,b:real);
  var t:real;
begin
 OXY; t:=0; outtextxy(10,10,'� � � � � �');
 repeat
  x:=a*cos(t); y:=b*sin(t);
  ex:=trunc(cx+x*mx);ey:=trunc(cy-y*my);
  putpixel(ex,ey,red);t:=t+pi/10000;
 until t>2*pi+pi/10000;
end;
{$F+}
function f1(x:real):real;
{O��ᠭ�� �㭪樨 �� ���ன ������ ��⥣ࠫ}
begin
 f1:=x*x
end;
function f2(x:real):real;
{O��ᠭ�� �㭪樨 �� ���ன ������ ��⥣ࠫ}
begin
 f2:=x*x*x
end;
{$F-}
procedure astroida(a,b:real);
  var t:real;
begin
 OXY; t:=0;  outtextxy(10,10,' � � � � � � � �');
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
  OXY; t:=0; outtextxy(10,10,'� � � � � � � � �');
  repeat
   x:=a*(1+cos(t))*cos(t); y:=b*(1+cos(t))*sin(t);
   ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
   putpixel(ex,ey,red);t:=t+pi/10000;
  until t>2*pi+pi/10000;
end;
procedure rose(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' �O�� �࠭��');
  repeat
    x:=a*cos(t)*cos(t)*sin(t); y:=b*cos(t)*sin(t)*sin(t);
    ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
    putpixel(ex,ey,red);t:=t+pi/10000;
   until t>2*pi+pi/10000;
end;
procedure experiment1(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' ��ᯥਬ��� 1 ');
  repeat
    x:=a*cos(t)*cos(t)*sin(t);
    {�����񭭠� ��㫠 ��� "஧�" }
    y:=b*cos(t)*sin(t)*sin(t)*cos(x);
    ex:=trunc(cx+x*mx); ey:=trunc(cy-y*my);
    putpixel(ex,ey,red);t:=t+pi/10000;
   until t>2*pi+pi/10000;
end;
procedure experiment2(a,b:real);
  var p:integer;t:real;
begin
  OXY;t:=0; outtextxy(10,10,' ��ᯥਬ��� 2');
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

