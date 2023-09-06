% Integration de l'etat
% Entrees :
%    u_precedent : commande au temps t
%    x_precedent : etat au temps t
% Sorties :
%    x_suivant : etat au temps t+dt
function x_suivant = integre_etat(x_precedent,u_precedent,A1,A2,B1,B2,Vi,dt,C_out)
% a/ Ecrire l'evolution de l'etat sous la forme
%    dx/dt = AA*x + BB avec AA qui depend de u_precedent et BB qui
%    depend de u_precedent et Vi
% <A COMPLETER>

% b/ Equation augmentee : on note
%    xbis = [x;1], en deduire Abis tel que dxbis/dt = Abis * xbis
% <A COMPLETER>

% c/ Integration de la trajectoire :
%    En supposant Abis constante entre t et t+dt, donner x_suivant en
%    fonction de x_precedent
% <A COMPLETER>

end