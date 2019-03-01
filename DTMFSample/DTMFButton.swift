//
//  DTMFButton.swift
//  DTMFSample
//
//  Created by Bartosz on 01/03/2019.
//

import UIKit
import AVFoundation

class DTMFButton: UIButton {
    
    private var player: AVAudioPlayer?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.stop()
        self.play()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.stop()
    }
        
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        self.stop()
    }
    
    // MARK: Play DTMF
    
    private func play() {
        let dtmf = DTMF()
        guard let title = currentTitle,
            let tone = dtmf.dtmf(for: title) else {
            return
        }
        
        player = try! AVAudioPlayer(data: tone)
        player?.numberOfLoops = -1
        player?.volume = 1.0
        player?.prepareToPlay()
        player?.play()
    }
    
    private func stop() {
        player?.stop()
    }
}
