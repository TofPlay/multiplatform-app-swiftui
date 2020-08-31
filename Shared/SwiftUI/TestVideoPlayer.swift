//
//  TestVideo.swift
//  MultiplatformAppSwiftUI
//
//  Created by admin on 31/08/2020.
//

import SwiftUI
import AVKit

struct TestVideoPlayer: View {
    let player = AVPlayer(url: URL(string: "https://bit.ly/swswift")!)
    let endMonitor = NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime)
    
    var body: some View {
        TestBody(test: .videoPlayer) {
            TestCase("VideoPlayer") {
                VideoPlayer(player: player)
                    .frame(width: 640, height: 360)
                    .onAppear {
                        player.play()
                    }
                    .onReceive(endMonitor) {
                        _ in
                        player.seek(to: .zero)
                        player.play()
                    }
                TestResult {
                    Check(iOS: true, macOS: false, test: "VideoPlayer .play()")
                }
            }
        }
    }
}

struct TestVideo_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoPlayer()
    }
}
