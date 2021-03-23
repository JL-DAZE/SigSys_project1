load('ReceivedSignal.mat');
fs = 100;
duration = 0.5;
pulse = 0: 1/(fs*duration/2) : 1-1/(fs*duration/2);
msg = decode(ReceivedSignal,100,pulse);
fprintf("The received message is: %s\n", msg);