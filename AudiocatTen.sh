#!/bin/bash

#make the tracks of reference noise ten times as long

sox --combine concatenate ReferenceNoise1.wav ReferenceNoise1.wav ref1Long.wav
sox --combine concatenate ReferenceNoise2.wav ReferenceNoise2.wav ref2Long.wav
sox --combine concatenate ReferenceNoise3.wav ReferenceNoise3.wav ref3Long.wav
sox --combine concatenate ReferenceNoise4.wav ReferenceNoise4.wav ref4Long.wav

for (( i = 0; i < 8; i++ )); do
	#statements
	sox --combine concatenate ref1Long.wav ReferenceNoise1.wav tmp.wav
	mv tmp.wav ref1Long.wav


	sox --combine concatenate ref2Long.wav ReferenceNoise2.wav tmp.wav
	mv tmp.wav ref2Long.wav

	sox --combine concatenate ref3Long.wav ReferenceNoise3.wav tmp.wav
	mv tmp.wav ref3Long.wav

	sox --combine concatenate ref4Long.wav ReferenceNoise4.wav tmp.wav
	mv tmp.wav ref4Long.wav
done
