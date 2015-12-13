program Analiz_FUNkcij_postroenie_grafikov;
{¯®áâà®¥­¨¥  £à ä¨ª®¢
 äã­ªæ¨©  ­   ®á­®¢¥ á¨­â ªá¨ç¥áª®£®  ­ «¨§ â®à   ¢¢®¤¨¬ëå
 ¢ëà ¦¥­¨©; äã­ªæ¨ï ¢¢®¤¨âáï ¢ ¢¨¤¥ á¨¬¢®«ì­®£® ¢ëà ¦¥­¨ï}

{„«ï  à ¡®âë  ¯à®£à ¬¬ë   âà¥¡ã¥âáï ãª § âì  ¯ãâì  ª  ä ©«ã
 ¥gavga.bgi,  ª®¬¬¥­â à¨©  ¢  à §¤¥«¥ ®¯¥à â®à®¢, ¯à®æ¥¤ãà 
 initgraph}


USES Graph, Crt;

VAR
   errorr1, errorr2 : boolean;
   a, b, c, m, n, x, p, q, x1, x2 : real;
   u, uu, uuu, uuuu : char;
   cc, mn, nm, ii, i,jj, j, k, Gdriver, Gregim, cf, cd, dd, cs:integer;
   st, dst, ddst, v : string;
{áç¨âë¢ ­¨¥ áâà®ª¨}
procedure readxy(x,y:integer;var c:string);
  var g:char;
  Begin
    c:='';
    setcolor(red);
    for k:=1 to 10 do
       begin
         str(k,v);
         outtextxy(10,10+20*(k-1),'F'+v);
         outtextxy(10,230+20*(k-1),'F'+v);
       end;
     setcolor(white);
     outtextxy(35,10,'   SIN');
     outtextxy(35,30,'   COS');
     outtextxy(35,50,'   TG');
     outtextxy(35,70,'   CTG');
     outtextxy(35,90,'   SEC');
     outtextxy(35,110,' COSEC');
     outtextxy(35,130,' ARCSIN');
     outtextxy(35,150,' ARCCOS');
     outtextxy(35,170,' ARCTG');
     outtextxy(35,190,' ARCCTG');

     outtextxy(15,210,'S H I F T');

     outtextxy(35,230,'   SH');
     outtextxy(35,250,'   CH');
     outtextxy(35,270,'   TH');
     outtextxy(35,290,'  CTH');
     outtextxy(35,310,'  SCH');
     outtextxy(35,330,'  CSCH');
     outtextxy(35,350,' ARSH');
     outtextxy(35,370,' ARCHPM');
     outtextxy(35,390,' ARTH');
     outtextxy(35,410,' ARCTH');
     g:=' ';
     while g<>#13 do
      begin
        repeat until keypressed;
        g:=readkey;
        if not(g in [#0,#8,#13]) then  c:=c+g else
        if g=#8 then c:=copy(c,1,length(c)-1) else
        if g=#0 then
        begin
          g:=readkey;
          case g of
            #59:c:=c+'sin';
            #60:c:=c+'cos';
            #61:c:=c+'tg';
            #62:c:=c+'ctg';
            #63:c:=c+'sec';
            #64:c:=c+'cosec';
            #65:c:=c+'arcsin';
            #66:c:=c+'arccos';
            #67:c:=c+'arctg';
            #68:c:=c+'arcctg';
            #84:c:=c+'sh';
            #85:c:=c+'ch';
            #86:c:=c+'th';
            #87:c:=c+'cth';
            #88:c:=c+'sch';
            #89:c:=c+'csch';
            #90:c:=c+'arsh';
            #91:c:=c+'archpm';
            #92:c:=c+'arth';
            #93:c:=c+'arcth';
          end;
        end;
        bar(x,y,638,y+10);
        outtextxy(x,y,c);
      end;
      bar(1,1,100,478);
  End;
 {¯à¨¢¥¤¥­¨¥ äã­ªæ¨¨ ¢ ­®à¬ «ì­ãî ä®à¬ã}
function normal(s:string):string;
  var i11:integer;
  Begin
   i11:=1;
   while i11<length(s)-1 do
    begin
     if (s[i11]='(') and (s[i11+2]=')') then
       begin
         delete(s,i11,1);
         delete(s,i11+1,1);
         i11:=i11-1;
        end;
     i11:=i11+1;
    end;
    i11:=1;
    while i11<length(s) do
     begin
       if (copy(s,i11,2)='*1') or (copy(s,i11,2)='1*')
                               or (copy(s,i11,2)='^1') then
       begin delete(s,i11,2); i11:=i11-1; end;
       i11:=i11+1;
     end;
     normal:=s;
  End;
{     ***                                                                }
{    *  *                                                                }
{   *   *  *   *    * *    * *  *   *  * * *    * *  * * *  * * *  * * * }
{  *    *  *   *   *  *   *  *  *  **  *   *   *  *    *    *   *  *   * }
{  ******  * * *  *   *  *   *  * * *    **   * * *    *    *   *  * * * }
{  *    *  *   *  * * *  *   *  **  *  *   *  *   *    *    *   *  *     }
{  *    *  *   *  *   *  *   *  *   *  * * *  *   *    *    * * *  *     }

function roundd(x:real):integer;
   begin
    if abs(x)<216
     then roundd:=round(x)
     else
     roundd:=216*round(abs(x)/x);
   end;
  {®ç¨áâª  ¯®«®áë íªà ­ }
  procedure clr;
   begin
    setfillstyle(1,blue);
    bar(101,434,638,478);
   end;
   {”“Š–ˆŸ ‚›—ˆ‘‹…ˆŸ ‘’Šˆ (™…ƒ ‚ˆ„€)}
   function f(s:string;x:real;var e:boolean):real;
    var
      i11,i22,jj1,jj2,jj3,jj4:integer;
      a,r,w:real;
    {”“Š–ˆŸ ‚›—ˆ‘‹…ˆŸ ‘’Šˆ (…‡ ‡€Š‚ + -)}
    function g(s:string;x:real;var e:boolean):real;
      VAR
       j1,j2,j3,j4,z1,z2,z3,z4,i1,i2,i3,u,y:integer;
       a,b:real;
     {”“Š–ˆŸ ‚›—ˆ‘‹…ˆŸ ‘’Šˆ (…‡ ‡€Š‚ * : / ^)}
    function h(s:string;x:real;var e:boolean):real;
       VAR
        i,l:integer;
        c,b,r:real;
    Begin
        l:=length(s);
        if l=0 then
                  b:=0
             else
        if s[1]='('then
              b:=f(copy(s,2,l-2),x,e)
             else
        if s[1]='|'then
              b:=abs(f(copy(s,2,l-2),x,e))
             else
        if s[1]='['then
             begin
                 r:=f(copy(s,2,l-2),x,e);
                 if r >= 0
                  then
                   b := trunc(r)
                  else
                   b := trunc(r) - 1;
             end
             else
        if s[1]='{'then
             begin
                  r:=f(copy(s,2,l-2),x,e);
                  if r >= 0
                   then
                    b := frac(r)
                   else
                    b := frac(r+5+trunc(abs(r)));
             end
             else
       if copy(s,1,2)='tg' then
             begin
               c:=h(copy(s,3,l-2),x,e);
                  if cos(c)=0 then
                                e:=true
                              else
                                b:=sin(c)/cos(c);
             end
             else
       if copy(s,1,2)='ln' then
             begin
                c:=h(copy(s,3,l-2),x,e);
                    if c<=0 then
                               e:=true
                            else
                               b:=ln(c);
             end
             else
       if copy(s,1,2)='lg' then
             begin
                 c:=h(copy(s,3,l-2),x,e);
                     if c<=0 then
                                e:=true
                             else
                                b:=ln(c)/ln(10);
             end
             else
       if copy(s,1,2)='sh' then
             begin
                 c:=h(copy(s,3,l-2),x,e);
                 b:=(exp(c)-exp(-c))/2
             end
             else
       if copy(s,1,2)='ch' then
             begin
                 c:=h(copy(s,3,l-2),x,e);
                 b:=(exp(c)+exp(-c))/2
             end
             else
        if copy(s,1,2)='th' then
             begin
                 c:=h(copy(s,3,l-2),x,e);
                 b:=(exp(c)-exp(-c))/(exp(c)+exp(-c));
             end
             else
        if copy(s,1,3)='cth' then
             begin
                 c:=h(copy(s,4,l-3),x,e);
                 if c=0 then e:=true
                    else
                 b:=(exp(c)+exp(-c))/(exp(c)-exp(-c));
              end
              else
        if copy(s,1,4)='csch' then
              begin
                 c:=h(copy(s,4,l-3),x,e);
                 if c=0 then e:=true
                    else
                  b:=2/(exp(c)-exp(-c));
              end
              else
        if copy(s,1,3)='sch' then
              begin
                 c:=h(copy(s,4,l-3),x,e);
                 b:=2/(exp(c)+exp(-c));
              end
              else
       if copy(s,1,3)='ctg' then
              begin
                c:=h(copy(s,4,l-3),x,e);
                     if sin(c)=0 then
                                    e:=true
                                 else
                                    b:=cos(c)/sin(c);
              end
              else
       if copy(s,1,3)='exp' then
               b:=exp(h(copy(s,4,l-3),x,e))
              else
       if copy(s,1,3)='abs' then
               b:=abs(h(copy(s,4,l-3),x,e))
              else
       if copy(s,1,3)='sin' then
               b:=sin(h(copy(s,4,l-3),x,e))
              else
       if copy(s,1,5)='cosec' then
              begin
                  c:=h(copy(s,6,l-5),x,e);
                        if sin(c)=0 then
                                       e:=true
                                    else
                                       b:=1/sin(c);
              end
              else
       if copy(s,1,3)='cos' then
               b:=cos(h(copy(s,4,l-3),x,e))
              else
       if copy(s,1,3)='sec' then
              begin
                 c:=h(copy(s,4,l-3),x,e);
                       if cos(c)=0 then
                                      e:=true
                                   else
                                      b:=1/cos(c);
              end
              else
       if copy(s,1,4)='arsh' then
              begin
                  c:=h(copy(s,5,l-4),x,e);
                  b:=ln(c+sqrt(c*c+1));
              end
              else
        if copy(s,1,4)='arth' then
              begin
                  c:=h(copy(s,5,l-4),x,e);
                         if sqr(c)>=1 then
                                        e:=true
                                     else
                                        b:=ln((1+c)/(1-c))/2;
              end
              else
        if copy(s,1,5)='arcth' then
              begin
                  c:=h(copy(s,6,l-5),x,e);
                         if sqr(c)<=1 then
                                        e:=true
                                     else
                                        b:=ln((c+1)/(c-1))/2;
              end
              else
        if copy(s,1,5)='archp' then
              begin
                      c:=h(copy(s,6,l-5),x,e);
                         if c<1 then
                                        e:=true
                                     else
                                        b:=ln(c+sqrt(c*c-1));
              end
              else
       if copy(s,1,5)='archm' then
              begin
                  c:=h(copy(s,6,l-5),x,e);
                         if c<1 then
                                        e:=true
                                     else
                                        b:=ln(c-sqrt(c*c-1));
              end
              else
       if copy(s,1,5)='arctg' then
                b:=arctan(f(copy(s,6,l-5),x,e))
              else
       if copy(s,1,6)='arcctg' then
                 b:=pi/2-arctan(f(copy(s,7,l-6),x,e))
               else
       if copy(s,1,6)='arccos' then
               begin
                 c:=h(copy(s,7,l-6),x,e);
                        if c*c>1 then
                                    e:=true
                                 else
                        if c>0 then
                                   b:=arctan(sqrt(1-c*c)/c)
                                else
                        if c<0 then
                                   b:=pi+arctan(sqrt(1-c*c)/c)
                                else
                                b:=pi/2;
               end
               else
       if copy(s,1,6)='arcsin' then
               begin
                c:=(h(copy(s,7,l-6),x,e));
                        if c*c>1 then
                                    e:=true
                                 else
                        if c*c<>1 then
                                     b:=arctan(c/sqrt(1-c*c))
                                  else
                                     b:=c*pi/2;
               end
               else
       if copy(s,1,4)='sqrt' then
               begin
                 c:=h(copy(s,5,l-4),x,e);
                         if c<0 then
                                   e:=true
                                else
                                   b:=sqrt(c);
                                end
               else
       if copy(s,1,2)='pi' then
                             b:=pi
               else
       if s[1]='e' then
                       b:=exp(1)
               else
            if s[1]='x' then
                       b:=x
               else
               begin
                       val(copy(s,1,l),b,i);
                         if i<>0 then
                        e:=true;
               end;
        h:=b;
    End;{h}
    Begin{g}
      a:=1;i1:=1;
      while i1<=length(s) do
      begin
       j1:=0;j2:=0;j3:=0;j4:=0;i2:=i1;
       while (i2<=length(s)) and not((j1*j1+j2*j2+j3*j3+j4*j4=0)
             and (s[i2] in ['*','/',':'])) do
          begin
              if s[i2]='(' then j1:=j1+1;
              if s[i2]=')' then j1:=j1-1;
              if s[i2]='[' then j2:=j2+1;
              if s[i2]=']' then j2:=j2-1;
              if s[i2]='{' then j3:=j3+1;
              if s[i2]='}' then j3:=j3-1;
              if s[i2]='|' then
              begin
               i:=i2;
               while (s[i]='|') and (i<>0) do i:=i-1;
               if (i=0) or
               (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      j4:=j4+1
                    else
                      j4:=j4-1;
              end;
              i2:=i2+1;
          end;
          z1:=0;z2:=0;z3:=0;z4:=0;i3:=i1;
          while (i3<i2) and not((z1*z1+z2*z2+z3*z3+z4*z4=0)
                and (s[i3]='^')) do
           begin
              if s[i3]='(' then z1:=z1+1;
              if s[i3]=')' then z1:=z1-1;
              if s[i3]='[' then z2:=z2+1;
              if s[i3]=']' then z2:=z2-1;
              if s[i3]='{' then z3:=z3+1;
              if s[i3]='}' then z3:=z3-1;
              if s[i3]='|' then
                begin
                  i:=i3;
                  while (s[i]='|') and (i<>0) do i:=i-1;
                  if (i=0) or
                  (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      z4:=z4+1
                    else
                      z4:=z4-1;
                end;
              i3:=i3+1;
           end;
          if i3<>i2 then
           begin
            r:=h(copy(s,i1,i3-i1),x,e);
            w:=h(copy(s,i3+1,i2-i3-1),x,e);
            val(copy(s,i3+1,i2-i3-1),u,y);
            if y=0 then
              begin
                if r=0 then b:=0
                else
                 b:=exp(ln(abs(r))*w);
               if odd(u) and (r<0) then b:=-b;
              end
            else
            if r<0 then e:=true
            else
            if r=0 then b:=0
            else
            b:=exp(ln(r)*w);
           end
           else
            b:=h(copy(s,i1,i2-i1),x,e);
       if i1=1 then a:=b
        else
        if s[i1-1]='*' then a:=a*b
         else
         if s[i1-1] in ['/',':'] then
         if b=0 then e:=true
              else a:=a/b;
       i1:=i2+1;
      end;
       g:=a;
    End{g};
    Begin{f}
     i11:=1; a:=0;
     while i11<=length(s) do
     begin
      jj1:=0;jj2:=0;jj3:=0;jj4:=0;i22:=i11;
      while (i22<=length(s)) and not((jj1*jj1+jj2*jj2+jj3*jj3+jj4*jj4=0)
       and (s[i22] in ['+','-']) and not(s[i22-1]='^')) do
       begin
              if s[i22]='(' then jj1:=jj1+1;
              if s[i22]=')' then jj1:=jj1-1;
              if s[i22]='[' then jj2:=jj2+1;
              if s[i22]=']' then jj2:=jj2-1;
              if s[i22]='{' then jj3:=jj3+1;
              if s[i22]='}' then jj3:=jj3-1;
              if s[i22]='|' then
              begin
               i:=i22;
               while (s[i]='|') and (i<>0) do i:=i-1;
               if (i=0) or
               (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      jj4:=jj4+1
                    else
                      jj4:=jj4-1;
              end;
         i22:=i22+1;
       end;
       if (i11=1) and (s[1]='-') then a:=0 else
       if i11=1 then a:=g(copy(s,i11,i22-i11),x,e) else
       case s[i11-1] of
        '+': a:=a+g(copy(s,i11,i22-i11),x,e);
        '-': a:=a-g(copy(s,i11,i22-i11),x,e);
       end;
       i11:=i22+1;
     end;
     f:=a;
    End;{f}
{ * * *                                                                          }
{ *   *  * * *  * * *  *   *  * * *  * * *  * * *    *    *   *     *   * * * }
{ *   *  *   *  *   *  *  **  *   *  *   *  *   *   * *   *   *   *  *  *   * }
{ *   *  * * *  *   *  * * *     **  * **   *   *  *   *  * * *  *   *  * * * }
{ *   *  *      *   *  **  *  *   *  *   *  *   *  *   *  *   *  * * *   *  * }
{ *   *  *      * * *  *   *  * * *  * * *  * * * ** * ** *   *  *   *  *   * }
function df(s:string):string;
    var
      i11,i22,jj1,jj2,jj3,jj4,i3:integer;
      a,b:string;
     function dg(s:string):string;
      var
       j1,j2,j3,j4,z1,z2,z3,z4,i1,i2,i3,u,y:integer;
       a,b,r,w,o:string;
      function dh(s:string):string;
       var
        j1,j2,j3,j4,z1,z2,z3,z4,i1,i2,i3,i,l:integer;
        a,b,r,w:string;
        d:real;
       Begin {dh}
         b:='';
         l:=length(s);
         if s[1]='('then
              b:='('+df(copy(s,2,l-2))+')'
                    else
         if s[1]='|'then
         b:='|'+(copy(s,2,l-2))+'|/('+(copy(s,2,l-2))+')*'+
             df(copy(s,2,l-2))
                     else
         if copy(s,1,2)='tg' then
               b:=dh(copy(s,3,l-2))+'/cos('+copy(s,3,l-2)+')^2'
                    else
         if copy(s,1,2)='ln' then
                b:=dh(copy(s,3,l-2))+'/'+(copy(s,3,l-2))
                    else
         if copy(s,1,2)='lg' then
                 b:=dh(copy(s,3,l-2))+'/('+copy(s,3,l-2)+'*ln(10))'
                    else
         if copy(s,1,2)='sh' then
                 b:='ch'+copy(s,3,l-2)+'*'+dh(copy(s,3,l-2))
                     else
         if copy(s,1,2)='ch' then
                 b:='sh'+copy(s,3,l-2)+'*'+dh(copy(s,3,l-2))
                     else
         if copy(s,1,2)='th' then
                 b:=dh(copy(s,3,l-2))+'/ch('+copy(s,3,l-2)+')^2'
                      else
         if copy(s,1,3)='cth' then
                 b:='(-'+dh(copy(s,4,l-3))+')/sh('+copy(s,4,l-3)+')^2'
                      else
         if copy(s,1,3)='sch' then
            b:='(-2)*th('+copy(s,4,l-3)+')*sch('+copy(s,4,l-3)+')*'+
                dh(copy(s,4,l-3))
                             else
         if copy(s,1,3)='sec' then
             b:='tg('+copy(s,4,l-3)+')*sec('+copy(s,4,l-3)+')*'+
             dh(copy(s,4,l-3))
                             else
         if copy(s,1,5)='cosec' then
            b:='(-ctg('+copy(s,6,l-5)+')*cosec('+copy(s,6,l-5)+')*'+
            dh(copy(s,6,l-5))+')'
                             else
         if copy(s,1,4)='csch' then
            b:='(-2)*cth('+copy(s,5,l-4)+')*csch('+copy(s,5,l-4)+')*'+
            dh(copy(s,4,l-3))
                             else
         if copy(s,1,3)='cth' then
                 b:='(1-cth('+copy(s,4,l-3)+')^2)*'+dh(copy(s,4,l-3))
                             else
         if copy(s,1,3)='ctg' then
                  b:='(-'+dh(copy(s,4,l-3))+')/sin('+copy(s,4,l-3)+')^2'
                            else
         if copy(s,1,3)='exp' then
               b:='exp'+(copy(s,4,l-3))+'*'+dh(copy(s,4,l-3))
                               else
         if copy(s,1,3)='sin' then
               b:='cos'+copy(s,4,l-3)+'*'+dh(copy(s,4,l-3))
                               else
         if copy(s,1,3)='cos' then
               b:='(-sin'+copy(s,4,l-3)+')*'+dh(copy(s,4,l-3))
                               else
         if copy(s,1,5)='arctg' then
             b:=dh(copy(s,6,l-5))+'/(1+'+copy(s,6,l-5)+'^2)'
                                else
         if copy(s,1,6)='arcctg' then
             b:='(-'+dh(copy(s,7,l-6))+')/(1+'+copy(s,7,l-6)+'^2)'
                                else
         if copy(s,1,6)='arccos' then
             b:='(-'+dh(copy(s,7,l-6))+')/sqrt(1-'+copy(s,7,l-6)+'^2)'
             else
         if copy(s,1,6)='arcsin' then
             b:=dh(copy(s,7,l-6))+'/sqrt(1-'+copy(s,7,l-6)+'^2)'
             else
         if copy(s,1,4)='sqrt' then
                 b:=dh(copy(s,5,l-4))+'/(2*sqrt'+copy(s,5,l-4)+')'
             else
         if copy(s,1,4)='arsh' then
                 b:=dh(copy(s,5,l-4))+'/sqrt(1+('+copy(s,5,l-4)+')^2)'
             else
         if copy(s,1,4)='arth' then
                 b:=dh(copy(s,5,l-4))+'/(1-('+copy(s,5,l-4)+')^2)'
             else
         if copy(s,1,5)='arcth' then
             b:=dh(copy(s,6,l-5))+'/(1-('+copy(s,6,l-5)+')^2)'
                                else
         if copy(s,1,5)='archp' then
             b:=dh(copy(s,6,l-5))+'/sqrt(('+copy(s,6,l-5)+')^2-1)'
                                else
         if copy(s,1,5)='archm' then
             b:='(-'+dh(copy(s,6,l-5))+')/sqrt(('+copy(s,6,l-5)+')^2-1)'
                                else
         if copy(s,1,2)='pi' then
                             b:='0'
                             else
         if s[1]='e' then
                       b:='0'
                    else
                    if s[1]='x' then
                       b:='1'
                       else
                         begin
                          val(copy(s,1,l),d,i);
                          if i=0 then
                                 b:='0';
                         end;
         dh:=b;
       End{dh};
     Begin{dg}
       a:='';i1:=1;
       while i1<=length(s) do
        begin
         j1:=0;j2:=0;j3:=0;j4:=0;i2:=i1;
         while (i2<=length(s)) and not((j1*j1+j2*j2+j3*j3+j4=0)
              and (s[i2] in ['*','/',':'])) do
           begin
              if s[i2]='(' then j1:=j1+1;
              if s[i2]=')' then j1:=j1-1;
              if s[i2]='[' then j2:=j2+1;
              if s[i2]=']' then j2:=j2-1;
              if s[i2]='{' then j3:=j3+1;
              if s[i2]='}' then j3:=j3-1;
              if s[i2]='|' then
                begin
                 i:=i2;
                 while (s[i]='|') and (i<>0) do i:=i-1;
                 if (i=0) or
                    (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      j4:=j4+1
                    else
                      j4:=j4-1;
                end;
            i2:=i2+1;
           end;
           z1:=0;z2:=0;z3:=0;z4:=0;i3:=i1;
           while (i3<i2) and not((z1*z1+z2*z2+z3*z3+z4*z4=0)
                 and (s[i3]='^')) do
             begin
              if s[i3]='(' then z1:=z1+1;
              if s[i3]=')' then z1:=z1-1;
              if s[i3]='[' then z2:=z2+1;
              if s[i3]=']' then z2:=z2-1;
              if s[i3]='{' then z3:=z3+1;
              if s[i3]='}' then z3:=z3-1;
              if s[i3]='|' then
               begin
                i:=i3;
                while (s[i]='|') and (i<>0) do i:=i-1;
                if (i=0) or
                (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      z4:=z4+1
                    else
                      z4:=z4-1;
               end;
              i3:=i3+1;
             end;
             if i3<>i2 then
              begin
               r:=copy(s,i1,i3-i1);
               w:=copy(s,i3+1,i2-i3-1);
               val(w,u,y);
               if y=0 then
                 begin
                  str(u-1,o);
                  b:='('+w+')*'+r+'^'+o+'*'+dh(r);
                 end
                 else
                  b:=r+'^'+w+'*('+dh(r)+'*'+w+'/'+r+'+ln'+r+'*'+dh(w)+')'
              end
           else
           b:=dh(copy(s,i1,i2-i1));
           if i1=1 then a:=b
           else
           if s[i1-1]='*' then a:='('+a+'*'+copy(s,i1,i2-i1)+'+'+
              copy(s,1,i1-2)+'*'+b+')'
           else
           if s[i1-1] in ['/',':'] then
              a:='('+a+'*'+copy(s,i1,i2-i1)+'-'+
              copy(s,1,i1-2)+'*'+b+')/(('+copy(s,i1,i2-i1)+')^2)';
           i1:=i2+1;
      end;
      dg:=a;
     End{dg};
 Begin{df}
      i11:=1; a:='';
      while i11<=length(s) do
       begin
        jj1:=0;jj2:=0;jj3:=0;jj4:=0;i22:=i11;
        while (i22<=length(s)) and not((jj1*jj1+jj2*jj2+jj3*jj3+jj4=0)
             and (s[i22] in ['+','-']) and not(s[i22-1]='^')) do
             begin
              if s[i22]='(' then jj1:=jj1+1;
              if s[i22]=')' then jj1:=jj1-1;
              if s[i22]='[' then jj2:=jj2+1;
              if s[i22]=']' then jj2:=jj2-1;
              if s[i22]='{' then jj3:=jj3+1;
              if s[i22]='}' then jj3:=jj3-1;
              if s[i22]='|' then
              begin
               i:=i22;
               while (s[i]='|') and (i<>0) do i:=i-1;
               if (i=0) or
                  (s[i] in ['*','/',':','+','-','(','[','{','^'])
                    then
                      jj4:=jj4+1
                    else
                      jj4:=jj4-1;
              end;
              i22:=i22+1;
             end;
             if (i11=1) and (s[1]='-') then a:='' else
             if i11=1 then a:=dg(copy(s,i11,i22-i11)) else
             if s[i11-1]='+'
               then
                a:=a+'+'+dg(copy(s,i11,i22-i11))
               else
               if s[i11-1]='-'
               then
                a:=a+'-'+dg(copy(s,i11,i22-i11));
             i11:=i22+1;
       end;
       a:=normal(a);
       df:=a;
 End{df};

 procedure menu(h:integer);
  Begin
   case h of
   1:begin
     bar(10,10,90,34);
     outtextxy(15,12,'  ‚‚„   ');
     outtextxy(15,24,' ”“Š–ˆˆ ');
    end;
   2:begin
     bar(10,50,90,74);
     outtextxy(15,52,'  …. ');
     outtextxy(15,64,' ƒ€”ˆŠ‚ ');
    end;
   3:begin
     bar(10,90,90,114);
     outtextxy(15,92, '  ƒ€”ˆŠ  ');
     outtextxy(15,104,' ”“Š–ˆˆ  ');
    end;
   4:begin
     bar(10,130,90,154);
     outtextxy(15,132,'  ƒ€”ˆŠ ');
     outtextxy(15,144,'  F''(X) ');
    end;
   5:begin
     bar(10,170,90,194);
     outtextxy(15,172,'  ƒ€”ˆŠ  ');
     outtextxy(15,184,'  F''''(X) ');
    end;
   6:begin
     bar(10,210,90,234);
     outtextxy(15,212,' ‡€—…ˆ… ');
     outtextxy(15,224,' ‚  (.)  ');
    end;
   7:begin
     bar(10,250,90,274);
     outtextxy(15,252,' Œ€‘˜’€  ');
     outtextxy(15,264,'   X   ');
    end;
   8:begin
     bar(10,290,90,314);
     outtextxy(15,292,' Œ€‘˜’€  ');
     outtextxy(15,304,'   Y   ');
    end;
   9:begin
     bar(10,330,90,354);
     outtextxy(15,332,' —ˆ‘’Š€  ');
     outtextxy(15,344,' Š€€   ');
    end;
   10:begin
      bar(10,370,90,394);
      outtextxy(15,372,'  –‚…’   ');
      outtextxy(15,384,' Š€€ ');
     end;
   11:begin
      bar(10,410,90,434);
      outtextxy(15,412,'  –‚…’   ');
      outtextxy(15,424, 'ƒ€”ˆŠ‚ ');
     end;
   12:begin
      bar(10,450,90,474);
      settextstyle(0,0,2);
      outtextxy(11,455,'‚›•„');
      settextstyle(0,0,1);
     end;
    end;
  End{menu};
 procedure graphh(s:string);
  Begin
   errorr1:=false;
   errorr2:=false;
    x1:=f(s,-270/m,errorr1);
   for k:=-270 to 270 do
    begin
     if round(abs(k/13))=abs(k/13) then  sound(600+20*round(k/13));
      x2:=f(s,(k)/m,errorr2);
      if (errorr1=false) and (errorr2=false) then
      line(370+k,215-roundd(x1*n),371+k,215-roundd(x2*n))
       else
       errorr2:=false;
     nosound;
     x1:=x2;
     errorr1:=errorr2;
    end;
    nosound;
  End{graphh};

procedure begining;
 Begin
  setbkcolor(blue);
  setcolor(Black);
  setfillstyle(1,cs);
  cleardevice;
  bar(100,0,639,430);
  line(100,215,640,215);
  line(370,0,370,430);
  line(640,215,630,220);
  line(640,215,630,210);
  line(370,0,375,10);
  line(370,0,365,10);
  outtextxy(377,5,'Y');
  outtextxy(621,205,'X');
  outtextxy(373,218,'O');
  rectangle(0,0,639,479);
  rectangle(101,0,639,430);
  setfillstyle(1,white);
  setcolor(blue);
  setbkcolor(blue);
  for k:=1 to 12 do menu(k);
  for k:=-round(270 / m)+1 to round(270 / m)-1 do
   begin
    setcolor(lightgray);
    setlinestyle(dottedln,0,normwidth );
    if k<>0 then
    line(370+round(k*m),0,370+round(k*m),430);
    str(abs(k),v);setlinestyle(solidln,0,normwidth );
    setcolor(black);
    outtextxy(373+round(k*m),218,v);
    if k<0 then
    outtextxy(363+round(k*m),218,'-');
    line(370+round(k*m),210,370+round(k*m),220);
   end;
   for k:=-round(215 / n)+1 to round(215 / n)-1 do
    begin
      setcolor(lightgray);
      setlinestyle(dottedln,0,normwidth );
      if k<>0 then
        line(100,215+round(k*n),640,215+round(k*n));
      str(-k,v);setlinestyle(solidln,0,normwidth );
      setcolor(black);
      outtextxy(373,round(k*n)+218,v);
      line(365,215+round(k*n),375,215+round(k*n));
    end;
 End{begining};
procedure ddo(i:integer);
 Begin
  Case i of
    1:begin
      clr;
      setfillstyle(1,blue);
      bar(1,1,98,477);
      outtextxy(20,440,'f(x)=');
      readxy(60,440,st);
      clr;setcolor(blue);
      setfillstyle(1,white);
      for k:=1 to 12 do menu(k);
      setcolor(white);
      dst:=df(st);
      ddst:=df(dst);
      outtextxy(110,435,'f(x)='+st);
      outtextxy(110,450,'f''(x)='+dst);
      outtextxy(110,465,'f''''(x)='+ddst);
    end{1: };
    2:begin
      clr;
      u:=' ';
      outtextxy(110,435,'f(x)='+st);
      outtextxy(110,450,'f''(x)='+dst);
      outtextxy(110,465,'f''''(x)='+ddst);
      bar(2,2,98,478);
      setcolor(red);
      for k:=1 to 10 do
       begin
         str(k,v);
         outtextxy(10,60+30*(k-1),'F'+v);
       end;
      setcolor(white);
      outtextxy(40,60,'f(x)+a');
      outtextxy(40,90,'f(x+a)');
      outtextxy(40,120,'f(a*x)');
      outtextxy(40,150,'a*f(x)');
      outtextxy(40,180,'f(|x|)');
      outtextxy(40,210,'|f(x)|');
      outtextxy(40,240,'f(1/x)');
      outtextxy(40,270,'1/f(x)');
      outtextxy(40,300,'f(-x)');
      outtextxy(40,330,'-f(x)');
      u:=' ';
      while u<>#27 do
        begin
         repeat until keypressed;
         u:=readkey;
         if u<>#27 then
         begin{ if u}
         if u=#0 then u:=readkey;
         setcolor(white);
         case u of
          #59:begin
              outtextxy(5,370,'a=');
              gotoxy(4,24);
              readln(v);
              bar(1,360,100,380);
              if v[1]='-' then st:=st+v
              else st:=st+'+'+v;
          end;
          #60:begin
              outtextxy(5,370,'a=');
              gotoxy(4,24);
              readln(v);
              bar(1,360,100,380);
              k:=1;
              while k<=length(st) do
                begin
                 if st[k]='x' then
                  begin
                   insert('(',st,k);
                   if v[1]='-' then insert(v+')',st,k+2)
                   else  insert('+'+v+')',st,k+2);
                   k:=k+1;
                  end;
                 k:=k+1;
                end;
          end;
          #62:begin
              outtextxy(5,370,'a=');
              gotoxy(4,24);
              readln(v);
              bar(1,360,100,380);
              st:=v+'*('+st+')';
          end;
          #61:begin
              outtextxy(5,370,'a=');
              gotoxy(4,24);
              readln(v);
              bar(1,360,100,380);
              k:=1;
              while k<=length(st) do
              begin
               if st[k]='x' then
                begin
                  insert(')',st,k+1);
                  insert('('+v+'*',st,k);
                  k:=k+2+length(v);
                end;
               k:=k+1;
              end;
          end;
          #63:begin
              k:=1;
              while k<=length(st) do
              begin
               if st[k]='x' then
                begin
                  insert('|',st,k);
                  insert('|',st,k+2);
                  k:=k+3;
                end;
                k:=k+1;
              end;
          end;
          #64:begin
              st:='|'+st+'|';
          end;
          #65:begin
              k:=1;
              while k<=length(st) do
               begin
                if st[k]='x' then
                   begin
                      insert('(1/',st,k);
                      insert(')',st,k+4);
                      k:=k+3;
                   end;
                k:=k+1;
               end;
          end;
          #66:begin
              st:='1/('+st+')';
          end;
          #67:begin
              k:=1;
              while k<=length(st) do
                begin
                 if st[k]='x' then
                  begin
                    insert('(-',st,k);
                    insert(')',st,k+3);
                    k:=k+2;
                  end;
                 k:=k+1;
                end;
          end;
          #68:begin
              st:='-('+st+')';
          end;
         end{case u};
         uuu:=' ';clr;
         for k:=1 to 15 do
          begin
           setfillstyle(1,k);
           bar(110+k*30,460,130+k*30,470);
          end;
          ii:=1; uu:=' ';
          setcolor(white);outtextxy(145,440,'?');
          while uu<>#13 do
           begin
            jj:=ii;
            repeat until keypressed;uu:=readkey;
            if uu=#0 then uu:=readkey;
            case uu of
             #77: if ii<>15 then ii:=ii+1  else ii:=1;
             #75: if ii<>1  then ii:=ii-1 else ii:=15;
            end;
            setcolor(blue);
            outtextxy(115+jj*30,440,'?');
            setcolor(white);
            outtextxy(115+ii*30,440,'?');
           end{ while uu};
           clr; outtextxy(110,435,'f(x)='+st);
           setcolor(ii);  graphh(st);
         end {if u};
        end {while u};
        begining;
    end{2: };
    3:begin
      setcolor(cf);
      graphh(st);
    end {3:};
    4:begin
      setcolor(cd);
      graphh(dst);
    end {4:};
    5:begin
      setcolor(dd);
      graphh(ddst);
    end{5:};
    6:begin
      gotoxy(30,1);
      setcolor(red);
      outtextxy(104,4,  '‚‚…„ˆ’… ’—Š“ :');
      READ(x);
      begining; str(x:10:4,v);
      outtextxy(104,4,'‡€—…ˆ… ‚ ’—Š… X='+v);
      STR(f(st,x,errorr1):10:4,v);
      if errorr1=false then
         outtextxy(104,24,'‚ '+v)
      else outtextxy(104,24,'… …„…‹…');
    end {6:};
    7:begin
      gotoxy(32,1);
      outtextxy(104,4,'Œ€‘˜’€  ‘ˆ X=');
      textcolor(white);
      readln(m);
      begining;
      outtextxy(110,435,'f(x)='+st);
      outtextxy(110,450,'f''(x)='+dst);
      outtextxy(110,465,'f''''(x)='+ddst);
    end {7:};
    8:begin
      gotoxy(32,1);
      outtextxy(104,4,'Œ€‘˜’€  ‘ˆ Y=');
      textcolor(white);
      readln(n);
      begining;
      outtextxy(110,435,'f(x)='+st);
      outtextxy(110,450,'f''(x)='+dst);
      outtextxy(110,465,'f''''(x)='+ddst);
    end {8:};
    9:begin
      begining;
      outtextxy(110,435,'f(x)='+st);
      outtextxy(110,450,'f''(x)='+dst);
      outtextxy(110,465,'f''''(x)='+ddst);
    end {9:};
    10:begin
       uuu:=' '; clr;
       while uuu<>'y' do
         begin
          for k:=1 to 15 do
             begin
                setfillstyle(1,k);
                bar(110+k*30,460,130+k*30,470);
             end;
          ii:=1;uu:=' ';
          setcolor(white);outtextxy(145,440,'?');
          while uu<>#13 do
           begin
             jj:=ii;
             repeat until keypressed;uu:=readkey;
             case uu of
               #77:
                 if ii<>15 then ii:=ii+1
                 else ii:=1;
               #75:
                 if ii<>1 then ii:=ii-1
                 else ii:=15;
             end;
             setcolor(blue);
             outtextxy(115+jj*30,440,'?');
             setcolor(white);
             outtextxy(115+ii*30,440,'?');
           end;
          cs:=ii;
          begining;
          setcolor(white);
          outtextxy(110,440,'€‚ˆ’‘Ÿ ?(Y/N)');
          repeat until keypressed; uuu:=readkey;
          setfillstyle(1,blue);
          bar(110,440,639,468);
         end;
         clr;
         setcolor(white);
         outtextxy(110,435,'f(x)='+st);
         outtextxy(110,450,'f''(x)='+dst);
         outtextxy(110,465,'f''''(x)='+ddst);
    end {10: };
    11:begin
       clr; uuu:=' '; uu:=' ';
        while uuu<>'y' do
          begin
           setcolor(white);
           outtextxy(110,460,
           ' –‚…’ ƒ€”ˆŠ‚ ”“Š–ˆˆ, …‚‰ ˆ‹ˆ ‚’‰ ˆ‡‚„‰ ?(F/D/S)');
           repeat until keypressed;uu:=readkey;
           setfillstyle(1,blue);
           bar(110,440,639,468);
           for k:=1 to 15 do
            begin
             setfillstyle(1,k);
             bar(110+k*30,460,130+k*30,470);
            end {for k} ;
           ii:=1;uu:=' ';
           setcolor(white);outtextxy(145,440,'?');
           while uu<>#13 do
             begin
              jj:=ii;
              repeat until keypressed;uu:=readkey;
              case uu of
               #77:if ii<>15 then ii:=ii+1
                   else ii:=1;
               #75:if ii<>1 then ii:=ii-1
                   else ii:=15;
              end {case uu};
              setcolor(blue);
              outtextxy(115+jj*30,440,'?');
              setcolor(white);
              outtextxy(115+ii*30,440,'?');
             end {while uu};
           case uu of
            'f':cf:=ii;
            'd':cd:=ii;
            's':dd:=ii;
           end {case uu};
           setcolor(white);
           outtextxy(110,440,'€‚ˆ’‘Ÿ ?(Y/N)');
           setcolor(ii);
           for ii:=10 to 64 do
           line(10*ii+5,215-round(100*sin(1-ii/5)),
                10*ii+10+5,215-round(100*sin(1-(ii+1)/5)));
           repeat until keypressed; uuu:=readkey;
           setfillstyle(1,blue);
           bar(110,440,639,468);
        end {while uuu};
        clr;  setcolor(white);
        outtextxy(110,435,'f(x)='+st);
        outtextxy(110,450,'f''(x)='+dst);
        outtextxy(110,465,'f''''(x)='+ddst);
     end {11:};
     12:halt(1);
  end {Case i};
 End {ddo};

BEGIN { §¤¥« ®¯¥à â®à®¢}
  errorr1:=false; errorr2:=false; u:='p';
  Gdriver:=detect; {¨­¨æ¨ «¨§ æ¨ï £à ä¨ç¥áª®£® à¥¦¨¬ }
  {!! ¢ ¯à®æ¥¤ãà¥ initgraph ¬¥¦¤ã  ¯®áâà®ä ¬¨ ¯ãâì ª ä ©«ã
  ¥gavga.bgi
  ¨§¬¥­¨â¥ ­  â®â, ª®â®àë© ­  ¢ëè¥¬ ª®¬¯ìîâ¥à¥;
  ¯® ã¬®«ç ­¨î (¬¥¦¤ã  ¯®áâà®ä ¬¨ ¯ãâì ®âáãâáâ¢ã¥â) íâ®â ä ©«
  ­ å®¤¨âáï ¢ â®¬ ¦¥ ª â «®£¥, çâ® ¨ ¯à®£à ¬¬ }
  initgraph(Gdriver,Gregim,'d:\tp\bgi');
  {initgraph(Gdriver,Gregim,' ');}
  setcolor(white);
  for i:=0 to 12 do
  begin
    { ¬ã§ëª  }
    {sound(300+30*i); delay(100);}
    setfillstyle(1,i+2);
    bar(round(640*i/13),0,round(640*(i+1)/13),480);
    nosound;
   end;
   rectangle(1,1,639,479);   setbkcolor(11);
   setfillstyle(5,white);    settextstyle(0,0,3);
   bar(135,130,500,340);     setcolor(red);
   outtextxy(140,140,'  ‘’ˆ’…‹œ  ');
   outtextxy(140,170,'   ƒ€”ˆŠ‚    ');
   outtextxy(140,200,'    ”“Š–ˆ‰    ');
   outtextxy(140,230,'   € ‘‚…   ');
   outtextxy(140,260,'‘ˆ’€Š‘ˆ—…‘Šƒ');
   outtextxy(140,290,'  €€‹ˆ‡€’€  ');
   Settextstyle(0,0,1);
   setcolor(white);
   repeat until keypressed;
   U:=READKEY;
   cf:=black;   cd:=green;   dd:=brown;   cs:=white;
   m:=75;   n:=130;
   begining;
   {¡à §¥æ äã­ªæ¨¨ - á¨­ãá ®â íªá¯®­¥­âë x}
   st:='sin(exp(x))';
   {st:='|x|^x';}{„àã£«© ¯à¨¬¥à - ¬®¤ã«ì x ¢ áâ¥¯¥­¨ x}
   dst:=df(st);
   ddst:=df(dst);
   outtextxy(110,435,'f(x)='+st);
   outtextxy(110,450,'f''(x)='+dst);
   outtextxy(110,465,'f''''(x)='+ddst);
   setcolor(cf);
   graphh(st);
   setcolor(blue);
   setfillstyle(1,blue);
   bar(150,230,580,400);
   setfillstyle(1,white);
   bar(155,235,575,395);
   setcolor(0);
   outtextxy(165,240, '‘ Œ™œ ’ƒ  ‘’ˆ’…‹Ÿ ƒ€”ˆŠ‚ ‚› ‘Œ†…’… ');
   outtextxy(165,255, '‚‚…‘’ˆ ‚ ‘ˆŒ‚‹œŒ ‚ˆ„… ”“Š–ˆ, “‚ˆ„…’œ …ğ ƒ€”ˆŠ, ');
   outtextxy(170,270, 'ƒ€”ˆŠˆ …‚‰ ˆ ‚’‰ ˆ‡‚„›•, ˆ‡‚„ˆ’œ');
   outtextxy(170,285, '…€‡‚€ˆŸ ”“Š–ˆ‰, “‚ˆ„…’œ ˆ Ÿ’œ, Š€Š ˆ');
   outtextxy(170,300, '’€†€’‘Ÿ € ƒ€”ˆŠ…, “„…’… ‚ˆ„…’œ ˆ‡Œ……ˆŸ ‚  ');
   outtextxy(170,315, ' ”“Š–ˆ€‹œ‰ ‘’Š…, ‘Œ†…’… —ˆ‘’ˆ’œ Š€');
   outtextxy(170,330,'  „‹Ÿ ‚‚„€ ‚‰ ”“Š–ˆˆ ˆ ˆ …ğ …€‡‚€ˆ‰, ');
   outtextxy(170,345,'    ‚›€’œ “†›‰ Œ€‘˜’€  Š€†„‰ ‘ˆ, ');
   outtextxy(170,360,'       Œ…Ÿ’œ –‚…’ ƒ€”ˆŠ‚ ˆ Š€€... ');
   outtextxy(170,375,'    €’€‰’…, “—ˆ’…‘œ, €‘‹€†„€‰’…‘œ! ');
   repeat until keypressed;
   U:=READKEY;
   begining;
   setcolor(white);
   outtextxy(110,435,'f(x)='+st);
   outtextxy(110,450,'f''(x)='+dst);
   outtextxy(110,465,'f''''(x)='+ddst);
   setcolor(white);
   setfillstyle(1,red);
   menu(1);mn:=1;
   while uuuu<>#27 do
     begin
       nm:=mn;
       repeat until keypressed;
       uuuu:=readkey;
       case uuuu of
          #0:begin
             uuuu:=readkey;
             case uuuu of
                #72:
                 if mn<>1 then
                   mn:=mn-1
                 else mn:=12;
                #80:
                 if mn<>12 then
                   mn:=mn+1
                 else mn:=1;
             end;
          end;
          #13: begin
               setfillstyle(1,blue);
               setcolor(white);
               menu(mn);
               ddo(mn);
               setfillstyle(1,white);
               setcolor(blue);
               menu(mn);
          end;
       end;
       setcolor(blue);  setfillstyle(1,white);
       menu(nm);  setfillstyle(1,red);
       setcolor(white); menu(mn);
     end;
     closegraph;
END.
