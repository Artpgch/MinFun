fs = 10^-2; 
lb = -4.5; 
ub = 4.5; 
dxy = lb:fs:ub; 
l = length(dxy); 
OFun = @(Var)(1.5-Var(1)+Var(1).*Var(2)).^2+(2.25-Var(1)+Var(1).*(Var(2).^2)).^2+(2.625-Var(1)+Var(1).*(Var(2).^3)).^2; 
[x, y] = meshgrid(dxy, dxy); 
f = zeros(l); 
for p = 1:l 
    for q = 1:l 
        f(p,q) = OFun([x(p,q), y(p,q)]); 
    end % Конец внутреннего цикла.
end % Конец цикла.

fmin = f(1,1);
for p = 1:l 
    for q = 1:l 
        if f(p,q) < fmin  
            fmin = f(p,q); 
            xmin = x(p,q);  
            ymin = y(p,q);  
        end
    end
end
D1 = ['The function takes the minimum value at x = ', num2str(xmin), ', y = ', num2str(ymin), '.']; 
D2 = ['Minimum value of the function: ', num2str(fmin), '.']; 
fprintf('\n') 
disp(D1) 
disp(D2) 
