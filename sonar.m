sampleRate = 100;
timeStep = 1 / sampleRate;
load('ActiveSonar.mat');

figure;
hold on;
xPing = timeStep:timeStep:timeStep*length(SonarPing);
xEcho = timeStep:timeStep:timeStep*length(SonarEcho);
plot(xPing, SonarPing,'-r');
plot(xEcho, SonarEcho,'-b');
title('Ping signal and echo signal');
xlabel('Time (s)');
ylabel('Signal');
legend('Ping signal', 'Echo signal');
hold off;

echoLength = length(SonarEcho);
T = length(SonarPing);

filtered = conv(SonarEcho, fliplr(SonarPing));
figure;
hold on;
xFiltered = timeStep:timeStep:timeStep*length(filtered);
plot(xFiltered, filtered, '-r');
title('Filtered signal');
xlabel('Time (s)');
ylabel('Signal');
legend('Filtered signal');
hold off;

% calculate and show match result
[value, index] = max(filtered);
result = index - T;
figure;
hold on;
xPing = timeStep:timeStep:timeStep*length(SonarPing);
xEcho = timeStep:timeStep:timeStep*length(SonarEcho);
plot(xPing, SonarPing,'-r');
plot(xEcho, SonarEcho,'-b');
title('The matched pattern on Ping signal');
xlabel('Time (s)');
ylabel('Signal');
plot([result*timeStep result*timeStep],[min(SonarEcho) max(SonarEcho)],'-p')
plot([(result + T)*timeStep (result + T)*timeStep],[min(SonarEcho) max(SonarEcho)],'-p')
legend('Ping signal', 'Echo signal');
txt = '\leftarrow Matched pattern \rightarrow';
text(result*timeStep,max(SonarEcho),txt);
hold off;

distance = result / 100 * 5000 / 2;
fprintf("The distance is %d\n", distance);
