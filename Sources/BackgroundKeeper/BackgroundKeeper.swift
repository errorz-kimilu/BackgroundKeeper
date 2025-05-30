import AVFoundation
import MediaPlayer

public class BackgroundKeeper {
    public static let shared = BackgroundKeeper()
    private var player: AVAudioPlayer?

    public init() {}

    public func start() {
        guard let url = Bundle.module.url(forResource: "silence", withExtension: "mp3") else {
            print("Missing silence.mp3")
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)

            MPNowPlayingInfoCenter.default().nowPlayingInfo = nil

            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = 0.0
            player?.play()
        } catch {
            print("Audio background failed: \(error)")
        }
    }

    public func stop() {
        player?.stop()
        player = nil
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}
