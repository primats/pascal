program elliptichesky_paraboloid;
{�����⮢� ��⥬� ���न��� � ��嬥୮� ����࠭�⢥,
 ����஥��� �����᪮�� ��ࠡ������}
  uses crt,graph;
var
   cx,cy,driver,mode,z,i:integer;
begin
  driver:=detect; initgraph(driver,mode,'d:\tp\bgi');
  repeat {����७�� � 横��, ���� �� �㤥� ����� Enter}
    setcolor (blue);{梥� �ᥩ ���न���}
    {��������� ��砫� ���न���}
    cx:=round((15/32)*getmaxx);cy:=round((3/4)*getmaxy);
    outtextxy(20,20,'�������᪨� ��ࠡ�����');
    {���⥬� ���न���, ��� X} line(cx,cy,getmaxx-10,cy);
    {������� � ��५�� �� �� X }
    outtextXY(getmaxx-30,cy-20,'X');line(getmaxx-30,cy-5,getmaxx-10,cy);
    line(getmaxx-30,cy+5,getmaxx-10,cy);
    {������� � ��५�� �� �� Z } line(cx,cy,cx,0);  outtextXY(cx+10,10,'Z');
    {��५�� �� �� Z }line(cx-5,20,cx,0);line(cx+5,20,cx,0);
    {��� Y }line(cx,cy,round(getmaxx/6),getmaxy-10);
    {������� � ��५�� �� �� Y } outtextxy(round(getmaxx/6)-10,getmaxy-20,'Y');
    line(round(getmaxx/6),getmaxy-10,round(getmaxx/6)+20,getmaxy-15);
    line(round(getmaxx/6),getmaxy-10,round(getmaxx/6)+15,getmaxy-25);
    {���� �뢮�� ���ᮢ � ����� � ⮩ �� ���न��⮩ �� �� X,
     �� � 㢥��祭��� ���न���� �� �� Z � ����ᥩ }
    for z:=0 to round(getmaxx/7) do
     begin
      setbkcolor(white);setcolor(red);
      ellipse(cx,cy-trunc(z*z/30),0,360,trunc(z*3),trunc(z/2));
      delay(10);{���������� �뢮��, ����প� ��। �뢮��� ᫥���饣� ����}
     end;
    {����প� 3000 ����ᥪ㭤 ��। ᫥���騬 �뢮���}
    delay(3000);cleardevice;
  until keypressed
end.
