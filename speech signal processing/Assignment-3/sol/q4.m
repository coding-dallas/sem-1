[data, fs] = v_readwav('C:/Users/kesav/OneDrive/Desktop/Academics/speech signal processing/Assignment-3/noiosy.wav');
disp("Signal to noise ratio before enhancement:")
disp(snr(data));
[data_enhanced] = v_specsub(data, fs);
disp("Signal to noise ratio after enhancement:");
disp(snr(data_enhanced));
clean = v_writewav(data_enhanced, fs, 'C:/Users/kesav/OneDrive/Desktop/Academics/speech signal processing/Assignment-3/noisy1.wav');


