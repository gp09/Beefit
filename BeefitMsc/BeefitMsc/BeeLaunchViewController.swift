//
//  BeeLaunchViewController.swift
//  BeefitMsc
//
//  Created by Priyank on 30/07/2017.
//  Copyright © 2017 priyank. All rights reserved.
//

import UIKit
import Foundation

private let sharedSingleton = BeeLaunchViewController()

class BeeLaunchViewController: UIViewController {
    var window: UIWindow?
    
    public var genericString = String()
   
    enum Images {
        static let tab = UIImage(named: "Image", in: Bundle.init(identifier: "BeefitMSc"), compatibleWith: nil)
        
        static let loc = UIImage(named: "location", in: Bundle.init(identifier: "BeefitMSc"), compatibleWith: nil)
        
        static let profile = UIImage(named: "ic_profile", in: Bundle.init(identifier: "BeefitMSc"), compatibleWith: nil)
        
}

}
