function root = newton(func , nOfItr,percision ,Xi)
fprintf('i    xi       funxi funxi1       \tEr\n');
Xitemp = nan ; 
prs = 10^-4;
i = 0;
firstDerv = diff(func);
secondDerv = diff(firstDerv);
funxi = vpa(subs(func,Xi));
funcDerv1 = vpa(subs(firstDerv,Xi));
funcDerv2 = vpa(subs(secondDerv,Xi));
fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,Xi,funxi,funcDerv1,funcDerv2,abs(Xi-Xitemp));
while isnan(Xitemp)|| (i<nOfItr&&abs(Xi-Xitemp)>prs) 
    i=i+1;
    Xitemp = Xi ;
    Xi = Xi - ((funxi*funcDerv1)/(funcDerv1^2 - funxi*funcDerv2));
    funxi = vpa(subs(func,Xi));
    funcDerv1 = vpa(subs(firstDerv, Xi));
    funcDerv2 = vpa(subs(secondDerv ,Xi));
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,Xi,funxi,funcDerv1,funcDerv2,abs(Xi-Xitemp));
end
root = Xi;
end

