function root = Main (func,methodName , nOfItr ,percision,Xlower,Xupper)
root = nan;
Xlower= str2double(Xlower);
if(isnan(Xlower))
    warndlg('Xlower/Xi isn''t a valid value','Warning');
    return ;
end
if(~strcmp(methodName,'Newton-Raphson') && ~strcmp(methodName, 'Fixed-Point'))
    Xupper = str2double(Xupper);
    if(isnan(Xupper))
        warndlg('Xupper/Xi+1 isn''t a valid value','Warning');
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
switch methodName
    case {'-','Bisection'}
        figure('Name', char(func));
        fplot(func,[Xlower-2 Xupper+2]);
        root= bisect(func , nOfItr,percision ,Xlower,Xupper);
    case  'Secant'
        figure('Name' , char(diff(func)));
        fplot(diff(func),[Xlower-2 Xupper+2]);
        %fplot(func,[Xlower Xupper]);
        root = secant(func , nOfItr,percision ,Xlower,Xupper);
    case 'Newton-Raphson'
        figure('Name' , char(diff(func)));
        fplot(diff(func),[Xlower-2 Xlower+2]);
        %fplot(func,[Xlower Xupper]);
        root = newton(func , nOfItr,percision ,Xlower);
    case {'False-position'}
        figure('Name' , char(func));
        fplot(func,[Xlower-2 Xupper+2]);
        root = false_position(func , nOfItr,percision ,Xlower,Xupper);
    case 'Fixed-Point'
        root = fixed_point(func , nOfItr,percision ,Xlower);
    otherwise
        disp('Method not found');
end
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
end