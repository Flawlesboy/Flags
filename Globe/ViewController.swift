//
//  ViewController.swift
//  Globe
//
//  Created by zagid on 15.10.17.
//  Copyright © 2017 zagid. All rights reserved.
//

import UIKit
import SceneKit



class ViewController: UIViewController  {
    @IBOutlet weak var leftTextImage: UIImageView!
    @IBOutlet weak var rightTextImage: UIImageView!
    @IBOutlet weak var middleTextImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftTextImage.image = #imageLiteral(resourceName: "fla")
        middleTextImage.image = #imageLiteral(resourceName: "flag")
        rightTextImage.image = #imageLiteral(resourceName: "gs")
        
        
        setStartPositiong()
        separeateDribble()
        
        
        
       
    }
    
    func setStartPositiong() {
        let xOffset = middleTextImage.frame.width / 2
        leftTextImage.transform = CGAffineTransform(translationX: xOffset, y: 0)
        let y = -(middleTextImage.frame.origin.y + middleTextImage.frame.height + 50)
        middleTextImage.transform = CGAffineTransform(translationX: 0, y: y).scaledBy(x: 0.7, y: 2)
        rightTextImage.transform = CGAffineTransform(translationX: -xOffset-7, y: 0)
    }
    
    func separeateDribble() {
        UIView.animate(withDuration: 0.4, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0,  options: [], animations: {
            self.leftTextImage.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
            self.rightTextImage.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        }) { (success) in
            self.showmidle()
        }
    }
    
    func showmidle() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.middleTextImage.transform  = .identity
        }) { (success) in
            self.connectDrible()
        }
    }
    
    func connectDrible() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0,options: [], animations: {
            self.leftTextImage.transform = .identity
            self.rightTextImage.transform = .identity
        }) { success in
            self.performSegue(withIdentifier: "showFlagsCollection", sender: nil)
        }
        
    }
    
   
    
    
}
    
 

  




