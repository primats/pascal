program metod_montekarlo;
{���᫥���  ��⥣ࠫ�  ��⮤��  ����-��૮}
 uses crt,graph;
 type
   func=function(x:real):real;
 const
  {��������� �����, �ࠢ��, ������ � ���孥� �࠭��
  �ᯮ������� ��⥬� ���न��� �� �࠭�}
  minx=40;maxx=550;miny=380;maxy=70;
  {��᫮ �祪 ��� ����஥��� ��䨪� � ������� ��楤��� drawpoly}
  n=150;

 var
    i,j,k,gd,gm,nolx,noly:integer;
    a,b,c,s,max,min,x,y,edx,edy,sinba:real;
    l,m:longint;
    sts,ssinba:string;ch:char;

{$F+}
function fGauss(x:real):real;
{�㭪�� ����� - ���⭮��� ��ଠ�쭮�� ������ ��।������}
begin
  fGauss:=1/sqrt(2*pi)*exp(-x*x/2)
end;
function fTest(x:real):real;
{�㭪�� ��� ���஢����}
begin
  fTest:=cos(x) {��ࢮ��ࠧ��� �� cos(x) ࠢ�� sin(x)}
  {������� ����� �஢����,
  ��ࢮ��ࠧ��� �� cos(x) ࠢ�� sin(x)}
end;
{���� ����⢥����� �᫠ � ����᪮� ०���}
procedure input(x,y:integer;var xr:real);
 var
   ch:char;kd:integer;
   st:string[10];{��ப� ��� ����� �� ����� 10 ������}
 begin
  st:='';{��砫쭮� ���祭�� ��ப�}
  setfillstyle(1,0);
  repeat
   ch:=readkey;{�⥭�� ᨬ����}
   case ch of
    '0'..'9','.':st:=st+ch; {���������� ᨬ���� � ��ப�}
    '-': {����� ����� ���� ⮫쪮 � ��砫�}
         st:=ch;
    {#8 - ������ "BackSpace", 㤠����� ��᫥����� ����񭭮�� ���祭��}
    #8:st:=copy(st,1,length(st)-1)
   end;
   {�뢮� ����񭭮� ��ப� �� �࠭}
   bar(x+16*length(st),y,x+160,y+16);outtextxy(x,y,st);
   {��ॢ�� ��ப� st � �᫮ xr}
   val(st,xr,kd);
  {#13 - ������ "Enter";#27 - ������ "ESC"}
  {���� �� ������ �� Enter ��� ESC � ���� �� ����� ��� �� ���� ᨬ���}
  until ((ch=#13) or (ch=#27)) and (length(st)>0)
end;
{���� 楫��� �᫠ � ����᪮� ०���}
procedure inputi(x,y:integer;var nl:longint);
 var ch:char;
     kd:integer;
     st:string[6]; {��ப� ��� ����� �� ����� ��� ������}
 begin
  st:='';
  setfillstyle(1,0);
  repeat
   ch:=readkey;
   case ch of
    '0'..'9':st:=st+ch;
    #8: st:=copy(st,1,length(st)-1)
   end;
   {�뢮� ����񭭮� ��ப� �� �࠭}
   bar(x+16*length(st),y,x+160,y+16);outtextxy(x,y,st);
   val(st,nl,kd); {��ॢ�� �ப� st � �᫮ nl}
  until ((ch=#13) or (ch=#27)) and (length(st)>0)
end;
{��楤��, ॠ������� ��⮤ ��砩��� �ᥫ}
procedure metodmontekarlo(f:func);
 var x1,y1,y:real;
    x:integer;
    m,z:longint;
 begin
  setcolor(blue);
  outtextxy(70,10,'��⮤ ��砩��� �ᥫ.');
  outtextxy(70,30,'������ ���-�� �祪:');
  inputi(430,30,l);
  y:=0;
  z:=0;
  m:=1;
  repeat
    x1:=random*(b-a)+a;y:=f(x1);
    y1:=random*(max-min)+min;
    if ((y>0) and (y>=y1) and (y1>0)) then
     begin
      z:=z+1;
      putpixel(round(nolx+x1*edx),round(noly-y1*edy),blue)
     end
       else
    if ((y<0) and (y<=y1) and (y1<0)) then
     begin
      z:=z-1;
      putpixel(round(nolx+x1*edx),round(noly-y1*edy),red);
     end;
     m:=m+1
   until m>l;
  s:=k*z/l*(max-min)*(b-a);
  str(s:4:2,sts);
  outtextxy(50,420,'�ਡ�. ���祭�� ��⥣ࠫ� '+sts)
end;
   procedure osikoord;
   {����� �� ���न���}
   var
      stri:string;
   begin
    setcolor(magenta);
    line(nolx,miny+15,nolx,maxy-15);{oc� Y}
    line(minx-15,noly,maxx+15,noly);{��� X}
    line(nolx-5,maxy-5,nolx,maxy-15); {��५�� ��� �� Y}
    line(nolx+5,maxy-5,nolx,maxy-15);
    line(maxx+5,noly+5,maxx+15,noly); {��५�� ��� �� X}
    line(maxx+5,noly-5,maxx+15,noly);
    {������� �ᥩ X � Y}
    outtextxy(maxx+10,noly-10,'X');outtextxy(nolx-20,maxy-15,'Y');
   {�뢮� ���祭�� �� X}
    j:=0; for i:=round(a) to round(b) do
     begin
      str(i,stri);
        outtextxy(minx-10+j*round(edx),noly,stri);
        line(minx+j*round(edx),noly,minx+j*round(edx),noly);
       j:=j+1
     end;
     j:=0;
    {�뢮� ���祭��  �� Y}
    for i:=round(min) to round(max)+1 do
     begin
      str(i,stri);
      if i<>0 then
       begin
        outtextxy(nolx+10,miny-j*round(edy)+10,stri);
        line(nolx+5,miny-j*round(edy),nolx,miny-j*round(edy))
       end;
      j:=j+1;
     end
   end;
   procedure maxmin(f:func; var max, min:real);
   {��।������ �������襣� � �������襣� ���祭�� �㭪樨}
    var
        s,c:real;
       begin
        s:=(b-a)/1000;
        max:=f(b);
        min:=f(a);
        for i:=1 to 1000 do
         begin
          c:=a+s*i;
          if f(c)>max then max:=f(c);
          if f(c)<min then min:=f(c)
         end;
         {���砩, ����� �㭪�� ���� ����� ��� ���� ����� ���}
         if min>0 then min:=0;
         if max<0 then max:=0
      end;
   procedure metod_MK_and_grafik(f:func);
    var d:real;
    {M��ᨢ �������� �祪 �� x � �� �}
    f1:array[1..n] of pointtype;
    begin
     setcolor(white);
     outtextxy(10,40,'������ �।�� ��⥣�஢����:');
     input(480,40,a);
     outtextxy(10,100,'����. �।�� ��⥣�஢����:');
     input(480,100,b);
     cleardevice;
     {��।������ �����: k=1,-1 ��� 0}
     if a<b then k:=1
      else
     if a>b then
      begin
       c:=a;a:=b;b:=c;k:=-1;
      end
       else
        k:=0;
      if k=0 then
        begin
         settextstyle(defaultfont,horizdir,10);
         outtextxy(1,10,'�⢥�:0');
         exit
        end;
     maxmin(f,max,min);
     {��ࠬ���� ��� �뢮�� ��䨪� �� �࠭, ����⠡}
      edx:=(maxx-minx)/(b-a);edy:=-(maxy-miny)/(max-min);
     {��������� ��砫� ���न���}
      nolx:=round(maxx-b*edx);noly:=round(maxy+max*edy);
      d:=(b-a)/n;
     {���������� ���ᨢ�� ��� ����஥��� ��䨪�}
     for i:=1 to n do
      begin
       f1[i].x:=round( minx+(i-1)*d*edx );
       f1[i].y:=round( noly-f(a+(i-1)*d)*edy );
      end;
      osikoord;
      setbkcolor(white);
      setcolor(red);
       for i:=1 to n do
       drawpoly(i,f1); {����஥��� ��䨪�}
       randomize; metodmontekarlo(f);
    end;

{$F-}
BEGIN
 {����⨥ ����᪮�� ०���}
 gd:=detect;initgraph(gd,gm,'d:/tp/bgi');
 repeat
  {�뢮� �� �࠭ �㭪⮢ ����}
  cleardevice; setbkcolor(blue);setcolor(magenta);
  settextstyle(defaultfont,horizdir,3);
  outtextxy(20,10,'����� "�����-�����"');
  setcolor(yellow);
  outtextxy(0,120,' ��室               Esc');
  outtextxy(0,160,' ��ࠢ��               1');
  outtextxy(0,200,' ��⥣ࠫ �� cos(x)    2');
  outtextxy(0,240,' ��⥣ࠫ o� �.����� 3');
  settextstyle(defaultfont,horizdir,2);
  outtextxy(20,340,' ������ ����� �㭪� ����');
  {������ case - �믮������ �㭪⮢ ���� � ����ᨬ���
   �� ���������� ���祭�� ��६����� ch, �������� � ����������}
  ch:=readkey;
  case ch of
   '1':begin
        {�뢮� �ࠢ��}
        cleardevice;
        settextstyle(defaultfont,horizdir,2);
        setcolor(white);
        outtextxy(0,20, '���᫥��� ��।��񭭮�� ��⥣ࠫ�');
        outtextxy(0,40, '��⮤�� ���. �ᥫ - "����-��૮"');
        outtextxy(0,80, '�롮� �����⢫���� �� ����:');
        outtextxy(0,100, '1 - �ࠢ��;');
        outtextxy(0,120, '2 - ��⥣ࠫ �� �s(x);');
        outtextxy(0,140, '3 - ��⥣ࠫ �� �㭪樨 �����;');
        outtextxy(0,160, 'Esc - ��室;');
        outtextxy(0,200, '����砭�� ����� Enter ��� Esc;');
        outtextxy(0,220, '�������� ᨬ���� �� ����� BackSpace');
        readln
       end;
   '2':begin
        {���᫥��� ��⥣ࠫ� �� cos(x)}
        cleardevice;
        rectangle(0,0,639,479);
        outtextxy(1,1,'��⥣ࠫ �� cos(x)');
        metod_MK_and_grafik(fTest);
        sinba:=sin(b)-sin(a);
        str(sinba:4:2,ssinba);
        outtextxy(50,460,'��筮� ���祭�� ��⥣ࠫ� '+ssinba);
        readln
       end;
   '3':begin
       {���᫥��� ��⥣ࠫ� �� �㭪樨 ����� }
        cleardevice;
        rectangle(0,0,639,479);
        outtextxy(1,1,'��⥣ࠫ �� �㭪樨 �����,');
        metod_MK_and_grafik(fGauss);
        readln
        end;
  end
 until ch=#27; {��室 �� ��ணࠬ��, #27 - �� ������ Esc}
END.





