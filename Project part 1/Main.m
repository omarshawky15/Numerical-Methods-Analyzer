function root = Main (func,methodName , nOfItr ,percision,Xlower,Xupper)
root = nan;
Xlower= str2double(Xlower);
if(isnan(Xlower))
    return ;
end
if(~strcmp(methodName,'Newton-Raphson'))
    Xupper = str2double(Xupper);
    if(isnan(Xupper))
        return ;
    else
        Xtemp = Xupper ;
        Xupper = max([Xupper Xlower]);
        Xlower = min([Xtemp Xlower]);
    end
end
func = sym(func);
nOfItr = str2num(nOfItr);
if(isnan(nOfItr)||nOfItr <= 0 )
    nOfItr = 50;
end
percision =str2double(percision);
if(isnan(percision) )
    percision = 0.00001;
end
%plotting
%{

    cla reset;
grid on ;
hold on ;
zoom on ;
%}
fig = gcf;
switch methodName
    case {'-','Bisection'}
        figure('Name', char(func));
        fplot(func,[Xlower-2 Xupper+2]);
        root= bisect(func , nOfItr,percision ,Xlower,Xupper);
    case  'Secant'
        figure('Name' , char(diff(func)));
        fplot(diff(func),[Xlower-2 Xupper+2]);
        root = secant(func , nOfItr,percision ,Xlower,Xupper);
    case 'Newton-Raphson'
        figure('Name' , char(diff(func)));
        fplot(diff(func),[Xlower-2 Xlower+2]);
        root = newton(func , nOfItr,percision ,Xlower);
    case {'False-position'}
        figure('Name' , char(func));
        fplot(func,[Xlower-2 Xupper+2]);
        root = false_position(func , nOfItr,percision ,Xlower,Xupper);
    otherwise
        disp('megz');
end
 ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
end