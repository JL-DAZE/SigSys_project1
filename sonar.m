load('ActiveSonar.mat');
figure(1);
hold on;
plot(SonarPing,'-r');
plot(SonarEcho,'-b');

echoLength = length(SonarEcho);
pingLength = length(SonarPing);

Filtered = conv(fliplr(SonarPing), SonarEcho);
figure(2);
plot(Filtered, '-r');
