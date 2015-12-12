# Умножение прямоугольных матриц
program SumMatrix;
const
  MAXCOUNT = 30; {максимальная размерность матрицы}
type
  {прямоугольная матрица}
  Matrix = array [1..MAXCOUNT, 1..MAXCOUNT] of real;
var
  matr1, matr2: Matrix; {исходные матрицы}
  resmatr: Matrix; {матрица-результат}
  n, m: integer; {реальные размерности матриц}
  min, max: real; {границы диапазона случайных чисел}
  ask: char; {для ввода режима}
 
(*----------------------------------------
Ввод размерностей матрицы
----------------------------------------*)
procedure EnterMatrixSize(var x,y: integer);
begin
  {строки}
  repeat
  write('Введите количество строк матриц (1..',MAXCOUNT,') ');
  readln(x);
  if (x<1) then
  writeln('Ошибка! Размерность матриц не может быть '+
  'меньшей единицы. Повторите ввод.');
  if (x>MAXCOUNT) then
  writeln('Ошибка! Размерность матриц не должна быть '+
  'большей ',MAXCOUNT,'. Повторите ввод.');
  until (x>0)and(x<=MAXCOUNT);
  {столбцы}
  repeat
  write('Введите количество столбцов матриц (1..',MAXCOUNT,') ');
  readln(y);
  if (y<1) then
  writeln('Ошибка! Размерность матриц не может быть '+
  'меньшей единицы. Повторите ввод.');
  if (y>MAXCOUNT) then
  writeln('Ошибка! Размерность матриц не должна быть '+
  'большей ',MAXCOUNT,'. Повторите ввод.');
  until (y>0)and(y<=MAXCOUNT);
end;
 
(*----------------------------------------
Поэлементный ввод прямоугольной матрицы с клавиатуры
----------------------------------------*)
procedure EnterMatrix (x,y: integer; var M: Matrix);
var
  i,j: integer;
begin
  writeln('Введите элементы прямоугольной матрицы:');
  for i:=1 to x do
  for j:=1 to y do begin
  write('M[',i,',',j,'] = ');
  readln(M[i,j]);
  end;
end;
 
(*----------------------------------------
Генерация случайных элементов матрицы в
заданном диапазоне
----------------------------------------*)
procedure GenerateMatrix (x,y: integer; var M: Matrix);
var
  i,j: integer;
begin
  for i:=1 to x do
  for j:=1 to y do
  M[i,j] := random*(max-min)+min;
end;
 
(*----------------------------------------
Поэлементный вывод матрицы на экран в
"естественном" виде (т.е. по строкам)
----------------------------------------*)
procedure PrintMatrix(x,y: integer; M: Matrix);
var
  i,j: integer;
begin
  for i:=1 to x do begin
  for j:=1 to y do
  write(M[i,j]:6:2);
  writeln;
  end;
end;
 
(*----------------------------------------
Процедура перемножает две прямоугольные 
матрицы по формуле линейной алгебры. 
Результат - третья матрица
----------------------------------------
Размерности матриц: m1(n,m), m2(m,n), res(n,n)
----------------------------------------*)
procedure MulOfMatrix(m1, m2: Matrix; var res: Matrix; n, m: integer);
var
  i, j, k: integer;
begin
  for i:=1 to m do
  for j:=1 to m do begin
  res[i,j]:=0;
  for k:=1 to n do
  res[i,j] := m1[i,k]*m2[k,j];
  end;
end;
 
{основная программа}
begin
  writeln('Программа перемножает две '+
  'прямоугольные матрицы');
  EnterMatrixSize(n,m);
  {меню режимов}
  writeln('Выберите вариант заполнения матриц:');
  writeln('1 - с клавиатуры');
  writeln('2 - случайными числами');
  repeat
  readln(ask);
  if (ask<>'1')and(ask<>'2') then
  writeln('Выберите режим 1 или 2, пожалуйста');
  until (ask='1')or(ask='2');
  case (ask) of
  '1': begin
  writeln('Введите элементы первой матрицы');
  EnterMatrix(n, m, matr1);
  writeln('Введите элементы второй матрицы');
  EnterMatrix(m, n, matr2);
  end;
  '2': begin
  randomize;
  write('Введите нижнюю границу диапазона случайных чисел: ');
  readln(min);
  write('Введите верхнюю границу диапазона случайных чисел: ');
  readln(max);
  GenerateMatrix(n, m, matr1);
  GenerateMatrix(m, n, matr2);
  end;
  end;
  writeln('Первая исходная матрица:');
  PrintMatrix(n, m, matr1);
  writeln('Вторая исходная матрица:');
  PrintMatrix(m, n, matr2);
  {считаем и выводим}
  MulOfMatrix(matr1, matr2, resmatr, n, m);
  writeln('Матрица-результат поэлементного сложения:');
  PrintMatrix(n, n, resmatr);
  writeln('Нажмите [Enter] для завершения программы');
  readln;
end.
