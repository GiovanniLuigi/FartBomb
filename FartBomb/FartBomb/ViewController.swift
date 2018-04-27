//
//  ViewController.swift
//  FartBomb
//
//  Created by Giovanni Bruno on 26/04/18.
//  Copyright © 2018 Giovanni Bruno. All rights reserved.
//

import UIKit
import WatchConnectivity

//TODO:- Implement WCSessionDelegate
class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var brightness: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brightness = DeviceManager.shared.brightness
        self.view.backgroundColor = .black
        
        //TODO:- Check if WCSession is Supported, set delegate and activate
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DeviceManager.shared.brightness = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DeviceManager.shared.brightness = self.brightness
    }
    
    func startExplosionTimer() {
        DispatchQueue.main.async {
            var count = 5
            self.sendTimer(value: count)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                    count -= 1
                    self.sendTimer(value: count)
                    if count == 0 {
                        timer.invalidate()
                        //BOOOOOM!!!!!
                        playBackgroundMusic(filename: "Fart1.mp3")
                    }
            }
        }
    }
    
    func sendTimer(value: Int) {
        let message: [String: Any] = ["timer": value] 
        //TODO:- check if counter part i reachable
        //TODO:- send message
    }
    
    //MARK: - WCSessionDelegate
    //TODO:- implement session didReceiveMessage, startExplosionTimer if "explode" is true
    
}

