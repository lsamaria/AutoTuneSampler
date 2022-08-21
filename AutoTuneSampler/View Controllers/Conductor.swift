import AudioKit
import SoundpipeAudioKit
import AVFoundation

class Conductor {
    let engine = AudioKit.AudioEngine()
    var player: AudioPlayer!
    var timePitch: TimePitch?
    var pitchShifter: PitchShifter!
    var tracker: PitchTap!
    var mixer: Mixer!
    
    // MARK: - Ivars
    var femaleOrMaleFileUrl: URL?

    var pitch: Float = 0 {
        didSet {
            guard let timePitch = timePitch else {
                return
            }

            timePitch.pitch = pitch * 100
        }
    }
    var shift: Float = 0 {
        didSet {
            //pitchShifter.shift = shift
        }
    }

    var isPlayerPlaying = false


    init() {
        print("Initializing Conductor")
        do {
            player = AudioPlayer()
            player.isLooping = true
            
            //timePitch = TimePitch(player)
            
            pitchShifter = PitchShifter(player)
            
            mixer = Mixer(player, pitchShifter)
            
            engine.output = mixer
            
            try engine.start()

        } catch {
            print("catch-error: ", error.localizedDescription)
            fatalError()
        }
    }
}

// MARK: - PitchTap
extension Conductor {
    
    private func startFrequencyTracker() {
        
        if shift == 0 { return }
        
        tracker = PitchTap(mixer) { pitch, amp in
            DispatchQueue.main.async {
                self.update(pitch[0], amp[0])
            }
        }
        
        tracker.start()
    }
    
    private func update(_ pitch: AUValue, _ amp: AUValue) {
        
        guard amp > 0.1 else { return }
        
        let detectedPitch = amp
        
        pitchShifter.shift = detectedPitch - shift
    }
    
    private func stopFrequencyTracker() {
        
        tracker.stop()
    }
}

// MARK: - Play/Stop
extension Conductor {
    
    func playAudioPlayer() {
        print("playAudioPlayer \(femaleOrMaleFileUrl as Any)")

        guard let fileUrl = femaleOrMaleFileUrl else {
            print("Voice File is Nil")
            return
        }
        do {
            try player.load(url: fileUrl)
        } catch {
            fatalError()
        }
        
        startFrequencyTracker()
        
        player.play()
        isPlayerPlaying = true
    }

    func stopAudioPlayer() {
        print("stop \(femaleOrMaleFileUrl as Any)")
        player.stop()

        isPlayerPlaying = false
        
        stopFrequencyTracker()
    }
}
