function data = secant(func , nOfItr,percision ,XiOld,XiNew)
hold on ;
grid on ;
zoom on ;
%ylim([-100 100]);
i = 0;
funcDerv1 = diff(func);
funcXiNew = vpa(subs(func ,XiNew));
funcXiOld= vpa(subs(func ,XiOld));
row = {char(vpa(XiOld)), char(vpa(XiNew)),char(funcXiOld),char(funcXiNew), 'not assigned'};
data = row;
while (i<nOfItr&& abs(XiOld-XiNew)>percision)
    i=i+1;
    XiTemp = XiNew ;
    XiNew = XiNew - funcXiNew*((XiOld -XiNew)/(funcXiOld-funcXiNew));
    plot([XiOld XiOld], [subs(funcDerv1,XiOld) subs(funcDerv1,XiNew)], 'r-');
    plot([XiOld XiNew], [subs(funcDerv1,XiNew) subs(funcDerv1,XiNew)], 'r--');
    funcXiOld =funcXiNew ;
    funcXiNew = vpa(subs(func,XiNew));
    XiOld = XiTemp ;
    row = {char(vpa(XiOld)), char(vpa(XiNew)),char(funcXiOld),char(funcXiNew), char(abs(XiOld-XiNew))};
    data =[data;row];
end
%x = str2double(data(2:end,1));
%y = str2double(data(2:end,3));
%plot(x,y,'-x');
plot(XiNew ,subs(funcDerv1,XiNew) ,'x');
columnNames = {'Xi' ,'Xi+1', 'f(Xi)','f(Xi+1)', 'Epislon'};
data ={data,columnNames};
data=[data {char(XiNew) sprintf('%f',percision) sprintf('%d',i)}];

end

