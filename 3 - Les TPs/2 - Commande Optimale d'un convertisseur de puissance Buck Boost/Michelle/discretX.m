function [X] = discretX(s)

global N Vi A1 A2 B1 B2 h

X = zeros(2, N);

for i = 1 : N - 1
    % equation du modele non lineaire
    x_dot = s(i)*(A1*X(:, i) + B1*Vi) + (1 - s(i))*(A2*X(:, i) + B2*Vi);
    % integration du x_dot en utilisant le methode Euler
    X(:, i + 1) = X(:, i) + h*(x_dot);
end

end