%% Task 1 - Thermal System Simulation using Transfer Functions
% Author: Rotimi Dayo
% Date: 23rd of April 2025
% Description: Simulates a thermal system with two capacitances and calculates
% steady-state and 2% settling time for both temperatures.

%% Load model parameters
C1 = 50; % J/K - Thermal capacitance 1
C2 = 60; % J/K - Thermal capacitance 2
R1 = 10; % K/W - Thermal resistance 1
R2 = 10; % K/W - Thermal resistance 2
R3 = 10; % K/W - Thermal resistance 3
theta_a = 293.15; % K - Ambient temperature (20°C)
qamp = 3; % W - Step Amplitude
qtime = 10; % Minutes - Step time

% Derived resistances
R12 = (R1 * R2) / (R1 + R2);
R23 = (R2 * R3) / (R2 + R3);

%% Simulate system in Simulink
simTime = 7200; % 120 minutes in seconds
simOut = sim('thermal_model', 'StopTime', num2str(simTime));

%% Extract simulation data
t = simOut.theta1.time / 60; % time in minutes
theta1 = simOut.theta1.signals.values + theta_a; % absolute temperature
theta2 = simOut.theta2.signals.values + theta_a;
q1 = simOut.q1.signals.values;

%% Step 4: Plot simulation results
figure('Position', [100, 100, 800, 600]);
% Plot 1: Temperatures
subplot(2,1,1);
plot(t, theta1, 'b-', 'LineWidth', 2); hold on;
plot(t, theta2, 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Temperature (K)');
title('System Temperatures');
legend('\theta_1(t)', '\theta_2(t)', 'Location', 'southeast');
grid on;

% Plot 2: Heat input
subplot(2,1,2);
plot(t, q1, 'g', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Heat flow (W)');
title('Input Heat Flow q_1(t)');
grid on;

%% Steady-State & 2% Settling Time Analysis
% Get steady state values
theta1_ss = theta1(end);
theta2_ss = theta2(end);

% Normalize signals for stepinfo 
theta1_norm = (theta1 - theta1(1)) / (theta1_ss - theta1(1));
theta2_norm = (theta2 - theta2(1)) / (theta2_ss - theta2(1));

% Use stepinfo with 2% settling time
info1 = stepinfo(theta1_norm, t, 'SettlingTimeThreshold', 0.02);
info2 = stepinfo(theta2_norm, t, 'SettlingTimeThreshold', 0.02);

% Calculate actual settling times after the step input
settling1_adj = info1.SettlingTime - qtime;
settling2_adj = info2.SettlingTime - qtime;

% Display results
fprintf('--- Steady-State and Settling Time ---\n');
fprintf('Theta1 Steady-State: %.2f K, Settling Time: %.2f minutes\n', theta1_ss, settling1_adj);
fprintf('Theta2 Steady-State: %.2f K, Settling Time: %.2f minutes\n', theta2_ss, settling2_adj);
