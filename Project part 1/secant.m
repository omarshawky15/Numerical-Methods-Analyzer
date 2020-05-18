function data = secant(func , nOfItr,percision ,XiOld,XiNew)
%plotting
cla reset;
ylim([-100 100])
fplot(func);
grid on ;
hold on ;
zoom on
PlotAxisAtOrigin();
i = 0;
funcXiNew = vpa(subs(func ,XiNew));
funcXiOld= vpa(subs(func ,XiOld));
row = {char(vpa(XiOld)), char(vpa(XiNew)),char(funcXiNew),char(funcXiOld), 'not assigned'};
data = row;
%fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,XiOld,XiNew,funcXiOld,funcXiNew,abs(XiOld-XiNew));
while (i<nOfItr&& abs(XiOld-XiNew)>percision)
    i=i+1;
    XiTemp = XiNew ;
    XiNew = XiNew - funcXiNew*((XiOld -XiNew)/(funcXiOld-funcXiNew));
    funcXiOld =funcXiNew ;
    funcXiNew = vpa(subs(func,XiNew));
    XiOld = XiTemp ;
    row = {char(vpa(XiOld)), char(vpa(XiNew)),char(funcXiNew),char(funcXiOld), char(abs(XiOld-XiNew))};
    data =[data;row];
    %fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,XiOld,XiNew,funcXiOld,funcXiNew,abs(XiOld-XiNew));
end
x = str2double(data(2:end,1));
y = str2double(data(2:end,3));
plot(x,y,'-x');
columnNames = {'Xi' ,'Xi+1', 'f(Xi)','f(Xi+1)', 'Epislon'};
data ={data,columnNames};
end

