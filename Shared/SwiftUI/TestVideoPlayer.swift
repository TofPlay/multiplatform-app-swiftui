//
//  TestVideo.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 31/08/2020.
//

import SwiftUI
import AVKit

struct TestVideoPlayer: View {
    let player = AVPlayer(url: URL(string: "https://bit.ly/swswift")!)
    let endMonitor = NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime)
    
    var body: some View {
        TestBody(test: .videoPlayer) {
            TestCase("VideoPlayer") {
                #if os(iOS)
                VideoPlayer(player: player)
                    .frame(width: 640, height: 360)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .onReceive(endMonitor) {
                        _ in
                        player.seek(to: .zero)
                        player.play()
                    }
                #else
                Label("Crash on macOS", systemImage: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                #endif
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
