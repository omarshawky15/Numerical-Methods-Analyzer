function data = newton(func , nOfItr,percision ,Xi)
%fprintf('i    xi       funxi funxi1       \tEr\n');
Xitemp = nan ;
i = 0;
firstDerv = diff(func);
secondDerv = diff(firstDerv);
funcxi = vpa(subs(func,Xi));
funcDerv1 = vpa(subs(firstDerv,Xi));
funcDerv2 = vpa(subs(secondDerv,Xi));
row = {char(vpa(Xi)),char(funcxi), char(funcDerv1), char(funcDerv2), 'not assigned'};
data = row;
%fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,Xi,funcxi,funcDerv1,funcDerv2,abs(Xi-Xitemp));
while isnan(Xitemp)|| (i<nOfItr&&abs(Xi-Xitemp)>percision)
    i=i+1;
    Xitemp = Xi ;
    Xi = Xi - ((funcxi*funcDerv1)/(funcDerv1^2 - funcxi*funcDerv2));
    funcxi = vpa(subs(func,Xi));
    funcDerv1 = vpa(subs(firstDerv, Xi));
    funcDerv2 = vpa(subs(secondDerv ,Xi));
row = {char(vpa(Xi)),char(funcxi), char(funcDerv1), char(funcDerv2), char(abs(Xi-Xitemp))};
    data = [data;row];
    %fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,Xi,funcxi,funcDerv1,funcDerv2,abs(Xi-Xitemp));
end
%row = {char(vpa(Xi)),char(funcxi), char(funcDerv1), char(funcDerv2), char(abs(Xi-Xitemp))};
%data = [data;row];
columnNames = {'Xi' ,'f(x)','f''(x)','f''''(x)', 'Epislon'};
data ={data,columnNames};
end

