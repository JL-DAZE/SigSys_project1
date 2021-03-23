function msg = decode(sig_received,fs,varargin)
    if (nargin<3)
        pulse = ones(1, int(fs*0.3)); 
    else
        pulse = varargin{1};
    end
    
    figure(1);
    hold on;
    plot(sig_received,'-r');
    plot(pulse,'-b');
    
    T = length(pulse);
    Filtered = conv(sig_received, fliplr(pulse));
    figure(2)
    plot(Filtered, '-r');
    N = floor(length(sig_received) / length(pulse));
    result = zeros(1, N);
    for i = 1:N
       if Filtered(i * T) > 0
           result(i) = 1;        
       end
    end
    
    display(result)
    
    AsciiFile = fopen("ascii.code");
    Ascii = textscan(AsciiFile, "%s %b");
    L = floor(length(result) / 8);
    msg = string([]);
    for i = 0:L-1
        num = 0;
        for j = 1:8
            display(result(i*8 + j))
            num = num + result(i*8 + j) * 2^(8-j);
        end
        display(num)
        index = Ascii{1,2} == num;
        char = Ascii{1,1}{index};
        if char == ":"
            msg = msg + " ";
        else
            msg = msg + char(1);
        end
    end  
end