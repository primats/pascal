# создание текстового файла
Program SozdText; {Создание текстового файла}
Var
 Tx : Text; {Имя текстового файла}
 FilName : String; {Имя набора данных}
 Stroka : String; {Строка текста}
 i,n : Integer; {Вспомогательные переменные}
Begin
 Writeln(’Введите имя набора данных’);
 Readln (FilName); {Ввести Имя Набора Данных}
 Assign(Tx,FilName); {Связать Файл с Набором Данных}
 Rewrite (Tx); {Открыть Файл для записи}
 Writeln (’Введите количество строк текста’);
 Readln(n); {Ввести количество строк}
 Writeln (’Введите строки’);
 For i:=1 to n do
 Begin
 Readln (Stroka); {Ввод строки с клавиатуры}
 Writeln(Tx,Stroka); {Запись в файл}
 End;
 Close(Tx); {Закрыть файл}
End.
