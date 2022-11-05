clear, clc
% simulating and plotting the functionality of the encoder/decoder subsys.
fig1 = figure;
fig2 = figure;
fig3 = figure;
fig4 = figure;
fig5 = figure;

% %%% testing with a ramp signal
results = sim('controlled_system.slx',10);
theta_out = results.yout{1}.Values;
theta_dot_out = results.yout{2}.Values;
l_1_out = results.yout{3}.Values;
i_d_out = results.yout{4}.Values;
T_R_out = results.yout{5}.Values;

%Theta
figure(fig1)
hold on
plot(theta_out,'LineWidth',3)
title("")
xlabel("time [s]",'Interpreter','latex')
ylabel("Theta [rad]",'Interpreter','latex')
saveas(gcf,'images4report/sim1_theta.png')

%Theta_dot
figure(fig2)
hold on
plot(theta_dot_out,'LineWidth',3)
title("")
xlabel("time [s]",'Interpreter','latex')
ylabel("Theta_dot [rad/s]",'Interpreter','latex')
saveas(gcf,'images4report/sim1_theta_dot.png')

%l_1
figure(fig3)
hold on
plot(l_1_out,'LineWidth',3)
title("")
xlabel("time [s]",'Interpreter','latex')
ylabel("Water height [m]",'Interpreter','latex')
saveas(gcf,'images4report/sim1_l_1.png')

%i_d
figure(fig4)
hold on
plot(i_d_out,'LineWidth',3)
title("")
xlabel("time [s]",'Interpreter','latex')
ylabel("i_d [\muA]",'Interpreter','latex')
saveas(gcf,'images4report/sim1_i_d.png')

%T_R
figure(fig5)
hold on
plot(T_R_out,'LineWidth',3)
title("")
xlabel("time [s]")
ylabel("T_R [Celsius]")
saveas(gcf,'images4report/sim1_T_R.png')