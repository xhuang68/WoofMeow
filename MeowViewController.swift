//
//  MeowViewController.swift
//  WoofMeow
//
//  Created by Henry Huang on 7/9/15.
//  Copyright (c) 2015 XiaoHuang. All rights reserved.
//

import UIKit

class MeowViewController: UIViewController {

    
    @IBOutlet weak var WMImageView0: UIImageView!
    @IBOutlet weak var WMImageView1: UIImageView!
    @IBOutlet weak var WMImageView2: UIImageView!
    @IBOutlet weak var WMImageView3: UIImageView!
    @IBOutlet weak var WMImageView4: UIImageView!
    @IBOutlet weak var WMImageView5: UIImageView!
    @IBOutlet weak var WMImageView6: UIImageView!
    @IBOutlet weak var WMImageView7: UIImageView!
    @IBOutlet weak var WMImageView8: UIImageView!
    @IBOutlet weak var WMImageView9: UIImageView!
    @IBOutlet weak var WMImageView10: UIImageView!
    @IBOutlet weak var WMImageView11: UIImageView!
    
    var myImageViewSet: [UIImageView] = []
    var myPetSet: [XHPet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageViewSet = [WMImageView0, WMImageView1, WMImageView2, WMImageView3, WMImageView4, WMImageView5, WMImageView6, WMImageView7, WMImageView8, WMImageView9, WMImageView10, WMImageView11]
        let mySet = XHPetSet(petSetName: "Cat")
        myPetSet = mySet.petSet()
        
        for eachImageView in myImageViewSet {
            let index = find(myImageViewSet, eachImageView)
            let pet = myPetSet[index!]
            eachImageView.image = pet.image()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for eachImageView in myImageViewSet {
            eachImageView.alpha = 0.0
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let numOfImageView = myImageViewSet.count
        let appearOrder = randomIndexArray(numOfImageView)
        
        var delay = 0.05
        for index in appearOrder {
            UIView.animateWithDuration(0.2, delay: delay, options: .CurveEaseIn, animations: { () -> Void in
                self.myImageViewSet[index].alpha = 1.0
                }, completion: nil)
            delay += 0.05
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(recongizer: UITapGestureRecognizer){
        if let view = recongizer.view as? UIImageView  {
            
            let originBounds = view.bounds
            UIView.animateWithDuration(0.1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                view.bounds = CGRect(x: originBounds.origin.x, y: originBounds.origin.y, width: originBounds.width + 20, height: originBounds.height + 20)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                view.bounds = CGRect(x: originBounds.origin.x, y: originBounds.origin.y, width: originBounds.width, height: originBounds.height)
                }, completion: nil)
            
            let index = find(myImageViewSet, view)
            if let index = index {
                let pet = myPetSet[index]
                pet.playAudio()
            }
        }
    }
    
    func randomIndexArray (length: Int) -> [Int] {
        
        // make a random index array
        var originIndexArray = [Int]()
        for var i = 0; i < length; i++ {
            originIndexArray.append(i)
        }
        var indexArray = [Int]()
        for var i = length; i > 0; i-- {
            let ui = UInt32(i)
            let randomNumber = arc4random_uniform(ui)
            indexArray.append(originIndexArray.removeAtIndex(Int(randomNumber)))
        }
        return indexArray
    }
    


}
