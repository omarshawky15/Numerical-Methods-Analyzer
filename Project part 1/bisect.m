function root = bisect(func , nOfItr,percision ,Xupper, Xlower)
fprintf('i    Xupper  Xlower  Xrnew \tEr\t  f(Xr)\n');
xro = nan ; xrn = nan ;
i =0;
funlo = vpa(subs(func,Xlower));
while isnan(xro)||isnan(xrn)||(i<=nOfItr&& abs(xro-xrn)>percision)
    xro = xrn ;
    xrn = vpa((Xlower+Xupper)/2);
    funNew = vpa(subs(func,xrn));
    funMul = vpa(funNew*funlo) ;
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i+1,Xupper,Xlower,xrn,abs(xro-xrn),funNew);
    if funMul < 0
        Xupper = xrn ;
    else
        if funMul>0
            Xlower = xrn ;
            funlo = funNew;
        else
            break ;
        end
    end
    i= i+1;
end
root = xrn ;
end