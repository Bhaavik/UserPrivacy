//
//  BlurPasswordLoginViewController.swift
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 Recruit Lifestyle Co., Ltd. All rights reserved.
//

import UIKit
import SmileLock

class BlurPasswordLoginViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var passwordStackView: UIStackView!
    var strPassword:String!
    
    //MARK: Property
    var passwordContainerView: PasswordContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "password") != nil
           {
             lblTitle.text = "Enter Password"
           }
            else
            {
                  lblTitle.text = "Configure Password"
            }
        
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: 4)
        passwordContainerView.delegate = self
        passwordContainerView.deleteButtonLocalizedTitle = "Delete"
        
        //customize password UI
        passwordContainerView.tintColor = UIColor.color(.textColor)
        passwordContainerView.highlightedColor = UIColor.color(.blue)
    }
    
        //create PasswordUIValidation subclass
    /*    passwordUIValidation = MyPasswordUIValidation(in: passwordStackView)
        
        passwordUIValidation.success = { [weak self] _ in
            print("*️⃣ success!")
            self?.dismiss(animated: true, completion: nil)
        }
        
        passwordUIValidation.failure = {
            //do not forget add [weak self] if the view controller become nil at some point during its lifetime
            print("*️⃣ failure!")
        }
        //visual effect password UI
        passwordUIValidation.view.rearrangeForVisualEffectView(in: self)
        passwordUIValidation.view.deleteButtonLocalizedTitle = "delete"*/
        
        
    }


extension BlurPasswordLoginViewController: PasswordInputCompleteProtocol {
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?)
    {
         print("*️⃣ success!")
    }
    
    fileprivate func extractedFunc(_ input: String, _ passwordContainerView: PasswordContainerView) {
    {
        print("input completed -> \(input)")
        
        if let strPassword = UserDefaults.standard.string(forKey: "password")
        {
            if strPassword == input
            {
                print("*️⃣ success!")
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                passwordContainerView.wrongPassword()
            }
        }
        else
        {
            UserDefaults.standard.set(input, forKey: "password")
            print("*️⃣ success!")
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
        
        //Check password already set in user default
        
        
        //check screen is for password or Confirm password
        
        
        }
    }
    
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String)
    extractedFunc(input, passwordContainerView)
}

