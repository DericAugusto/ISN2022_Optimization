% Integration a rebours de l'etat adjoint
% Entrees :
%    u_precedent : commande au temps t
%    x_precedent : etat au temps t
%    x_suivant : etat au temps t+dt
%    p_suivant : etat adjoint au temps t+dt
% Sorties :
%    p_precedent : etat adjoint au temps t
%    v_precedent : candidat pour la commande au temps t
function [p_precedent, v_precedent] = integre_adjoint_a_rebour(p_suivant,u_precedent,x_suivant,x_precedent,A1,A2,B1,B2,Vi,rho,Q,xref,uref,dt,C_out)
% a/ Ecrire l'equation de l'adoint sous la forme dp/dt = - Bt - At*p
%    avec At qui depend de la commande u_precedent et Bt qui depend
%    de x_suivant
    % <A COMPLETER>
    % At=
    % Bt=
    
% b/ Equation augmentee : on note
%    p2 = [p;1], en deduire AAt tel que dp2/dt = AAt * p2
    % <A COMPLETER>
    % AAt=
    
% c/ Integration a rebours :
%    En supposant AAt constante entre t et t+dt, donner p_precedent en
%    fonction de p_suivant
    % <A COMPLETER>
    % p_precedent=
    
% d/ En deduire v_prededant en fonction de p_precedent et x_precedent
    % <A COMPLETER>
    % v_precedent=
end