clear
close all

% Parametres
tf=3;
%Pas de discretisation
N=100; % nombre de discretisation temporelle
dt=tf/N;
% Precision
prec=1.e-6;

% Parametres convertisseur
Vi=10 % Vi tension d'entree
R=1
L=.3/echelle;
C=.1/echelle;

% syst�me
A1=[0 0;0 -1/(R*C)];
A2=[0 -1/L;1/C -1/(R*C)];
B1=[1/L;0];
B2=zeros(2,1);

% matrice de sortie
C_out=[eye(2) zeros(2,1)];

% point d'equilibre
v0ref = 15; % tension de sortie souhaitee
uref = v0ref/(v0ref + Vi);
A=uref*A1+(1-uref)*A2;
B=uref*B1+(1-uref)*B2;
xref=-A\(B*Vi);

% Matrice des Criteres a optimiser
Q=[100 0;0 1];
Qf=.1*[1 0;0  1];
rho=1;

nx=2; % dimension du systeme
Maxiter=30; % nombre d'iteration maximal
profondeur=30; % index max pour k (mise a jour de la commande u)
beta=.5;

% Initialisation
u=uref*ones(1,N); % commande par default
v=zeros(size(u)); % commande optimale temporaire
x0=zeros(2,1); % etat au temps initial
U11=zeros(1,N,profondeur); % matrice des commandes
X11=zeros(nx,N+1,profondeur); % matrice des trajectoires
JJJ=zeros(1,profondeur); % vecteur des couts optimaux
t=[0:N-1]*dt; % vecteur du temps (sauf temps final)
tx=[0:N]*dt; % vecteur du temps

%Initialisation de la trajectoire et du critere par integration
[x,J] = Integre_trajectoire_et_cout(x0,u,A1,A2,B1,B2,Vi,dt,C_out,nx,N,Q,Qf,xref,uref,rho);

% Boucle d'optimisation numerique
test=true; % critere d'arret
compteur=1;
while test
    Jold =J;
    uold=u;
    xold=x;
    
    % Condition de transversalite : 
    p=zeros(nx,N+1);
    % <A COMPLETER>
    % - Mettre a jour l'etat adjoint p au temps (N+1)*dt
    
    % Integration a rebours du systeme adjoint
    % Faire un boucle pour calculer l'adjoint
    % p en partant du temps (N+1)*dt jusqu'a 0
    % <A COMPLETER>
    % - Appeler la fonction "integre_adjoint_a_rebour"
    % - doit mettre a jour la matrice p
    % - doit mettre a jour le vecteur v
    
    % Mise a jour de la commande et de la trajectoire
    k_array = 0:2:profondeur;
    for comp = 1:length(k_array)
        k = k_array(comp);
        
        % Mise a jour de la commande (sur tout l'intervalle de temps)
        % <A COMPLETER>
        % - Calculer uk en fonction de k, u, beta, et v
        
        % Parcours de l'intervalle de temps et integration de la
        % trajectoire et du cout
        [xk,Jk] = Integre_trajectoire_et_cout(x0,uk,A1,A2,B1,B2,Vi,dt,C_out,nx,N,Q,Qf,xref,uref,rho);

        % Stocker le cout total, la commande courante et la trajectoire
        % courante
        JJJ(comp)=Jk;
        U11(:,:,comp)=uk;
        X11(:,:,comp)=xk;
    end
    
    % Suppression des variables n'ayant pas ete affectee
    U11 = U11(1,:,1:comp);
    X11 = X11(:,:,1:comp);
    JJJ = JJJ(1,1:comp);
    
    
    figure(4)
    hold on
    plot(k_array,JJJ)
    plot(k_array(1),JJJ(1),'.')
    plot(k_array(end),JJJ(end),'*')
    title('Cout total')
    legend('')

    % Calculer le cout minimal ainsi que l'index donnant ce minimum
    [Jk,i]=min(JJJ(1:comp));
    % En deduire les commande et trajectoire optimale
    uk=U11(:,:,i);
    xk=X11(:,:,i);
    
    % Tester le critere d'arret
    % <A COMPLETER>
    % - Mettre a jour le critere d'arret test
    
    u=uk;
    x=xk;
    J=Jk;
    
    
    if mod(compteur,2)==0
        % Afficher la trajectoire optimale courante
        figure(2)
        hold on
        plot(t,u,'r')
        plot(t,uref*ones(size(t)),'--g')
        title('commande optimale')
        legend('')
        
        figure(1)
        hold on
        plot(tx,x(1,:),'r',tx,x(2,:),'b',tx,ones(size(tx))*xref(1),'--g',tx,ones(size(tx))*xref(2),'--g')
        pause(.001)
        title('trajectoire optimale')
        legend('x1','x2','x1ref','x2ref')
        %drawnow
    end
    compteur=compteur+1;
end

t=[0:N-1]*dt;
figure(2)
hold on
plot(t,u,'b')
plot(t,uref*ones(size(t)),'--g')
title('commande optimale')

figure(1)
hold on
plot(tx,x(1,:),'r',tx,x(2,:),'b',tx,ones(size(tx))*xref(1),'--g',tx,ones(size(tx))*xref(2),'--g')
title('Trajectoire optimale')



