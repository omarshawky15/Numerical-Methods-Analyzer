function data = false_position(func , nOfItr,percision ,Xlower,Xupper)
hold on ;
grid on ;
zoom on ;
%ylim([-100 100]);
xro = nan ;
xrn = nan ;
row = {char(vpa(Xlower)), char(vpa(Xupper)), 'not assigned', 'not assigned', 'not assigned'};
data = row;
i =0;
funcLo = vpa(subs(func,Xlower));
funcUp = vpa(subs(func,Xupper));
funcMul = vpa(funcUp*funcLo) ;
if(funcMul >0)
    warndlg('No root found between boundary limits','Warning');
    return ;
end
while isnan(xro)||isnan(xrn)||(i<=nOfItr&& abs(xro-xrn)>percision)
    xro = xrn ;
    xrn = (Xlower*funcUp-Xupper*funcLo)/(funcUp-funcLo);
    funcNew = vpa(subs(func,xrn));
    funcMul = vpa(funcNew*funcLo) ;
    if(~isnan(xro))
        plot([xro xro], [subs(func,xrn) subs(func,xro)], 'r-');
        plot([xro xrn], [subs(func,xrn) subs(func,xrn)], 'r--');
    end;
    if funcMul < 0
        Xupper = xrn ;
        funcUp = funcNew;
    else
        if funcMul>0
            Xlower = xrn ;
            funcLo = funcNew;
        else
            row = {char(vpa(Xlower)), char(vpa(Xupper)), char(xrn), char(funNew), 'exact root found'};
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
data=[data {char(xrn) char(abs(xro-xrn)) sprintf('%d',i)}];
end