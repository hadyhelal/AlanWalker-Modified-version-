//
//  AvAudioPlayerExtnsion.swift
//  AlanWalker
//
//  Created by Hady on 11/7/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation
import AVFoundation

//MARK: - AVAudioPlayer Extension to handle the total time view

extension AVAudioPlayer {
    func durationWithMinAndSec () -> String {
        print(self.duration)
        
        let durationInt  = Int(self.duration)
        return "\(durationInt / 60):\(durationInt % 60 )"
        
    }
}
