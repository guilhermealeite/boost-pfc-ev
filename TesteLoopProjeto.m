% PARÂMETROS FIXOS
Vin = 127; % Tensão RMS
VG = Vin * sqrt(2); % Tensão de pico
Vout = 500; % Tensão de saída
fs = 40e3; % Freq. de comutação
Ts = 1/fs;
fL = 60; % Freq. da rede
omega_L = 2*pi*fL;
Delta_Vo = 5; % Ripple de tensão
Mb = Vout / VG;

% Parâmetro base para cálculo do indutor e capacitor
P_nom = 5000; % Potência nominal para dimensionamento
Io_nom = P_nom / Vout;
Dcrit_base = 1 - (VG * sin(pi/2)) / Vout;
D_base = 0.9 * Dcrit_base; % Duty fixo para cálculo

% Calcular indutor e capacitor uma única vez com base no P_nom
L_integral = integral(@(theta) (Mb .* sin(theta).^2) ./ (Mb - sin(theta)), 0, pi);
L_fixed = (VG^2 * D_base^2) / (2 * P_nom * pi * fs) * L_integral;

C_integral = integral(@(theta) abs((VG .* D_base^2) ./ (2 * L_fixed * fs) .* ...
    (sin(theta).^2 ./ (Mb - sin(theta))) - Io_nom), 0, 1/(4*fL));
C_fixed = C_integral / Delta_Vo;

%% === 1) GRÁFICO: Potência vs ILmax (L e C fixos) ===
P_vec = 500:500:20000;
ILmax_P = zeros(size(P_vec));

for i = 1:length(P_vec)
    P = P_vec(i);
    Io = P / Vout;
    D = D_base; % Duty fixo
    t = 0:Ts:1/(2*fL);
    IL = VG .* sin(omega_L * t) * D * Ts / L_fixed;
    ILmax_P(i) = max(IL);
end

% Plot: Potência vs ILmax
figure;
plot(P_vec, ILmax_P, '-o', 'LineWidth', 2);
xlabel('Potência de Saída (W)');
ylabel('Corrente Máxima do Indutor IL_{max} (A)');
title('IL_{max} vs Potência (L e C fixos)');
grid on;

%% === 2) GRÁFICO: Razão Cíclica vs ILmax (L e C fixos) ===
D_vec = linspace(0.1, 0.99 * Dcrit_base, 100);
ILmax_D = zeros(size(D_vec));

for i = 1:length(D_vec)
    D = D_vec(i);
    t = 0:Ts:1/(2*fL);
    IL = VG .* sin(omega_L * t) * D * Ts / L_fixed;
    ILmax_D(i) = max(IL);
end

% Plot: Duty Cycle vs ILmax
figure;
plot(D_vec, ILmax_D, '-s', 'LineWidth', 2);
xlabel('Razão Cíclica D');
ylabel('Corrente Máxima do Indutor IL_{max} (A)');
title('IL_{max} vs Razão Cíclica (L e C fixos)');
grid on;
