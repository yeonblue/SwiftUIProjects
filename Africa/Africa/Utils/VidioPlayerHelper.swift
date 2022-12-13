//
//  VidioPlayerHelper.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/13.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        fatalError("no exist file")
    }
    
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    
    return videoPlayer!
}
