load('New_ReceivedSignal3.mat');
fs = 100;
duration = 0.5;
pulse = linspace(0,1-1/(fs*duration),fs*duration);
msg = decode(ReceivedSignal,100,pulse);
fprintf("The received message is: %s\n", msg);