//
//  InterractionUIApplication.swift
//  AutoComplete
//
//  Created by Enamul on 8/16/17.
//  Copyright © 2017 Enamul. All rights reserved.
//

import Foundation
import UIKit



extension NSNotification.Name {
    public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "TimeOutUserInteraction")
}

@objc(InterractionUIApplication)

class InterractionUIApplication: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    
    // The timeout in seconds for when to fire the idle timer.
    let timeoutInSeconds: TimeInterval = 20//15 * 60
    
    var idleTimer: Timer?
    
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        // print("3")
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        
        if let touches = event.allTouches {
            for touch in touches {
                if touch.phase == UITouchPhase.began {
                    self.resetIdleTimer()
                }
            }
        }
    }
    // Resent the timer because there was user interaction.
    func resetIdleTimer() {
        if let idleTimer = idleTimer {
            // print("1")
            idleTimer.invalidate()
        }
        
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimerExceeded), userInfo: nil, repeats: false)
    }
    
    // If the timer reaches the limit as defined in timeoutInSeconds, post this notification.
    @objc func idleTimerExceeded()
    {
        print("Time Out")
        let window = UIApplication.shared.keyWindow!
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let passLockVC = mainStoryboard.instantiateViewController(withIdentifier: "BlurPasswordLoginViewController")
           window.rootViewController?.present(passLockVC, animated: true, completion: nil)
    

        
    }
}
