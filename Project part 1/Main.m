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
cla reset;
ylim([-100 100])
fplot(func);
grid on ;
hold on ;
zoom on ;
PlotAxisAtOrigin();

switch methodName
    case {'-','Bisection'}
        root= bisect(func , nOfItr,percision ,Xlower,Xupper);
    case  'Secant'
        root = secant(func , nOfItr,percision ,Xlower,Xupper);
    case 'Newton-Raphson'
        root = newton(func , nOfItr,percision ,Xlower);
    case {'False-position'}
        root = false_position(func , nOfItr,percision ,Xlower,Xupper);
    otherwise
        disp('megz');
end
end