function data = newton(func , nOfItr,percision ,Xi)
hold on ;
grid on ;
zoom on ;
%ylim([-100 100]);
Xitemp = nan ;
i = 0;
firstDerv = diff(func);
secondDerv = diff(firstDerv);
funcxi = vpa(subs(func,Xi));
funcDerv1 = vpa(subs(firstDerv,Xi));
funcDerv2 = vpa(subs(secondDerv,Xi));
row = {char(vpa(Xi)),char(funcxi), char(funcDerv1), char(funcDerv2), 'not assigned'};
data = row;
while isnan(Xitemp)|| (i<nOfItr&&abs(Xi-Xitemp)>percision)
    i=i+1;
    Xitemp = Xi ;
    Xi = Xi - ((funcxi*funcDerv1)/(funcDerv1^2 - funcxi*funcDerv2));
    plot([Xitemp Xitemp], [subs(firstDerv, Xitemp) subs(firstDerv, Xi)], 'r-');
    plot([Xitemp Xi], [subs(firstDerv,Xi) subs(firstDerv,Xi)], 'r--');
    funcxi = vpa(subs(func,Xi));
    funcDerv1 = vpa(subs(firstDerv, Xi));
    funcDerv2 = vpa(subs(secondDerv ,Xi));
    row = {char(vpa(Xi)),char(funcxi), char(funcDerv1), char(funcDerv2), char(abs(Xi-Xitemp))};
    data = [data;row];
end
%x = str2double(data(2:end,1));
%y = str2double(data(2:end,3));
%plot(x,y,'-x');
plot(Xi ,funcDerv1 ,'x');
columnNames = {'Xi' ,'f(x)','f''(x)','f''''(x)', 'Epislon'};
data ={data,columnNames};
data=[data {char(Xi) char(abs(Xi-Xitemp)) sprintf('%d',i)}];

end

