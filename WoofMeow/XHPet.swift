//
//  XHPet.swift
//  WoofMeow
//
//  Created by Henry Huang on 7/8/15.
//  Copyright (c) 2015 XiaoHuang. All rights reserved.
//

import UIKit
import AVFoundation

class XHPet: NSObject {
    
    var petName: String
    var petImage: String
    var petSound: String
    
    var audioPlayer: AVAudioPlayer
    
    init(petName: String, petImage: String, petSound: String) {
        self.petName = petName
        self.petImage = petImage
        self.petSound = petSound
        
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(petSound)", ofType: "mp3")!)
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
    }
    
    func image() -> UIImage {
        let image = UIImage(named: self.petImage)
        return image!
    }
    
    func playAudio() -> Void {
        audioPlayer.play()
    }
}
