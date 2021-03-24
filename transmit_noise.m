function transmit_noise(msg, pulse, sampleRate, noiseLevel)
    encodedSignal = encode(msg, pulse);
    signalLength = length(encodedSignal);
    noise = noiseLevel * randn(1, signalLength);
    noisifiedSignal = encodedSignal + noise;
    timeStep = 1 / sampleRate;
    x = timeStep:timeStep:signalLength*timeStep;
    
    hold on;
    figure(1);
    plot(x, encodedSignal, '-b');
    plot(x, noise, '-r');
    title('Original signal and noise');
    xlabel('Signal');
    ylabel('Time');
    legend({'Original signal', 'Noise'});
    hold off;
    
    hold on;
    figure(2);
    plot(x, noisifiedSignal, '-r');
    title('Noisified signal');
    xlabel('Signal');
    ylabel('Time');
    legend({'Noisified signal'});
    hold off;
    
    
end