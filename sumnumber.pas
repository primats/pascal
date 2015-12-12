# подсчет суммы цифр числа
var a,x:integer;
  i,s:integer;

begin
  writeln('введите целое число');
  readln( a ); x:=a;
  s:=0;
  while ( x<>0 ) do 
  begin
    s := s + (x mod 10);
    x := x div 10;
  end;
 writeln( 'Сумма цифр числа ',a,' = ', s );
end.
