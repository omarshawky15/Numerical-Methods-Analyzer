function root = Main (func,methodName , nOfItr ,percision,Xupper,Xlower )
root = nan;
Xupper= str2double(Xupper);
if(isnan(Xupper))
    return ;
end
xl =nan;
if(nargin ==6)
    xl = str2double(Xlower);
    if(isnan(xl))
        return;
    end
end
Xlower = xl ;
func = sym(func);
nOfItr = str2num(nOfItr);
if(isnan(nOfItr)||nOfItr <= 0 )nOfItr = 50;end
percision =str2num(percision);
if(isnan(percision)||nOfItr <= 0 )percision = 0.00001;end
switch methodName
    case {'-','Bisection'}
        root= bisect(func , nOfItr,percision ,Xupper,Xlower);
    case  'Secant'
        root = secant(func , nOfItr,percision ,Xupper,Xlower);
    case {'False-position' , 'Newton-Raphson'}
    otherwise
        disp('fuck');
end
end