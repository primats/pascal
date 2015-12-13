{���᫥��� ���頤�, ��࠭�祭��� �६� ��䨪���,
��宦����� �祪 ����祭�� ��䨪�� ��⮤��
����������� �������, ���᫥��� ���頤� ��⮤�� �।��� ��אַ㣮�쭨���,
�뢮� ��䨪�� �� �࠭ � ����᪮� ०���}
program plosh_graf_uravn_integral;
 uses crt,graph;
 const
    minx=90;maxx=550;{����� � �ࠢ�� �࠭��� ��⥬� ���न���}
    miny=460;maxy=40; {������ � ������ �࠭��� ��⥬� ���न���}
    minmasx=0;maxmasx=3.5; {���࠭�祭�� �� �����⨬��� ����⠡�}
    minmasy=0;maxmasy=2.5;
    n=100; {������ ���ᨢ�, �� ���஬� ��ந��� ��䨪}
    e=0.00001;{��筮��� ���᫥��� ����}

type
 func=function(x:real):real;
var
   {gd,gm - ����� �ࠩ��� � ����� ����᪮�� ०���}
   gd,gm,i,j,nolx,noly:integer;
   edx,edy,a,b,x1,x2,x3,s1,s2:real;
   {M��ᨢ� �������� �祪 �� x � �� �}
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
    i1,s,d:real;n,k:integer;   { ��楤�� ���᫥��� ��⥣ࠫ� }
 begin                       { ��  f �� a �� b c �筮���� e  }
     d:=b-a;               { ��⮤�� 業�ࠫ��� ��אַ㣮�쭨��� }
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
  {��⠭���� ����᪮�� ०��� � ����⠡� �뢮�� �� �࠭
  (edx, edy - ������⢮ ���ᥫ�� � ������ �� �c� X � Y)}
 begin
    {�।����������, �� ���� � ����᪮�� �ࠩ���� egavga.bgi
     d:\tp\bgi,�᫨ �� ⠪, � �㦭� ��ࠢ���}
     gd:=detect;initgraph(gd,gm,'d:/tp/bgi');
     if graphresult<>grok then halt(1);
     cleardevice;
     {����⠡ �뢮�� �� �࠭, ��������� ��砫� ���न���}
     edx:=(maxx-minx)/(maxmasx-minmasx);
     edy:=-(maxy-miny)/(maxmasy-minmasy);
     nolx:=round(maxx-maxmasx*edx);
     noly:=round(maxy+maxmasy*edy)
  end;
 procedure osikoord;
   {����� �� ���न���}
   var
      i:integer;stri:string;
   begin
    setcolor(blue);
    line(nolx,miny,nolx,maxy);{oc� y}
    line(minx,noly,maxx,noly);{��� x}
    line(nolx-5,maxy+15,nolx,maxy); {��५�� ��� �� y}
    line(nolx+5,maxy+15,nolx,maxy); {��५�� ��� �� y}
    line(maxx-15,noly+5,maxx,noly); {��५�� ��� �� x}
    line(maxx-15,noly-5,maxx,noly); {��५�� ��� �� x}
    outtextxy(nolx-10,maxy,'Y');{�뢮� Y}
    outtextxy(maxx,noly+10,'X');{�뢮� X}
   {�뢮� ���祭�� �� �� X}
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
{    �뢮� ���祭�� �� �� Y}
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
     d:=(maxmasx-minmasx)/n; {������ ��䨪� �� ��� �� X}
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
 writeln('�஬���⮪ ��� ���᪠ ��୥�: �� a �� b');
 write( ' a= '); readln(a);  write(' b= '); readln(b);
 writeln('���न���� ����祭�� ��䨪��');
 writeln('��ࢮ� �ࠢ����� exp(-x^2)+0.5=ln(2+x*x) ');
 reshur(f21,a,b,x1); writeln('x1=',x1:6:4);
 writeln('��஥ �ࠢ����� ln(2+x*x)=2*cos(2x/3)');
 reshur(f23,a,b,x2); writeln('x2=',x2:6:4);
 writeln('���� �ࠢ����� exp(-x*x+0.5)=2*cos(2x/3) ');
 reshur(f31,a,b,x3); writeln('x3=',x3:6:4);
 integral(f21,x1,x2,s1);integral(f31,x2,x3,s2);
 writeln('���頤� ����� ���� � ����  ��䨪��� ',s1:6:4);
 writeln('���頤� ����� ���쨬 � ���� ��䨪��� ',s2:6:4);
 s1:=s1+s2;
 writeln('���頤� ࠢ�� ',s1:6:4);   readln;
 SetGraphMode(gm);
 osikoord; grafiki;
 str(s1:10:6,ss1);
 outtextxy(200,240,'���頤�, ��࠭�祭��� �६� ��䨪��� ='+ss1);
 readln
End.


