clc;
clear all;
close all;


% Read input
[y, fs] = audioread('s.wav');
%fs = 1000; % for chirp

% Resample - not needed for chirp signals
y_resampled = resample(y, 8000, fs);
fs = 8000;
y =y_resampled;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % STFT
noverlap = 80;
window = 160;
nfft =128;
figure(1);
subplot(3,1,1);
spectrogram(y,window,noverlap, nfft, fs,'yaxis');
title('Short Time Fourier Transform');
%xlabel('time(sec)'); % chirp
xlabel('Frames');
ylabel('Frequency (k hz)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SFF
%[env, env_wt]=SFF_SPECTRUM(wav,fs,freq_step,f1,f2,r)
[env, env_wt]= SFF_SPECTRUM(y, fs, 1, 1, fs/2,.99); % change

subplot(3,1,2);
surface( env_wt','edgecolor','none');   %% Check axis
title('Single Frequency Filtering');
xlabel('Samples');
ylabel('Frequency');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ST
[st,t,f] = st(y, 1, fs, 1, 1);
% st(timeseries,minfreq,maxfreq,samplingrate,freqsamplingrate)

subplot(3,1,3);
[T, F] = meshgrid(t,f);  % not for chirp
surface(T,F,abs(st),'edgecolor','none');  
title('Stockwell Transform');
xlabel('Samples');
ylabel('Frequency *10^4 hz');

%sgtitle('For convex chirp');
sgtitle('For Fricative "s"');
