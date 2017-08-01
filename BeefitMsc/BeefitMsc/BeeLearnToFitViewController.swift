//
//  BeeLearnToFitViewController.swift
//  BeefitMsc
//
//  Created by Priyank on 01/08/2017.
//  Copyright © 2017 priyank. All rights reserved.
//

import UIKit

class BeeLearnToFitViewController: UIViewController {
    
    var gridCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        gridCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout:nil)
        gridCollectionView.backgroundColor =  nil
        gridCollectionView.showsVerticalScrollIndicator = false
        gridCollectionView.showsHorizontalScrollIndicator = false
        gridCollectionView.dataSource = self as! UICollectionViewDataSource
        gridCollectionView.delegate = self as! UICollectionViewDelegate
      //  gridCollectionView!.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(gridCollectionView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
