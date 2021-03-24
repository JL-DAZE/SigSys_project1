function signal = encode(msg, pulse)
    pulseLength = length(pulse);
    msgLength = length(msg);
    signalLength = msgLength * pulseLength;
    signal = zeros(1, signalLength);
    
    AsciiFile = fopen("ascii.code");
    Ascii = textscan(AsciiFile, "%s %s");
    for i = 1:msgLength
        ch = msg(i);
        if ch == ' '
            index = 1;
        else
            lookupStr = strcat(ch, ":");
            index = Ascii{1} == lookupStr;
            
            findFlag = 0;
            for j = 1:length(index)
                if index(j) == 1
                    findFlag = 1;
                    break;
                end
            end
            
            if findFlag == 0
                fprintf(2, "\nEncode.m: Character not supported, aborting\n\n");
                signal = zeros(signalLength, 1);
                return;
            end
        end
            
        signalPiece = Ascii{2}{index};
        for j = 1:8
            if signalPiece(j) == '1'
                signal((8*(i-1)+(j-1))*pulseLength+1:(8*(i-1)+j)*pulseLength) = pulse;
            else
                signal((8*(i-1)+(j-1))*pulseLength+1:(8*(i-1)+j)*pulseLength) = -1 * pulse;
            end
        end
    end
end
            