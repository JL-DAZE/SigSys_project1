sampleRate = 100;
timeStep = 1 / sampleRate;
load('ActiveSonar.mat');

figure;
hold on;
xPing = sampleRate:sampleRate:sampleRate*length(SonarPing);
xEcho = sampleRate:sampleRate:sampleRate*length(SonarEcho);
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
xFiltered = sampleRate:sampleRate:sampleRate*length(filtered);
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
hold on
plot(SonarPing,'-r');
plot(SonarEcho,'-b');
plot([result result],[min(SonarEcho) max(SonarEcho)],'-p')
plot([result + T result + T],[min(SonarEcho) max(SonarEcho)],'-p')

distance = result / 100 * 5000 / 2;
fprintf("The distance is %d\n", distance);
