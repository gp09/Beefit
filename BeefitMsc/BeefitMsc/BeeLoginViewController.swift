//
//  BeeLoginViewController.swift
//  BeefitMsc
//
//  Created by Priyank on 31/07/2017.
//  Copyright © 2017 priyank. All rights reserved.
//

import UIKit
import FirebaseAuth

class BeeLoginViewController: UIViewController {
    
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var twLoginBtn: UIButton!
    @IBOutlet var fbLoginBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var passTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var l: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twBtnTapped(_ sender: Any) {
    }
    @IBAction func fbBtnTapped(_ sender: Any) {
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: passTxtField.text!) { (user, error) in
            if((error) != nil) {
                let alert = UIAlertController.init(title: "Alert", message: "Please check your email id and password", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                print("sign in work")
                user?.getIDToken(completion: { (token, error) in
                    print("\(String(describing: token))")
                    BeeKeychainService.saveToken(token: token! as NSString)
                    
                })
                if let user = user {
                    
                    // The user's ID, unique to the Firebase project.
                    // Do NOT use this value to authenticate with your backend server,
                    // if you have one. Use getTokenWithCompletion:completion: instead.
                    let uid = user.uid
                    let email = user.email
                    let photoURL = user.photoURL
                    // ...
                }
                
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
