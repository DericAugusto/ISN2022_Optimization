function [J] = discretJ(X, s)

global N h x_ref Q rho s_ref

J = 0;

for i = 1 : N
    J = J + (h/2)*((X(:, i) - x_ref)'*Q*(X(:, i) - x_ref) + rho*(s(i) - s_ref)^2);
end

J = J + 0.5*(X(:, N) - x_ref)'*Q*(X(:, N) - x_ref);

end