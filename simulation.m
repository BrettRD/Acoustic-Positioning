

more off;

sampleLength = 20;	#5 seconds
sampleRate = 44100;
#attenuation = 100;
#ref1 = audioread ("ReferenceNoise1.wav");
#ref2 = audioread ("ReferenceNoise2.wav");
#ref3 = audioread ("ReferenceNoise3.wav");
#ref4 = audioread ("ReferenceNoise4.wav");
#ref5 = audioread ("ReferenceNoise5.wav");
#noise = audioread ("BackgroundRealLoop1.wav");
ref1long = audioread ("ref1Long.wav");
ref2long = audioread ("ref2Long.wav");
ref3long = audioread ("ref3Long.wav");

#micSim = [];
#	micSim = cat (1, micSim, ref1 + (0.3 * ref2) +  (0.01*ref3) + ref4);

#ref1long = ref1;
#ref2long = ref2;
#ref3long = ref3;
#
#for i=1:10
#	ref1long = cat(1, ref1long, ref1);
#	ref2long = cat(1, ref2long, ref2);
#	ref3long = cat(1, ref3long, ref3);
#endfor

printf("selecting mic\n")
microphone = audiorecorder(sampleRate, 16, 1, 10);

while 1;

	printf("starting record\n");
	recordblocking(microphone,sampleLength);

	printf("collecting data\n");
	soundSample = getaudiodata(microphone);
	croppedaudio = soundSample(sampleRate:end);	#drop the first second

	#size(soundSample)
	#size(croppedaudio)

	printf("processing convolution\n")
	conv1 = fftconv(croppedaudio, flip(ref1long));
	conv2 = fftconv(croppedaudio, flip(ref2long));
	conv3 = fftconv(croppedaudio, flip(ref3long));

	#crop to exclude the zero padding
	copppendConv1 = conv1((size(ref1long)(1))/2:end-(size(ref1long)(1))/2);
	copppendConv2 = conv2((size(ref2long)(1))/2:end-(size(ref2long)(1))/2);
	copppendConv3 = conv3((size(ref3long)(1))/2:end-(size(ref3long)(1))/2);

	#size(copppendConv1)


	printf("plotting\n")
	subplot(3,1,1);
	plot (1:size(copppendConv1)(1), copppendConv1);
	subplot(3,1,2);
	plot (1:size(copppendConv2)(1), copppendConv2);
	subplot(3,1,3);
	plot (1:size(copppendConv3)(1), copppendConv3);

	drawnow;

#	printf("Peaks are at:\n")
#	for i=0:sampleLength-2;
#		[peak, idx1] = max(copppendConv1(1+(i*sampleRate): ((i+1)*sampleRate)));
#		[peak, idx2] = max(copppendConv2(1+(i*sampleRate): ((i+1)*sampleRate)));
#		[peak, idx3] = max(copppendConv3(1+(i*sampleRate): ((i+1)*sampleRate)));
#		printf("\n")
#		
#
#		(idx1/sampleRate)+i
#		(idx2/sampleRate)+i
#		(idx3/sampleRate)+i
#		#idx1 + (i*sampleRate)
#		#idx2 + (i*sampleRate)
#		#idx3 + (i*sampleRate)
#	endfor


endwhile
