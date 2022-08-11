## AudioKit v5.4.4

## Stack Overflow Problem

- This repo is based on https://stackoverflow.com/q/73272366/4833705, which I was trying to get an Autotune type sound from AudioKit but I was unable to acheive it

## Directions

-#1 select either a female voice or a male voice (default is female). The button border highlights orange for whichever is selected. If the audio is playing, you can select a different genre and press Stop Audio then Play Audio to play the new genre.

-#2 enter a pitch value for TimePitch.pitch (default is 0).

-#3 enter a shift value for AKPitchShifter.shift (default is 0). *** THIS DOESN't WORK *** The problem is AKPitchShifter doesn't show up in AudioKit v5.4.4. I didn't see it in the documentation either: https://audiokit.io/documentation/audiokit

-#4 press the Play Audio button to play the audio. Press the Stop Audio button to stop the audio. After you stop, you can press Play Audio to restart the audio over.

## AudioKit Issue

- AKPitchShifter doesn't show up in AudioKit v5.4.4. AKPitchShifter is commented out on lines 118-120 in the playAudioPlayer() function in the ViewController file

## Code

- The only code that uses AudioKit is the playAudioPlayer() function on line 99 and the stopAudioFunction on line 138 in the ViewController file

## Voices

- The app currently uses female-voice-1.wav and male-voice-1.wav.

- There are 2 more female voice files in the Voice_Files folder named female-voice-2.wav and female-voice-2.wav

- If you want to try a different female audio file the line to switch in ViewController+Extensions file on line 15
