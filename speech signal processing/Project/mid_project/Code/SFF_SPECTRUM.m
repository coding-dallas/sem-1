function [env, env_wt]=SFF_SPECTRUM(wav,fs,freq_step,f1,f2,r)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code to find single freqncy filtered envelopes wave from speech Signal
% Edited by: G Krishna  (Speech Lab, IIIT Hyderabad)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------       inputs         --------
% wav       : input raw speech signal
% fs        : sampling freqnecy
% freq_step : freqncy step size in finding the envelopes
% --------      outputs         --------
% env       : single freqncy envelopes by SFF
% env_et    : weighted single freqncy envelopes by SFF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% pre-emphasis
if nargin < 6
    r=0.995;
end 
x=wav;

fk=f1:freq_step:f2;

wk=2*pi*fk/fs;

%% single pole filter (neumarator,dinomirator,signal)

for itr=1:length(wk)
    yk(:,itr)=abs(hilbert(abs(filter(1,[1 -r*exp(1j*wk(itr))],x))));
end
env=yk;


wks=mean(env)./mean(mean(env));
for itr=1:length(wks)
    env_wt(:,itr)=env(:,itr)*(wks(itr));
end
end