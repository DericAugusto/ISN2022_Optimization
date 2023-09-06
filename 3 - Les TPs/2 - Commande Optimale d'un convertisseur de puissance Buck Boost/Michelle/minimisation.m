function [X_min, s_min, J_min] = minimisation(X, s, v)

global k_max N beta

sp = zeros(k_max, N);
Xp = zeros(2*k_max + 2, N);
Jp = zeros(1, k_max);

Xp(1:2, :) = X;
Jp(1) = discretJ(X, s);

for i = 1 : k_max
    sp(i, :) = max(min(s + (beta^(i))*(v - s), 1), 0);
    Xp(2*(i - 1) + 1 : 2*i, :) = discretX(sp(i, :));
    Jp(1, i) = discretJ(Xp(2*i - 1 : 2*i, :), sp(i, :));
end

[J_min, indiceMin] = min(Jp);
s_min = sp(indiceMin, :);
X_min = Xp(2*indiceMin - 1 : 2*indiceMin, :);

end