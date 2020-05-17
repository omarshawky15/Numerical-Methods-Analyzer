function root = Main (func,methodName , nOfItr ,percision,Xlower,Xupper)
root = nan;
Xlower= str2double(Xlower);
if(isnan(Xlower))
    return ;
end
xl =nan;
if(nargin ==6)
    xl = str2double(Xupper);
    if(isnan(xl))
        return;
    end
end
Xupper = xl ;
func = sym(func);
nOfItr = str2num(nOfItr);
if(isnan(nOfItr)||nOfItr <= 0 )nOfItr = 50;end
percision =str2num(percision);
if(isnan(percision)||nOfItr <= 0 )percision = 0.00001;end
switch methodName
    case {'-','Bisection'}
        root= bisect(func , nOfItr,percision ,Xlower,Xupper);
    case  'Secant'
        root = secant(func , nOfItr,percision ,Xlower,Xupper);
    case 'Newton-Raphson'
        root = newton(func , nOfItr,percision ,Xlower);
    case {'False-position'}
    otherwise
        disp('fuck');
end
end