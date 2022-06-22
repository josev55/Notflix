//
//  MoviePlayer.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import UIKit
import AVKit

class Player: UIView {
    let mediaSource: URL
    weak var player: AVPlayer!
    weak var playerLayer: AVPlayerLayer!
    
    init(mediaURL: URL, thumbnailURL: URL) {
        self.mediaSource = mediaURL
        
        let playerItem = AVPlayerItem(url: URL(string: "https://mdstrm.com/video/60b00165e2db445d945016b3.m3u8")!)
        let player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.needsDisplayOnBoundsChange = true
        
        self.player = player
        self.playerLayer = playerLayer
        super.init(frame: .zero)
        
        self.layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer.frame = self.bounds
    }
}
