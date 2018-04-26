//
//  InterfaceController.swift
//  FartBombWatchOS Extension
//
//  Created by Giovanni Bruno on 26/04/18.
//  Copyright © 2018 Giovanni Bruno. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var timerLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    @IBAction func tapExplode() {
        startExplosion()
    }
    
    func startExplosion() {
        let message = ["explode": true]
        WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: nil)
    }
    
    //MARK:- WCSessionDelegate
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let timer = message["timer"] as? Int {
            DispatchQueue.main.async {
                self.timerLabel.setText(String(timer))
                if timer == 0 {
                    //EXPLOSION!!
                }
            }
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

}
