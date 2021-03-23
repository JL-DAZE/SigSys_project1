function msg = decode(sig_received,fs,varargin)
    if (nargin<3)
        pulse = ones(1, int(fs*0.3)); 
    else
        pulse = varargin(0);
    end
    
    T = length(pulse);
    Filtered = conv(sig_received, fliplr(pulse));
    N = floor(length(sig_received) / length(pulse));
    result = zeros(1, N);
    for i = 1:N
       if Filtered(i * T) > 1
           result(i) = 1;        
       end
    end
    


end