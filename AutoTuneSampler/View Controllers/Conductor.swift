import AudioKit
import SoundpipeAudioKit
import AVFoundation

class Conductor {
    let engine = AudioKit.AudioEngine()
    var player: AudioPlayer
    var timePitch: TimePitch
    var pitchShifter: PitchShifter

    // MARK: - Ivars
    var femaleOrMaleFileUrl: URL?

    var pitch: Float = 0 {
        didSet {
            timePitch.pitch = pitch
        }
    }
    var shift: Float = 0 {
        didSet {
            pitchShifter.shift = shift
        }
    }

    var isPlayerPlaying = false


    init() {
        print("Initializing Conductor")
        do {
            player = AudioPlayer()
            player.isLooping = true

            timePitch = TimePitch(player)
            pitchShifter = PitchShifter(player)

            let mixer = Mixer(timePitch, pitchShifter)

            engine.output = mixer

            try engine.start()

        } catch {
            fatalError()
        }

    }

    func playAudioPlayer() {
        print("playAudioPlayer \(femaleOrMaleFileUrl)")

        guard let fileUrl = femaleOrMaleFileUrl else {
            print("Voice File is Nil")
            return
        }
        do {
            try player?.load(url: fileUrl)
        } catch {
            fatalError()
        }
        player?.play()
        isPlayerPlaying = true
    }

    func stopAudioPlayer() {
        print("stop \(femaleOrMaleFileUrl)")
        player?.stop()

        isPlayerPlaying = false
    }
}
