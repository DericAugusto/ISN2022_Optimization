function f = ma_function(x,y)
 
f = -3.*exp(-(x-1).^2-(y-2).^2) + ((1-x).^2).*exp(-(x+1).^2-(y-1).^2) - 2.*((x/5)-(x.^3)-(y.^5)).*exp(- x.^2 - y.^2) - (1/2).*exp(-(x+1).^2 - y.^2) + 0.1.*(x.^2+  y.^2);    

end
