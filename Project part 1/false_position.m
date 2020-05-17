function root = false_position(func , nOfItr,percision ,Xlower,Xupper)
fprintf('i    Xupper  Xlower  Xrnew \tEr\t  f(Xr)\n');
xro = nan ;
xrn = nan ;
root = nan ;
i =0;
funcLo = vpa(subs(func,Xlower));
funcUp = vpa(subs(func,Xupper));
funcMul = vpa(funcUp*funcLo) ;
if(funcMul >0)
    return ;
end
while isnan(xro)||isnan(xrn)||(i<=nOfItr&& abs(xro-xrn)>percision)
    xro = xrn ;
    xrn = (Xlower*funcUp-Xupper*funcLo)/(funcUp-funcLo);
    funcNew = vpa(subs(func,xrn));
    funcMul = vpa(funcNew*funcLo) ;
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i+1,Xupper,Xlower,xrn,abs(xro-xrn),funcNew);
    if funcMul < 0
        Xupper = xrn ;
        funcUp = funcNew;
    else
        if funcMul>0
            Xlower = xrn ;
            funcLo = funcNew;
        else
            break ;
        end
    end
    i= i+1;
end
root = xrn ;
end