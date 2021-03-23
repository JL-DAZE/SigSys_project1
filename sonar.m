load('ActiveSonar.mat');
figure(1);
hold on;
plot(SonarPing,'-r');
plot(SonarEcho,'-b');

echoLength = length(SonarEcho);
T = length(SonarPing);

Filtered = conv(SonarEcho, fliplr(SonarPing));
figure(2);
plot(Filtered, '-r');

% calculate and show match result
[value, index] = max(Filtered);
result = index - T;
figure(3)
hold on
plot(SonarPing,'-r');
plot(SonarEcho,'-b');
plot([result result],[min(SonarEcho) max(SonarEcho)],'-p')
plot([result + T result + T],[min(SonarEcho) max(SonarEcho)],'-p')

distance = result / 100 * 5000 / 2;
fprintf("The distance is %d\n", distance);
