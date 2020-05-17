fprintf('i    xi       funxi funxi1       \tEr\n');
xi = 1.2 ; 
xitemp = 0 ; 
prs = 10^-4;
i = 0;
funxi = calcFunc(xi);
funxi1 = calcderv(xi);
funxi2 = calcderv2(xi);
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,xi,funxi,funxi1,funxi2,abs(xi-xitemp));
while  abs(xi-xitemp)>prs 
    i=i+1;
    xitemp = xi ;
    xi = xi - ((funxi*funxi1)/(funxi1^2 - funxi*funxi2));
    %xi =round(xi,4,'significant');
    %unxi1 = funxi;
    funxi = calcFunc(xi);
    funxi1 = calcderv(xi);
    funxi2 = calcderv2(xi);
    %xi1 = xitemp ;
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,xi,funxi,funxi1,funxi2,abs(xi-xitemp));
end


