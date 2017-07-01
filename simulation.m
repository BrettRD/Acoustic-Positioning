

more off;


#attenuation = 100;
ref1 = audioread ("ReferenceNoise1.wav");
#ref2 = audioread ("ReferenceNoise2.wav");
#ref3 = audioread ("ReferenceNoise3.wav");
#ref4 = audioread ("ReferenceNoise4.wav");
#ref5 = audioread ("ReferenceNoise5.wav");
#noise = audioread ("BackgroundRealLoop1.wav");


#micSim = [];
#	micSim = cat (1, micSim, ref1 + (0.3 * ref2) +  (0.01*ref3) + ref4);
while 1;

	printf("selecting mic\n")
	microphone = audiorecorder(44100, 16, 1, 0);

	printf("starting record\n");
	recordblocking(microphone,5);

	printf("collecting data\n");
	soundSample = getaudiodata(microphone);
	croppedaudio = soundSample(44100:end);	#drop the first second

	#size(soundSample)
	#size(croppedaudio)



	printf("processing convolution\n")
	conv1 = fftconv(croppedaudio, cat(1,flip(ref1), flip(ref1)));

	#conv2 = fftconv(noise, flip(ref2));

	printf("plotting\n")
	plot (1:size(conv1)(1), conv1);
	drawnow;


endwhile
