## AudioKit v5.4.4

## Stack Overflow Problem

- This repo is based on https://stackoverflow.com/q/73272366/4833705, which I was trying to get an Autotune type sound from AudioKit but I was unable to acheive it

## Directions

-#1 select either a female voice or a male voice (default is female). The button border highlights orange for whichever is selected. If the audio is playing, you can select a different genre and press Stop Audio then Play Audio to play the new genre.

-#2 enter a pitch value for TimePitch.pitch (default is 0).

-#3 enter a shift value for PitchShifter.shift (default is 0).

After you enter a pitch and/or shift value, when you press the Play Audio button, those values will be applied to the audio file that will start playing

-#4 press the Play Audio button to play the audio. Press the Stop Audio button to stop the audio. After you stop, you can press Play Audio to restart the audio over.

## Code

- The only code that uses AudioKit is the playAudioPlayer() function on line 100 and the stopAudio() function on line 137 in the ViewController file

- This app is entirely programmatic and doesn't use Storyboard

## Sounds

- The app currently uses female-voice-1.wav and male-voice-1.wav.

- There are 2 more female voice files in the Sound_Files folder named female-voice-2.wav and female-voice-2.wav

- If you want to try a different female audio file the line to switch in ViewController+Extensions file on line 15
