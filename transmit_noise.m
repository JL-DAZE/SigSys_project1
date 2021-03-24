function transmit_noise(msg, pulse, sampleRate, noiseLevel)
    encodedSignal = encode(msg, pulse);
    signalLength = length(encodedSignal);
    noise = noiseLevel * randn(1, signalLength);
    noisifiedSignal = encodedSignal + noise;
    timeStep = 1 / sampleRate;
    x = timeStep:timeStep:signalLength*timeStep;
    
    figure;
    hold on;
    plot(x, encodedSignal, '-b');
    plot(x, noise, '-r');
    title('Original signal and noise');
    xlabel('Time (s)');
    ylabel('Signal');
    legend({'Original signal', 'Noise'});
    hold off;
    
    figure;
    hold on;
    plot(x, noisifiedSignal, '-r');
    title('Noisified signal');
    xlabel('Time (s)');
    ylabel('Signal');
    legend({'Noisified signal'});
    hold off;
    
    decodedMsg = decode(noisifiedSignal, sampleRate, pulse);
    fprintf(1, "\nOriginal message is: %s\n", msg);
    fprintf(1, "Decoded message is: %s\n", decodedMsg);
    if msg == decodedMsg
        fprintf(1, "Two messages match.\n\n");
    else
        fprintf(2, "Two messages does not match.\n\n");
    end
    
end