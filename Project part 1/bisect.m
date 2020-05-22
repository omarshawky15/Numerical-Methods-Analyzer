function data = bisect(func , nOfItr,percision ,Xlower,Xupper)
hold on ;
grid on ;
zoom on ;
%ylim([-100 100]);
xro = nan ;
xrn = nan ;
i=0;
row = {char(vpa(Xlower)), char(vpa(Xupper)), 'not assigned', 'not assigned', 'not assigned'};
data = row;
funcLo = vpa(subs(func,Xlower));
funcUp = vpa(subs(func,Xupper));
funcMul = vpa(funcUp*funcLo) ;
if (funcMul >0)
    warndlg('No root found between boundary limits','Warning');
    return ;
end
while isnan(xro)||isnan(xrn)||(i<=nOfItr&& abs(xro-xrn)>percision)
    xro = xrn ;
    xrn = vpa((Xlower+Xupper)/2);
    funcNew = vpa(subs(func,xrn));
    funMul = vpa(funcNew*funcLo) ;
    if(~isnan(xro))
        plot([xro xro], [subs(func,xro) subs(func,xrn)], 'r-');
        plot([xro xrn], [subs(func,xrn) subs(func,xrn)], 'r--');
    end;
    if funMul < 0
        Xupper = xrn ;
    else
        if funMul>0
            Xlower = xrn ;
            funcLo = funcNew;
        else
            row = {char(vpa(Xlower)), char(vpa(Xupper)), char(xrn), char(funcNew), 'exact root found'};
            data = [data;row];
            break ;
        end
    end
    if(isnan(xro))
        row = {char(vpa(Xlower)), char(vpa(Xupper)), char(xrn), char(funcNew), 'not assigned'};
    else
        row = {char(vpa(Xlower)), char(vpa(Xupper)), char(xrn), char(funcNew), char(abs(xro-xrn))};
    end
    data = [data;row];
    i= i+1;
end
%x = str2double(data(2:end,3));
%y = str2double(data(2:end,4));
%plot(x,y,'-x');
plot(xrn ,funcNew ,'x');
columnNames = {'Xlower' ,'Xupper' , 'Approximate root' , 'f(x)' , 'Epislon'};
data ={data,columnNames};
data=[data {char(xrn) sprintf('%f',percision) sprintf('%d',i)}];

end