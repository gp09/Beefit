//
//  BeeSignUpViewController.swift
//  BeefitMsc
//
//  Created by Priyank on 31/07/2017.
//  Copyright © 2017 priyank. All rights reserved.
//

import UIKit
import FirebaseAuth

class BeeSignUpViewController: UIViewController {
    
    @IBOutlet var emailTxtField: UITextField!
    
    @IBOutlet var passTxtField: UITextField!
    
    @IBOutlet var confirmTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        signUP()
    }
    
    func signUP() {
        Auth.auth().createUser(withEmail: "priyankscores@gmail.com", password: "123456") { (user, error) in
            print("Login Successful")
            user?.getIDToken(completion: { (token, error) in
                print("\(String(describing: token))")
                BeeKeychainService.saveToken(token: token! as NSString)
                
            })
            let user = Auth.auth().currentUser
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
