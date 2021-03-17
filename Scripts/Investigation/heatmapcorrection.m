z = sum(sum(~isnan(P),2));
pp = zeros(z,3);
for q = 1:z
pp(q,1) = 0.05/(z-q+1);
pp(q,2) = 0.01/(z-q+1);
pp(q,3) = 0.001/(z-q+1);
end