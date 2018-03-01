function sig = getPoissonDistributedSignal(seq)
% getPoissonDistributedSignal: 
%
% Inputs:
%  seq - Array
%
% Output:
%  sig - Array 
%  
    seq_without_tails = seq(1:end-500);
    seq_tails = seq(end-499:end);
    
    sig_main = genSignal(seq_without_tails);
    
    sig = [-1 * fliplr(sig_main(1:500)), sig_main, genSignal(seq_tails)];
end

function sig = genSignal(seq)
% genSignal: 
%
% Inputs:
%  seq - Array
%
% Output:
%  sig - Array 
% 
    sig_len = 0;
    sig = [];

    seq_min = min(seq);
    seq_max = max(seq);
    seq_len = length(seq);
    
    while (sig_len ~= seq_len)
        try_new_number = seq_min + (seq_max - seq_min) * rand;
        nums_in_interval = length(seq((seq >= try_new_number - 100) & (seq <= try_new_number + 100)));
        if (rand > (nums_in_interval / 200)) 
            continue;
        end
        sig = unique([sig try_new_number]);
        sig_len = length(sig);
    end
end

