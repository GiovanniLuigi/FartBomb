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

//TODO:- implement WCSessionDelegate
class InterfaceController: WKInterfaceController {
    @IBOutlet var timerLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //TODO:- Check if WCSession is Supported, set delegate and activate
    }
    
    @IBAction func tapExplode() {
        startExplosion()
    }
    
    func startExplosion() {
        let message = ["explode": true]
        //TODO:- check if is reachable and send message
    }
    
    //MARK:- WCSessionDelegate
    //TODO:- session didReceiveMessage, set timerLabel as the timer value

}
