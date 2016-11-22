//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/22/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImage = "restaurant.jpg"
    var restaurantName  = ""
    var restaurantLocation = ""
    var restaurantType = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image    = UIImage(named: restaurantImage)
        restaurantNameLabel.text     = restaurantName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text     = restaurantType
        
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
