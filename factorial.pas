# Вычисление факториала.

Program Factorial;
 Var F,N:integer;

Procedure FACT(N:integer; Var F:integer);
begin
 IF N=0 THEN F:=1
 ELSE
 begin
 FACT(N-1,F);
 F:=N*F
 end
end;

Begin
 Write('Введите число= '); 
 Readln(N);
 FACT(N,F);
 Writeln(F);
 Readln
End.
