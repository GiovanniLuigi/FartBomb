//
//  ViewController.swift
//  FartBomb
//
//  Created by Giovanni Bruno on 26/04/18.
//  Copyright © 2018 Giovanni Bruno. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        DeviceManager.shared.brightness = 0
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
    }
    
    func startExplosionTimer(){
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
    
    func sendTimer(value: Int){
        if WCSession.default.isReachable {
            let message = ["timer": value]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: nil)
        }
    }
    
    //MARK: - WCSessionDelegate
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let explode = message["explode"] as? Bool {
            if explode {
                startExplosionTimer()
            }
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    
}

