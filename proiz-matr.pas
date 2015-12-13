{произведение матриц, использование процедур
 с параметром}
program wwod3;
  uses crt;
  {Раздел описания констант: nmax и mmax -
   максимально возможное число строк и столбцов.
   В случае необходимости можно изменить}
  const
       nmax=10;mmax=10;
 {определение типа переменных, необходимо для параметра процедуры}
  type
       vector = array[1..mmax] of real;
       {тип "матрица" определен как массив векторов}
       matrica= array[1..nmax] of vector;
  var
       n,m,k,i,j,s:integer;
       sum:real;
       {A,B,C определеяемого типа matrica}
       A,B,C:matrica;
       quit:char;
       {процедура ввода с параметрами n,m,A;
        параметр A типа var (переменная)- "передаваемый" параметр}
       procedure wwod(n,m:integer; var A:matrica);
        var i,j:integer;
         begin
          for i:=1 to n do
            begin
             writeln('Введите ',i,'-ую строку');
             for j:=1 to m do read(a[i,j]);
            end;
            writeln;clrscr;
         end;
         {процедура вывода}
         procedure wywod(n,m:integer;A:matrica);
          var i,j:integer;
          begin
            for i:=1 to n do
             begin
              writeln;
              for j:=1 to m do write(a[i,j]:4:1,' ');
             end;
             writeln;
          end;
     Begin
         repeat
          clrscr;
           write('n=');readln(n);
           write('k=');readln(k);
           write('m=');readln(m);
           writeln('Первая матрица');
           writeln('строк - ',n,' столбцов - ',k);
           wwod(n,k,A);
           writeln('Вторая матрица');
           writeln('строк - ',k,' столбцов - ',m);
           wwod(k,m,B);
           writeln('Первая матрица:');
           wywod(n,k,A);
           writeln('Вторая матрица:');
           wywod(k,m,b);
           {Нахождение произведения матриц C=A*B}
           for i:=1 to n do
            for j:=1 to m do
             begin
               sum:=0;
               for s:=1 to k do sum:=sum+a[i,s]*b[s,j];
               c[i,j]:=sum;
             end;
           writeln('Произведение матриц:');
           wywod(n,m,C);
       {Выход по клавише Esc}
       until readkey = #27;
     end.



