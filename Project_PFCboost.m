clc
clear all

VG = 127*sqrt(2);
Vo = 500;
Po = 15000;
fs = 40000;
fL = 60;
wL = 2*pi*fL;
TL = 1/fL;

%% Projeto para maior potência
Dcrit = (Vo - VG)/Vo;
D = 0.9*Dcrit;
R = Vo^2/Po;
DeltaVo = 0.2*Vo;
Mb = (Vo/VG);

syms tta
A = double(int((Mb*(sin(tta))^2)/(Mb - sin(tta)),0,pi));
L = double(((VG^2*D^2)/(2*Po*fs*pi))*A);

D
L
R

syms t
iD_Ts = ((VG*D^2)/(2*L*fs))*((sin(2*pi*fL*t))^2)/(Mb - sin(2*pi*fL*t));
iCB = iD_Ts - Po/Vo;
DeltaQCB = int(abs(iCB),0,(1/(4*fL)));
CB = double(DeltaQCB/DeltaVo)
CB_micro = (10^6)*CB;

%% Cálculos para menor potência
Vo2 = 500;
VG2 = VG;
fs2 = fs;
Po2 = 750;
Dcrit2 = (Vo2- VG2)/Vo2;
R2 = Vo2^2/Po2;
Mb2 = (Vo2/VG2);
A2 = int((Mb2*(sin(tta))^2)/(Mb2 - sin(tta)),0,pi);
D2 = double(sqrt((2*Po2*fs2*pi*L/(VG2^2*A2))))

syms t
iD_Ts2 = ((VG2*D2^2)/(2*L*fs2))*((sin(2*pi*fL*t))^2)/(Mb2 - sin(2*pi*fL*t));
iCB2 = iD_Ts2 - Po2/Vo2;
DeltaQCB2 = int(abs(iCB2),0,(1/(4*fL)));
CB2 = double(DeltaQCB2/DeltaVo)
CB_micro2 = (10^6)*CB2;

x = linspace(0.1, 0.7, 100)
x = double(sqrt((2*Po2*fs2*pi*L/(VG2^2*A2))))
ylim([min(Po2), max(Po2)]); % Ajusta os limites do eixo Y para garantir que os valores sejam visíveis
plot(x, Po2, 'b', 'LineWidth', 2); % Plota a função com uma linha azul
xlabel('x'); % Rótulo do eixo x
ylabel('Po2'); % Rótulo do eixo y
title('Gráfico da função dada'); % Título do gráfico
grid on; % Habilita a grade
