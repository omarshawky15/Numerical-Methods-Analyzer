function data = fixed_point(func, nOfItr, precision, Xi)
    format short
    func = inline(func);
    Xs = Xi-5:0.01:Xi+5;
    Ys = g(func, Xs);
    figure('Name', 'FPIM');
    plot(Xs, Ys, '-r', 'LineWidth', 2);
    hold on
    plot(Xs, Xs, '-b', 'LineWidth', 2);
    i = 0;
    nextXi = func(Xi);
    colNames = {'Xi', 'Xi+1 = g(Xi)', 'F(Xi+1)', 'Abseloute Error', 'Relative Error'};
    data = {char(vpa(Xi)), char(vpa(nextXi)), char(vpa(func(nextXi) - nextXi)), 'undefined', 'undefined'};
    while (i < nOfItr && abs(Xi - nextXi) > precision)
        plot([Xi Xi], [Xi func(Xi)], 'k-');
        plot([Xi nextXi], [Xi func(nextXi)], 'k--'); 
        Xi = nextXi;
        nextXi = func(nextXi);
        data = [data; {char(vpa(Xi)), char(vpa(nextXi)), char(vpa(func(nextXi) - nextXi)), abs(Xi - nextXi), abs((Xi - nextXi) / nextXi) * 100}];
        i = i + 1;
    end
    data = {data colNames};
    data =  [data {char(vpa(nextXi)) abs(Xi - nextXi) sprintf('%d',i)}];
end

function answer = g(func, x)
    i = 1;
    answer = zeros(1, length(x));
    while(i <= length(x))
        answer(i) = func(x(i));
        i = i +1;
    end
end