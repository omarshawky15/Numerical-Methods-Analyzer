function root = secant(func , nOfItr,percision ,XiNew ,XiOld)
fprintf('i    xi        xi1  funxi   funxi1       \tEr\n');
i = 0;
funcXiNew = vpa(subs(func ,XiNew));
funcXiOld= vpa(subs(func ,XiOld));
fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,XiOld,XiNew,funcXiOld,funcXiNew,abs(XiOld-XiNew));
while (i<nOfItr&& abs(XiOld-XiNew)>percision)
    i=i+1;
    XiTemp = XiNew ;
    XiNew = XiNew - funcXiNew*((XiOld -XiNew)/(funcXiOld-funcXiNew));
    funcXiOld =funcXiNew ;
    funcXiNew = vpa(subs(func,XiNew));
    XiOld = XiTemp ;
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i,XiOld,XiNew,funcXiOld,funcXiNew,abs(XiOld-XiNew));
end
root = XiNew ;
end

