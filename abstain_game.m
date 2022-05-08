clear all
cr = 1;
ca = 1;

syms x u s 
 e1 = exp(((x+(1-u))^2)/(-2*(1-s)^2));
 e2 = exp(((x-(1-u))^2)/(-2*(1-s)^2));

Re1 = (1/((1-s)*(2*3.1412)^(1/2)))*17.4*0.5*int(e1,'x',((1-s)^2)/(1-u),inf);
Re2= (1/((1-s)*(2*3.1412)^(1/2)))*17.4*0.5*int(e2,'x',-inf,-((1-s)^2)/(1-u));
Re3 = (1/((1-s)*(2*3.1412)^(1/2)))*2.72*0.5*int(e1,'x',-((1-s)^2)/u,((1-s)^2)/(1-u));
Re4 = (1/((1-s)*(2*3.1412)^(1/2)))*2.72*0.5*int(e2,'x',-((1-s)^2)/u,((1-s)^2)/(1-u));

% Re = Re1+Re2+Re3+Re4+u*cr;%%
% double x
% double u
% double s
% Re = subs(Re,'s',s);
% Re = subs(Re,'u',u);
% Re = subs(Re,'x',x);


% P1 = zeros(100,100);%%
% 
% for nu= 1:1:100
%       u1 = 0.005*nu;
%      new1 = subs(Re,'u',u1);
%     for ns = 1:1:100
%         s1 = ns*0.005;
%         new2 = subs(new1,'s',s1);
%         P1(ns,nu) = new2;
%     end 
% end
% figure
% 
%  mesh(P1);
%  xlabel('u')
%  ylabel('s')
%  title('Bayesian Risk of Receiver')
 
 
  
%cost function of A 
Ae1 = (1/((1-s)*(2*3.1412)^(1/2)))*17.4*0.5*int(e2,'x',((1-s)^2)/(1-u),inf);
Ae2= (1/((1-s)*(2*3.1412)^(1/2)))*17.4*0.5*int(e1,'x',-inf,-((1-s)^2)/(1-u));
Ae3 = (1/((1-s)*(2*3.1412)^(1/2)))*2.72*0.5*int(e1,'x',-((1-s)^2)/u,((1-s)^2)/(1-u));
Ae4 = (1/((1-s)*(2*3.1412)^(1/2)))*2.72*0.5*int(e2,'x',-((1-s)^2)/u,((1-s)^2)/(1-u));

% Ae = Ae1+Ae2+Ae3+Ae4+s*ca;%%
% 
% P2 = zeros(100,100);%%
% 
% for nu= 1:1:100
%       u1 = 0.005*nu;
%      new1 = subs(Ae,'u',u1);
%     for ns = 1:1:100
%         s1 = ns*0.005;
%         new2 = subs(new1,'s',s1);
%         P2(ns,nu) = new2;
%     end 
% end
% 
% figure
%  mesh(P2);
%  xlabel('u')
%  ylabel('s')
%  title('Bayesian Risk of Jammer')
 
%gradiant Descent
s = 0.3;
u = 0.3;
P1 = zeros(1,5);
P2 = zeros(1,5);
Re=cr*u-(435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2))/(2*(1/(s - 1)^2)^(1/2)) + (2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) - (435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2)) - (2^(1/2)*pi^(1/2)*(-1))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) + (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)) - erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/u - 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1)) - (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/u - u + 1)) - erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/(u - 1) - u + 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1));
Ae=ca*s+(435*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - 8466637622688393/1125899906842624))/(62824*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u + 4343821656083283/268435456))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 7036874505825189/4503599627370496))/3))/1125899906842624))/(31412*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 4343822192954195/268435456))/3))/1125899906842624))/(31412*(s - 1));

for n = 1: 1: 5
    P22 = subs(ca*s+(435*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - 8466637622688393/1125899906842624))/(62824*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u + 4343821656083283/268435456))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 7036874505825189/4503599627370496))/3))/1125899906842624))/(31412*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 4343822192954195/268435456))/3))/1125899906842624))/(31412*(s - 1)),'s',s);
    P2(n) = subs(P22,'u',u);
    s = fmincon(@(s) ca*s+(435*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - 8466637622688393/1125899906842624))/(62824*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u + 4343821656083283/268435456))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 7036874505825189/4503599627370496))/3))/1125899906842624))/(31412*(s - 1)) - (17*2^(1/2)*7853^(1/2)*((8466637622688393*erf((2*2^(1/2)*(u - 1970324748915803/4503599627370496))/3))/1125899906842624 - (8466637622688393*erf((2*2^(1/2)*(u - 4343822192954195/268435456))/3))/1125899906842624))/(31412*(s - 1)),0,[],[],[],[],0,0.5);
    P = subs(cr*u-(435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2))/(2*(1/(s - 1)^2)^(1/2)) + (2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) - (435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2)) - (2^(1/2)*pi^(1/2)*(-1))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) + (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)) - erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/u - 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1)) - (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/u - u + 1)) - erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/(u - 1) - u + 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1)),'u',u);
    P1(n)= subs(P,'s',s);
    u = fmincon(@(u) cr*u-(435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2))/(2*(1/(s - 1)^2)^(1/2)) + (2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) - (435*2^(1/2)*7853^(1/2)*((2^(1/2)*pi^(1/2)*erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)))/(2*(1/(s - 1)^2)^(1/2)) - (2^(1/2)*pi^(1/2)*(-1))/(2*(1/(s - 1)^2)^(1/2))))/(15706*(s - 1)) + (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/(u - 1) - 1)) - erf((1/(2*(s - 1)^2))^(1/2)*(u + (s - 1)^2/u - 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1)) - (34*7853^(1/2)*pi^(1/2)*(erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/u - u + 1)) - erf((1/(2*(s - 1)^2))^(1/2)*((s - 1)^2/(u - 1) - u + 1))))/(7853*(1/(s - 1)^2)^(1/2)*(s - 1)),0,[],[],[],[],0,0.5);
    
    
 end
 
 figure
 n1 = 1:1:5;
plot(n1,P1,n1,P2);
hold on
legend('Cost of Receiver','Cost of Attacker');


% 
% 
% 
% 
% 
% 
% 
% 
% 
% 





