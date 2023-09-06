function [v] = discretV(X, lbd)

global N s_ref A1 A2 B1 B2 Vi rho

v = zeros(1, N);

for i = 1 : N
    v(i) = s_ref + (lbd(:, i)'*((A2- A1)*X(:, i) + (B2 - B1)*Vi))/rho;
end

end