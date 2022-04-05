close all;
clc;



Tzew0 = -20;
qg0 = 2000;
Twew = 20;
Tg = 40;
Cpp = 1005;
ROp = 1.2;
Cpo = 2.4;
ROo = 1200;

stepTime = 1000;
dqg = 200;
dTzew = 0;




Cvw = Cpp*ROp*100;
Cvg = Cpo*ROo*5*0.001;

Kcg = qg0/(Tg-Twew);
Kcw = qg0/(Twew-Tzew0);

A = zeros(2);

A(1,1) = (-(Kcg+Kcw))/Cvw;
A(1,2) = Kcg/Cvw;
A(2,1) = Kcg/Cvg;
A(2,2) = (-Kcg)/Cvg;

B = zeros(2);

B(1,2) = Kcw/Cvw;
B(2,1) = 1/Cvg;


init_con = [Twew;Tg];

M1=[Cvw*Cvg,Cvg*(Kcg+Kcw)+Cvw*Kcg,Kcw*Kcg];
L1=Kcg;
L2=[Cvg*Kcw,Kcg*Kcw];
L3=[Cvw,Kcg+Kcw];
L4=Kcg*Kcw;

% figure(1);
subplot(211);

plot(out.TwewInt,'b',"LineWidth", 4);
hold on;
plot(out.TwewSt,'r-.',"LineWidth", 2.5);
plot(out.TwewTr,'y:',"LineWidth", 2);
ylabel("Twew");
xlabel("t");
title("");

% figure(2);
subplot(212);

plot(out.TgInt,'b',"LineWidth", 4);
hold on;
plot(out.TgSt,'r-.',"LineWidth", 2.5);
plot(out.TgTr,'y:',"LineWidth", 2);
ylabel("Tg");
xlabel("t");
title("");







