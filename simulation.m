


#attenuation = 100;
ref1 = audioread ("ReferenceNoise1.wav");
ref2 = audioread ("ReferenceNoise2.wav");
ref3 = audioread ("ReferenceNoise3.wav");
ref4 = audioread ("ReferenceNoise4.wav");
ref5 = audioread ("ReferenceNoise5.wav");
noise = audioread ("BackgroundRealLoop1.wav");



#micSim = [];
#for i=1:10;
#	micSim = cat (1, micSim, ref1 + (0.3 * ref2) +  (0.01*ref3) + ref4);
#endfor


conv1 = fftconv(noise, flip(ref1));

#conv2 = fftconv(noise, flip(ref2));

plot (1:size(conv1)(1), conv1);

