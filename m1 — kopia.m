close all;


TzewN = -20;
qgN = 2000;
Twew0 = 20;
Tg0 = 40;

Cpp = 1005;
ROp = 1.2;
Cpo = 2400;
ROo = 1200;

stepTime = 1000;

Tzew0 = TzewN + 0;
qg0 = qgN * 1.0;

dqg = 0 * qg0;
dTzew = 3;


k=5;
T=2521.5;
T0=986.5;

Kp = 0.9*T/(k*T0);
Ti = 3.33*T0;



Twew_zadana = Twew0;
dTwew = 0;






Cvw = Cpp*ROp*60;
Cvg = Cpo*ROo*0.005;

Kcg = qg0/(Tg0-Twew0);
Kcw = qg0/(Twew0-Tzew0);

A = zeros(2);

A(1,1) = (-(Kcg+Kcw))/Cvw;
A(1,2) = Kcg/Cvw;
A(2,1) = Kcg/Cvg;
A(2,2) = (-Kcg)/Cvg;

B = zeros(2);

B(1,2) = Kcw/Cvw;
B(2,1) = 1/Cvg;


init_con = [Twew0;Tg0];

M1=[Cvw*Cvg,Cvg*(Kcg+Kcw)+Cvw*Kcg,Kcw*Kcg];
L1=Kcg;
L2=[Cvg*Kcw,Kcg*Kcw];
L3=[Cvw,Kcg+Kcw];
L4=Kcg*Kcw;

% figure(1);
% subplot(211);
% 
% plot(out.TwewInt,'b',"LineWidth", 4);
% hold on;
% % plot(out.TwewSt,'r-.',"LineWidth", 2.5);
% % plot(out.TwewTr,'y:',"LineWidth", 2);
% plot(out.TwewId,'g--',"LineWidth", 2);
% ylabel("Twew");
% xlabel("t");
% title("");
% 
% % figure(2);
% subplot(212);
% 
% plot(out.TgInt,'b',"LineWidth", 4);
% hold on;
% plot(out.TgSt,'r-.',"LineWidth", 2.5);
% plot(out.TgTr,'y:',"LineWidth", 2);
% ylabel("Tg");
% xlabel("t");
% title("");







