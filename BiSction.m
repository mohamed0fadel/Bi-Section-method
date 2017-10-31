function [ root ] = BiSction( xl, xu, f, tol )

if(xl >= xu)
    root = NaN;
    disp('error, xl > xu')
    return
end
if (tol <= 0)
    root = NaN;
    disp('error, tolerance <= 0')
    return
end
if(f(xl) * f(xu) > 0)
    root = NaN;
    disp('error, ... ')
    return
end
if(f(xl) == 0)
    root = xl;
    return
end
if(f(xu) == 0)
    root = xu;
    return
end


err = tol+1;
xmold = 0;
while(err > tol)
    xm = (xl+xu)/2;
    if(f(xl)*f(xm) < 0)
        xu = xm;
    elseif (f(xl)*f(xm) > 0)
        xl = xm;
    elseif (f(xl)*f(xm) == 0)
        root = xm;
        return
    end
err = abs((xm - xmold)/xm*100);
xmold = xm;
root = xm;
end
end

