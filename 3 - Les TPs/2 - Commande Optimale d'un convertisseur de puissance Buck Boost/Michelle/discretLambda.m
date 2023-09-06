function [lbd] = discretLambda(X, s)

global N Q x_ref h A1 A2

lbd = zeros(2, N);
lbd(:, N) = Q*(X(:, N) - x_ref);

for i = 1 : N - 1
    lbd(:, N - i) = lbd(:, N - i + 1) + h*(s(N - i + 1)*(A1 - A2)'*lbd(:, N - i + 1) + A2'*lbd(:, N - i + 1) + Q*(X(:, N - i + 1) - x_ref));
end

end