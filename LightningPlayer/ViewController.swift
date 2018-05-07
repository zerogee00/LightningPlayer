//
//  ViewController.swift
//  LightningPlayer
//
//  Created by David Rodd on 5/6/18.
//  Copyright © 2018 Lightning Rodd. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    public func buttonNext() {
        var btnNext : UIButton!
    
        //Next BUTTON
        let btnNextRect = CGRect(x: 0, y: 0, width: 20, height: 15)
        btnNext = UIButton(frame: btnNextRect)
        //        btnNext.center = (controller.contentOverlayView?.center)!
                btnNext.accessibilityLabel = ("next")
        btnNext.center = self.view.center
        //        btnNext.addTarget(self, action: #selector(startLightningPlayer(player: player, sender: btnNext)), for: .touchUpInside)
                btnNext.alpha = 0
                btnNext.isUserInteractionEnabled = true
        //        controller.view.addSubview(btnNext)
//                self.addChildViewController(controller)
//                self.view.addSubview(controller.view)
        //        controller.didMove(toParentViewController: self)
        //    }
    
}
    
//    @IBAction func startLightningPlayer(player: AVPlayer, sender: Any) {
    
    @objc public func startLightningPlayer(player: AVPlayer, sender: UIButton) {
        
        let playerItem = player.currentItem!
        let asset = player.currentItem!.asset
        
        if let group = asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.audible) {
            let options = AVMediaSelectionGroup.playableMediaSelectionOptions(from: group.options)
            
            sender.tag += 1
            if sender.tag > 4 { sender.tag = 0 }
            
            switch sender.tag {
            case 1:
//              TOP LEFT QUADRANT
                self.view.transform = (CGAffineTransform(translationX: 368, y: 207))
                self.view.transform = self.view.transform.scaledBy(x: 2, y: 2)
                playerItem.select(options[2], in: group) // choose 3rd audio track
            case 2:
//              TOP RIGHT QUADRANT
                self.view.transform = (CGAffineTransform(translationX: -368, y: 207))
                self.view.transform = self.view.transform.scaledBy(x: 2, y: 2)
                playerItem.select(options[3], in: group) // choose 4th audio track
            case 3:
//              BOTTOM LEFT QUADRANT
                self.view.transform = (CGAffineTransform(translationX: 368, y: -207))
                self.view.transform = self.view.transform.scaledBy(x: 2, y: 2)
                playerItem.select(options[1], in: group) // choose 2nd audio track
            case 4:
//              BOTTOM RIGHT QUADRANT
                self.view.transform = (CGAffineTransform(translationX: -368, y: -207))
                self.view.transform = self.view.transform.scaledBy(x: 2, y: 2)
                playerItem.select(options[0], in: group) // choose 1st audio track
            default:
//              SHOW ALL 4 QUADRANTS
                self.view.transform = CGAffineTransform.identity
                playerItem.selectMediaOptionAutomatically(in: group) // Automatically select default audio track
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://livelike-vod.s3.amazonaws.com/playlists/fifa-mosaic.m3u8") else {
            return
        }
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
//        controller.showsPlaybackControls = false
        controller.player = player
        self.view.addSubview(controller.view)
        controller.view.frame = self.view.frame
        
        player.play()
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

