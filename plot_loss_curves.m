%% COMUNE
epoch=xlsread('loss_log_plotting_data_train.xlsx','C4:C43');
%% TRAIN LOSS
G_A_loss_train=xlsread('loss_log_plotting_data_train.xlsx','F4:F43');
D_A_loss_train=xlsread('loss_log_plotting_data_train.xlsx','G4:G43');
%%
cycle_A_loss_train=xlsread('loss_log_plotting_data_train.xlsx','H4:H43');
idt_A_loss_train=xlsread('loss_log_plotting_data_train.xlsx','I4:I43');
%%
G_B_loss_train=xlsread('loss_log_plotting_data_train.xlsx','K4:K43');
D_B_loss_train=xlsread('loss_log_plotting_data_train.xlsx','L4:L43');
%%
cycle_B_loss_train=xlsread('loss_log_plotting_data_train.xlsx','M4:M43');
idt_B_loss_train=xlsread('loss_log_plotting_data_train.xlsx','N4:N43');
%% VALID LOSS
%G_A_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','F4:F23');
D_A_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','G4:G43');
%%
%cycle_A_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','H4:H23');
%idt_A_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','I4:I23');
%%
%G_B_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','K4:K23');
D_B_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','L4:L43');
%%
%cycle_B_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','M4:M23');
%idt_B_loss_valid=xlsread('loss_log_plotting_data_valid.xlsx','N4:N23');
%% TRAIN LOSS PLOTS
fig1=figure(1);
plot(epoch, G_A_loss_train, epoch, D_A_loss_train);
title('GA and DA Losses');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 2]);
grid on;
legend({'GA-loss','DA-loss'},'Location','northeast');
saveas(fig1,'GA and DA Losses.pdf');
%%
fig2=figure(2);
plot(epoch, cycle_A_loss_train, epoch, idt_A_loss_train);
title('Cycle and Identity Loss of branch A');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1]);
grid on;
legend({'CycleA-loss','IDTA-loss'},'Location','northeast');
saveas(fig2,'Cycle and Identity Loss of branch A.pdf');
%%
fig3=figure(3);
plot(epoch, G_B_loss_train, epoch, D_B_loss_train);
title('GB and DB Losses');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1]);
grid on;
legend({'GB-loss','DB-loss'},'Location','northeast');
saveas(fig3,'GB and DB Losses.pdf');
%%
fig4=figure(4);
plot(epoch, cycle_B_loss_train, epoch, idt_B_loss_train);
title('Cycle and Identity Loss of branch B');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1]);
grid on;
legend({'CycleB-loss','IDTB-loss'},'Location','northeast');
saveas(fig4,'Cycle and Identity Loss of branch B.pdf');
%%
fig5=figure(5);
plot(epoch, cycle_A_loss_train, epoch, cycle_B_loss_train);
title('Cycle Losses of A and B branch');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1]);
grid on;
legend({'CycleA-loss','CycleB-loss'},'Location','northeast');
saveas(fig5,'Cycle Losses of A and B branch.pdf');
%% TRAIN LOSS PLOTS VS VALID LOSS PLOTS
% fig6=figure(6);
% plot(epoch, G_A_loss_train, epoch, D_A_loss_train, epoch, G_A_loss_valid, epoch, D_A_loss_valid);
% title('GA and DA Losses on train and valid');
% xlabel('epoch');
% ylabel('loss');
% xlim([1 epoch(end)]);
% ylim([0 1]);
% grid on;
% legend({'GA-loss-train','DA-loss-train','GA-loss-valid','DA-loss-valid'},'Location','northeast');
% saveas(fig6,'GA and DA Losses on train and valid.pdf');
%%
fig6=figure(6);
plot(epoch, D_A_loss_train, epoch, D_A_loss_valid);
title('D_A Losses on train and valid');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1]);
grid on;
legend({'DA-loss-train','DA-loss-valid'},'Location','northeast');
saveas(fig6,'D_A Losses on train and valid.pdf');
%%
% fig7=figure(7);
% plot(epoch, cycle_A_loss_train, epoch, idt_A_loss_train, epoch, cycle_A_loss_valid, epoch, idt_A_loss_valid);
% title('Cycle and Identity Loss of branch A on train and valid');
% xlabel('epoch');
% ylabel('loss');
% xlim([1 epoch(end)]);
% ylim([0 1]);
% grid on;
% legend({'CycleA-loss-train','IDTA-loss-train','CycleA-loss-valid','IDTA-loss-valid'},'Location','northeast');
% saveas(fig7,'Cycle and Identity Loss of branch A on train and valid.pdf');
%%
% fig8=figure(8);
% plot(epoch, G_B_loss_train, epoch, D_B_loss_train, epoch, G_B_loss_valid, epoch, D_B_loss_valid);
% title('GB and DB Losses on train and valid');
% xlabel('epoch');
% ylabel('loss');
% xlim([1 epoch(end)]);
% ylim([0 1.5]);
% grid on;
% legend({'GB-loss-train','DB-loss-train','GB-loss-valid','DB-loss-valid'},'Location','northeast');
% saveas(fig8,'GB and DB Losses on train and valid.pdf');
%%
fig8=figure(8);
plot(epoch, D_B_loss_train, epoch, D_B_loss_valid);
title('D_B Losses on train and valid');
xlabel('epoch');
ylabel('loss');
xlim([1 epoch(end)]);
ylim([0 1.5]);
grid on;
legend({'DB-loss-train','DB-loss-valid'},'Location','northeast');
saveas(fig8,'D_B Losses on train and valid.pdf');
%%
% fig9=figure(9);
% plot(epoch, cycle_B_loss_train, epoch, idt_B_loss_train, epoch, cycle_B_loss_valid, epoch, idt_B_loss_valid);
% title('Cycle and Identity Loss of branch B on train and valid');
% xlabel('epoch');
% ylabel('loss');
% xlim([1 epoch(end)]);
% ylim([0 1]);
% grid on;
% legend({'CycleB-loss-train','IDTB-loss-train','CycleB-loss-valid','IDTB-loss-valid'},'Location','northeast');
% saveas(fig9,'Cycle and Identity Loss of branch B on train and valid.pdf');
%%
% fig10=figure(10);
% plot(epoch, cycle_A_loss_train, epoch, cycle_B_loss_train, epoch, cycle_A_loss_valid, epoch, cycle_B_loss_valid);
% title('Cycle Losses of A and B branch on train and valid');
% xlabel('epoch');
% ylabel('loss');
% xlim([1 epoch(end)]);
% ylim([0 1]);
% grid on;
% legend({'CycleA-loss-train','CycleB-loss-train','CycleA-loss-valid','CycleB-loss-valid'},'Location','northeast');
% saveas(fig10,'Cycle Losses of A and B branch on train and valid.pdf');