program metod_naim_kwadr;
{Метод наименьших квадратов}
 uses crt;
 const  max=20;
 type  massiv=array[1..3,1..4] of real;
 var
  xy:array[1..2,1..max] of real;
  b,a0,a1,a2,s:real; i,j,n:byte;
 procedure linapr(n:byte);
  var  xsred,ysred,sum1,sum2,s:real;
  begin
   xsred:=0; ysred:=0; sum1:=0; sum2:=0;
   for i:=1 to n do
    begin
     xsred:=xsred+xy[1,i]; ysred:=ysred+xy[2,i];
     sum1:=sum1+(xy[1,i]*xy[2,i]);
     sum2:=sum2+(xy[1,i]*xy[1,i]);
    end;
   xsred:=xsred/n;ysred:=ysred/n;
   sum1:=sum1/n; sum2:=sum2/n;
   b:=(sum1-(xsred*ysred)) / (sum2-(xsred*xsred));
   a0:=ysred-(b*xsred);
   write('ПРЯМАЯ: '); writeln('y=',b:5:2,'* x  + ',a0:5:2);
   s:=0;  for i:=1 to n do s:=s+sqr(xy[2,i]-b*xy[1,i]-a0);
   writeln('Сумма квадратов отклонений = ',s:5:3);
 end;
 procedure stepenapr(n:byte);
  var  xsred,ysred,sum1,sum2,s:real;
  lxy:array[1..2,1..max] of real;
  begin
   xsred:=0; ysred:=0; sum1:=0; sum2:=0;
   for i:=1 to 2 do for j:=1 to n do
      if xy[i,j]<>0  then lxy[i,j]:=ln(abs(xy[i,j]))
      else  lxy[i,j]:=0;
   for i:=1 to n do
    begin
     xsred:=xsred+lxy[1,i]; ysred:=ysred+lxy[2,i];
     sum1:=sum1+(lxy[1,i]*lxy[2,i]);
     sum2:=sum2+(lxy[1,i]*lxy[1,i]);
    end;
   xsred:=xsred/n;ysred:=ysred/n;
   sum1:=sum1/n; sum2:=sum2/n;
   b:=(sum1-(xsred*ysred)) / (sum2-(xsred*xsred));
   a0:=ysred-(b*xsred);
   write('СТЕПЕННАЯ: '); writeln('y=',exp(a0):5:2,'* x ^ ',b:5:2);
   s:=0;  for i:=1 to n do s:=s+sqr(xy[2,i]-exp(a0+b*lxy[1,i]));
   writeln('Сумма квадратов отклонений = ',s:5:3);
 end;
 procedure pokazatelnapr(n:byte);
  var  xsred,ysred,sum1,sum2,s:real;
  ly:array[1..max] of real;
  begin
   xsred:=0; ysred:=0; sum1:=0; sum2:=0;
   for j:=1 to n do
      if xy[2,j]<>0  then ly[j]:=ln(abs(xy[2,j]))
      else  ly[j]:=-1e10;
   for i:=1 to n do
    begin
     xsred:=xsred+xy[1,i]; ysred:=ysred+ly[i];
     sum1:=sum1+(xy[1,i]*ly[i]);
     sum2:=sum2+(xy[1,i]*xy[1,i]);
    end;
   xsred:=xsred/n;ysred:=ysred/n;
   sum1:=sum1/n; sum2:=sum2/n;
   b:=(sum1-(xsred*ysred)) / (sum2-(xsred*xsred));
   a0:=ysred-(b*xsred);
   write('ПОКАЗАТЕЛЬНАЯ: ');
   writeln('y=',exp(a0):5:2,'* ',exp(b):5:2,'^ x ');
   s:=0; for i:=1 to n do s:=s+sqr(xy[2,i]-exp(a0+b*xy[1,i]));
   writeln('Сумма квадратов отклонений = ',s:5:3);
 end;
  procedure giperbapr(n:byte);
   var  xsred,ysred,sum1,sum2,s:real;
  z:array[1..max] of real;
  begin
   xsred:=0; ysred:=0; sum1:=0; sum2:=0;
   for j:=1 to n do
      if xy[1,j]<>0  then z[j]:=1/xy[1,j]
      else  z[j]:=1e10;
   for i:=1 to n do
    begin
     xsred:=xsred+z[i]; ysred:=ysred+xy[2,i];
     sum1:=sum1+(z[i]*xy[2,i]); sum2:=sum2+(z[i]*z[i]);
    end;
   xsred:=xsred/n;ysred:=ysred/n; sum1:=sum1/n; sum2:=sum2/n;
   b:=(sum1-(xsred*ysred)) / (sum2-(xsred*xsred));
   a0:=ysred-(b*xsred);
   write('ГИПЕРБОЛА:'); writeln('y=',b:5:2,'/ x  + ',a0:5:2);
   s:=0;  for i:=1 to n do s:=s+sqr(xy[2,i]-(a0+b*z[i]));
   writeln('Сумма квадратов отклонений = ',s:5:3);
 end;
 function delta(a:massiv;j:byte):real;
 {Вычисление определителей системы уравненений;
 при j=0 - главный, при j=1,2,3 - по переменным}
  var i:byte;
  begin
    if j<>0 then  for i:=1 to 3 do  a[i,j]:=a[i,4];
    delta:=a[1,1]*a[2,2]*a[3,3]+a[2,1]*a[3,2]*a[1,3]+
    a[3,1]*a[1,2]*a[2,3]-a[1,1]*a[3,2]*a[2,3]-
    a[2,1]*a[1,2]*a[3,3]-a[3,1]*a[2,2]*a[1,3];
   end;
 procedure kwadrapr(n:byte);
  var
    i,j:byte;a:massiv; delta0,x:real;
  begin
   for i:=1 to 3 do for j:=1 to 4 do a[i,j]:=0;
   for i:=1 to n do
    begin
      a[1,2]:=a[1,2]+xy[1,i];a[1,3]:=a[1,3]+sqr(xy[1,i]);
      a[1,4]:=a[1,4]+xy[2,i];
      a[2,3]:=a[2,3]+sqr(xy[1,i])*xy[1,i] ;
      a[2,4]:=a[2,4]+xy[1,i]*xy[2,i] ;
      a[3,3]:=a[3,3]+sqr(sqr(xy[1,i]));
     a[3,4]:=a[3,4]+xy[2,i]*sqr(xy[1,i]);
    end;
   a[1,1]:=n; a[2,1]:=a[1,2]; a[2,2]:=a[1,3];  a[3,1]:=a[2,2];
   a[3,2]:=a[2,3];  delta0:=delta(a,0);
   if delta0 <> 0 then
    begin
     a0:=delta(a,1)/delta0; a1:=delta(a,2)/delta0;
     a2:=delta(a,3)/delta0;
    end;
   write('ПАРАБОЛА: ');
   writeln('Y=',a2:6:2,'*x*x+ ',a1:6:2,'*x+ ',a0:6:2);
   s:=0;  for i:=1 to n do
    begin
      x:=a0+a1*xy[1,i]+a2*sqr(xy[1,i]); s:=s+sqr(x-xy[2,i]);
    end;
   write('Cумма квадратов отклонений ');writeln('=',s:5:3);
  end;
BEGIN
 clrscr; writeln('Уравнение регрессии (метод наименьших квадратов)');
 repeat  write('Число точек:'); read(n); until n>=3;
 writeln('Введите исходные данные по точкам, X и Y:');
 for i:=1 to n do
 begin
  writeln('точка', i:2,':'); read(xy[1,i]);
  gotoXY(whereX+4,whereY-1);read(xy[2,i]);
 end;
 {n:=10;
 xy[1,1]:=0.01  xy[2,1]:=6.698 xy[1,2]:=0.02  xy[2,2]:=17.20
 xy[1,3]:=0.04  xy[2,3]:=28.64 xy[1,4]:=0.1  xy[2,4]:=45.45
 xy[1,5]:=0.2  xy[2,5]:=59.67  xy[1,6]:=0.3  xy[2,6]:=68.68
 xy[1,7]:=0.4  xy[2,7]:=75.42 xy[1,8]:=0.5  xy[2,8]:=80.86
 xy[1,9]:=0.6  xy[2,9]:=85.45 xy[1,10]:=0.7  xy[2,10]:=89.45}
 {xy[1,11]:=  xy[2,11]:=  xy[1,12]:=  xy[2,12]:=}

 linapr(n);kwadrapr(n);stepenapr(n);giperbapr(n);pokazatelnapr(n);
 repeat until keypressed;
END.