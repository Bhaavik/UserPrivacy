//
//  ViewController.swift
//  UserPrivacyDemo
//
//  Created by Bhavik doshi on 11/20/17.
//

import UIKit

class ViewController: UIViewController {

    
    let isBlurUI = true
    var loginVCID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVCID = isBlurUI ? "BlurPasswordLoginViewController" : "PasswordLoginViewController"

        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func presentLoginVC(_ sender: AnyObject) {
        present(loginVCID)
    }
    
    func present(_ id: String) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: id)
        // in iOS 10, the crossDissolve transtion is wired
        //        loginVC?.modalTransitionStyle = .crossDissolve
        loginVC?.modalPresentationStyle = .overCurrentContext
        present(loginVC!, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

