program metod_montekarlo;
{Вычисление  интеграла  методом  Монте-Карло}
 uses crt,graph;
 type
   func=function(x:real):real;
 const
  {Положение левой, правой, нижней и верхней границ
  расположения системы координат на экране}
  minx=40;maxx=550;miny=380;maxy=70;
  {Число точек для построения графика с помощью процедуры drawpoly}
  n=150;

 var
    i,j,k,gd,gm,nolx,noly:integer;
    a,b,c,s,max,min,x,y,edx,edy,sinba:real;
    l,m:longint;
    sts,ssinba:string;ch:char;

{$F+}
function fGauss(x:real):real;
{Функция Гаусса - плотность нормального закона распределения}
begin
  fGauss:=1/sqrt(2*pi)*exp(-x*x/2)
end;
function fTest(x:real):real;
{Функция для тестирования}
begin
  fTest:=cos(x) {Первообразная от cos(x) равна sin(x)}
  {Результат легко проверить,
  первообразная от cos(x) равна sin(x)}
end;
{Ввод вещественного числа в графическом режиме}
procedure input(x,y:integer;var xr:real);
 var
   ch:char;kd:integer;
   st:string[10];{строка для ввода не более 10 знаков}
 begin
  st:='';{начальное значение строки}
  setfillstyle(1,0);
  repeat
   ch:=readkey;{чтение символа}
   case ch of
    '0'..'9','.':st:=st+ch; {добавление символа к строке}
    '-': {минус может быть только в начале}
         st:=ch;
    {#8 - клавиша "BackSpace", удаление последнего введённого значения}
    #8:st:=copy(st,1,length(st)-1)
   end;
   {Вывод введённой строки на экран}
   bar(x+16*length(st),y,x+160,y+16);outtextxy(x,y,st);
   {Перевод строки st в число xr}
   val(st,xr,kd);
  {#13 - клавиша "Enter";#27 - клавиша "ESC"}
  {Цикл до нажатия на Enter или ESC и пока не введён хотя бы один символ}
  until ((ch=#13) or (ch=#27)) and (length(st)>0)
end;
{Ввод целого числа в графическом режиме}
procedure inputi(x,y:integer;var nl:longint);
 var ch:char;
     kd:integer;
     st:string[6]; {строка для ввода не более шести знаков}
 begin
  st:='';
  setfillstyle(1,0);
  repeat
   ch:=readkey;
   case ch of
    '0'..'9':st:=st+ch;
    #8: st:=copy(st,1,length(st)-1)
   end;
   {Вывод введённой строки на экран}
   bar(x+16*length(st),y,x+160,y+16);outtextxy(x,y,st);
   val(st,nl,kd); {перевод сироки st в число nl}
  until ((ch=#13) or (ch=#27)) and (length(st)>0)
end;
{Процедура, реализующая метод случайных чисел}
procedure metodmontekarlo(f:func);
 var x1,y1,y:real;
    x:integer;
    m,z:longint;
 begin
  setcolor(blue);
  outtextxy(70,10,'Метод случайных чисел.');
  outtextxy(70,30,'Введите кол-во точек:');
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
  outtextxy(50,420,'Прибл. значение интеграла '+sts)
end;
   procedure osikoord;
   {Рисует оси координат}
   var
      stri:string;
   begin
    setcolor(magenta);
    line(nolx,miny+15,nolx,maxy-15);{ocь Y}
    line(minx-15,noly,maxx+15,noly);{ось X}
    line(nolx-5,maxy-5,nolx,maxy-15); {стрелка для оси Y}
    line(nolx+5,maxy-5,nolx,maxy-15);
    line(maxx+5,noly+5,maxx+15,noly); {стрелка для оси X}
    line(maxx+5,noly-5,maxx+15,noly);
    {Подпись осей X и Y}
    outtextxy(maxx+10,noly-10,'X');outtextxy(nolx-20,maxy-15,'Y');
   {Вывод значений оси X}
    j:=0; for i:=round(a) to round(b) do
     begin
      str(i,stri);
        outtextxy(minx-10+j*round(edx),noly,stri);
        line(minx+j*round(edx),noly,minx+j*round(edx),noly);
       j:=j+1
     end;
     j:=0;
    {Вывод значений  оси Y}
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
   {Определение наименьшего и наибольшего значений функции}
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
         {Случай, когда функция всюду больше или всюду меньше нуля}
         if min>0 then min:=0;
         if max<0 then max:=0
      end;
   procedure metod_MK_and_grafik(f:func);
    var d:real;
    {Mассив вводимых точек по x и по у}
    f1:array[1..n] of pointtype;
    begin
     setcolor(white);
     outtextxy(10,40,'нижний предел интегрирования:');
     input(480,40,a);
     outtextxy(10,100,'верхн. предел интегрирования:');
     input(480,100,b);
     cleardevice;
     {Определение знака: k=1,-1 или 0}
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
         outtextxy(1,10,'Ответ:0');
         exit
        end;
     maxmin(f,max,min);
     {Параметры для вывода графика на экран, масштаб}
      edx:=(maxx-minx)/(b-a);edy:=-(maxy-miny)/(max-min);
     {положение начала координат}
      nolx:=round(maxx-b*edx);noly:=round(maxy+max*edy);
      d:=(b-a)/n;
     {Заполнение массивов для построения графика}
     for i:=1 to n do
      begin
       f1[i].x:=round( minx+(i-1)*d*edx );
       f1[i].y:=round( noly-f(a+(i-1)*d)*edy );
      end;
      osikoord;
      setbkcolor(white);
      setcolor(red);
       for i:=1 to n do
       drawpoly(i,f1); {построение графика}
       randomize; metodmontekarlo(f);
    end;

{$F-}
BEGIN
 {Открытие графического режима}
 gd:=detect;initgraph(gd,gm,'d:/tp/bgi');
 repeat
  {Вывод на экран пунктов меню}
  cleardevice; setbkcolor(blue);setcolor(magenta);
  settextstyle(defaultfont,horizdir,3);
  outtextxy(20,10,'МЕТОД "МОНТЕ-КАРЛО"');
  setcolor(yellow);
  outtextxy(0,120,' Выход               Esc');
  outtextxy(0,160,' Справка               1');
  outtextxy(0,200,' Интеграл от cos(x)    2');
  outtextxy(0,240,' Интеграл oт фн.Гаусса 3');
  settextstyle(defaultfont,horizdir,2);
  outtextxy(20,340,' Введите номер пункта меню');
  {Оператор case - выполнение пунктов меню в зависимости
   от введенного значения переменной ch, вводимой с клавиатуры}
  ch:=readkey;
  case ch of
   '1':begin
        {Вывод справки}
        cleardevice;
        settextstyle(defaultfont,horizdir,2);
        setcolor(white);
        outtextxy(0,20, 'Вычисление определённого интеграла');
        outtextxy(0,40, 'методом случ. чисел - "Монте-Карло"');
        outtextxy(0,80, 'Выбор осуществляется из меню:');
        outtextxy(0,100, '1 - справка;');
        outtextxy(0,120, '2 - интеграл от соs(x);');
        outtextxy(0,140, '3 - интеграл от функции Гаусса;');
        outtextxy(0,160, 'Esc - выход;');
        outtextxy(0,200, 'Окончание ввода Enter или Esc;');
        outtextxy(0,220, 'Удаление символа при вводе BackSpace');
        readln
       end;
   '2':begin
        {Вычисление интеграла от cos(x)}
        cleardevice;
        rectangle(0,0,639,479);
        outtextxy(1,1,'Интеграл от cos(x)');
        metod_MK_and_grafik(fTest);
        sinba:=sin(b)-sin(a);
        str(sinba:4:2,ssinba);
        outtextxy(50,460,'Точное значение интеграла '+ssinba);
        readln
       end;
   '3':begin
       {Вычисление интеграла от функции Гаусса }
        cleardevice;
        rectangle(0,0,639,479);
        outtextxy(1,1,'Интеграл от функции Гаусса,');
        metod_MK_and_grafik(fGauss);
        readln
        end;
  end
 until ch=#27; {выход из апрограммы, #27 - по клавише Esc}
END.





