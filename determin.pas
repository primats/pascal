{���� 1_11.pas}
program determinant_tri_na_tri;
 uses crt;
 var a: array[1..3,1..3] of real;
     det: real;
     i,j: integer;
begin
 clrscr;
 repeat
    writeln('������ ������ ���쥣� ���浪�:');
    writeln('�������� ��ப� �१ �஡��, ��⥬ ������ <Enter>');
    for i:=1 to 3 do
      for j:=1 to 3 do read(a[i,j]);
    det:=a[1,1]*a[2,2]*a[3,3]+a[2,1]*a[3,2]*a[1,3]+
    a[3,1]*a[1,2]*a[2,3]-a[1,1]*a[3,2]*a[2,3]-
    a[2,1]*a[1,2]*a[3,3]-a[3,1]*a[2,2]*a[1,3];
    writeln('��।���⥫� ������ ');
    for i:=1 to 3 do
           begin
             for j:=1 to 3 do write(a[i,j]:6:2);
             writeln;
           end;
   writeln('ࠢ�� ', det:6:2);
   writeln('��� ��室� ������ Esc, ��㣠� ������ - ���� ����');
  until readkey = #27;
end.

