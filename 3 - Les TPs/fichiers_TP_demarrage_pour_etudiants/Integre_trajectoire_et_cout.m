% Integre la trajectoire et les couts etant donnees un etat
% initial x0 et une loi de commande uk sur l'intervalle [0,N*dt]
% Entrees
%    x0 : etat initial au temps 0
%    uk : loi de commande sur l'intervalle [0,N*dt] (taille 1*N)
% Sorties
%    xk : trajectoire sur l'intervalle [0,N*dt] (taille 2*N)
%    Jk : cout total incluant le cout integral et le cout terminal
function [xk,Jk] = Integre_trajectoire_et_cout(x0,uk,A1,A2,B1,B2,Vi,dt,C_out,nx,N,Q,Qf,xref,uref,rho)
xk=zeros(nx,N+1); % commande courante
Jk = 0;
for nt=1:N
    % Notations : 
    % u_precedent : commande au temps t
    % x_precedent : etat au temps t
    % x_suivant : etat au temps t+dt

    u_precedent=uk(:,nt);
    x_precedent=xk(:,nt);
    x_suivant = integre_etat(x_precedent,u_precedent,A1,A2,B1,B2,Vi,dt,C_out);

    xk(:,nt+1)= x_suivant;

    % d/ Calculer le cout integral sur [0,t+dt] en fonction du cout
    %    sur [0,t] (sans le cout terminal)
    %    On supposera le cout L constant sur cet interval egale a
    %    la moyenne entre les couts L au temps t et au temps t+dt
    % <A COMPLETER>
    % Lk = 
    % Jk = 
end
        
% e/ Ajouter le cout terminal au cout integral
% <A COMPLETER>
% Jk = 

end