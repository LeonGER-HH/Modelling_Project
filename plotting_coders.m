clear, clc
% simulating and plotting the functionality of the encoder/decoder subsys.
set_param('simulation4coders/sw_mal', 'sw', '0')
set_param('simulation4coders/sw_fld', 'sw', '0')
fig1 = figure;
fig2 = figure;
fig3 = figure;
fig4 = figure;
fig5 = figure;
fig6 = figure;

% %%% testing with a ramp signal
results = sim('simulation4coders.slx',10);
decoder_out = results.yout{2}.Values;
encoder_out = results.yout{6}.Values;
%encoder output
figure(fig1)
hold on
plot(encoder_out,'LineWidth',3)
ylim([0 1.2])
title("")
xlabel("time [s]")
ylabel("encoder output [bit]")
saveas(gcf,'images4report/sim_coder/sim1_encoder.png')
%decoder output
figure(fig2)
hold on
plot(decoder_out,'LineWidth',3)
grid()
title("")
xlabel("time [s]")
ylabel("decoder output [i for state q_i]")
saveas(gcf,'images4report/sim_coder/sim1_decoder.png')

%%%testing with a malfunctioning sensor
set_param('simulation4coders/sw_mal', 'sw', '1')
results = sim('simulation4coders.slx',10);
decoder_out = results.yout{2}.Values;
encoder_out = results.yout{6}.Values;
q_mal = results.yout{3}.Values;
q_fld = results.yout{4}.Values;
%encoder output
figure(fig3)
hold on
plot(encoder_out,'LineWidth',3)
ylim([0 1.2])
title("")
xlabel("time [s]")
ylabel("encoder output [bit]")
saveas(gcf,'images4report/sim_coder/sim2_encoder.png')
%decoder output
figure(fig4)
hold on
plot(decoder_out,'LineWidth',3)
plot(q_mal,'LineWidth',3)
legend("decoder output", "malfunction alarm")
grid()
title("")
xlabel("time [s]")
ylabel("signal")
saveas(gcf,'images4report/sim_coder/sim2_decoder.png')

%%%testing with an over flooding alarm
set_param('simulation4coders/sw_mal', 'sw', '0')
set_param('simulation4coders/sw_fld', 'sw', '1')
results = sim('simulation4coders.slx',10);
decoder_out = results.yout{2}.Values;
encoder_out = results.yout{6}.Values;
q_mal = results.yout{3}.Values;
q_fld = results.yout{4}.Values;
%encoder output
figure(fig5)
hold on
plot(encoder_out,'LineWidth',3)
ylim([0 1.2])
title("")
xlabel("time [s]")
ylabel("encoder output [bit]")
saveas(gcf,'images4report/sim_coder/sim3_encoder.png')
%decoder output
figure(fig6)
hold on
plot(decoder_out,'LineWidth',3)
plot(q_fld,'LineWidth',3)
legend("decoder output", "over flooding alarm")
grid()
title("")
xlabel("time [s]")
ylabel("signal")
saveas(gcf,'images4report/sim_coder/sim3_decoder.png')


