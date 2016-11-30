//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/25/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var reviewImageView: UIImageView!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    
    var restaurant: RestaurantMO!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(data: restaurant.image as! Data)
        reviewImageView.image = UIImage(data: restaurant.image as! Data)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // The animation initial state
        let scaleT = CGAffineTransform.init(scaleX: 0, y: 0)           // scale from 0
        let slideT = CGAffineTransform.init(translationX: 0, y: -1000) // slide down from top
        let combinedT = scaleT.concatenating(slideT)
        containerView.transform = combinedT
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            // CGAffineTransform.identity is a constant for resetting a view 
            // to its original size and position
            self.containerView.transform = CGAffineTransform.identity
        })
        
        // Animate with spring
//        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {() -> Void in
//            self.containerView.transform = CGAffineTransform.identity
//        }, completion: nil)
    }
    

}
