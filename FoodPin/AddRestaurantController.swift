//
//  AddRestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/30/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("You touched row \(indexPath.row)")
            // Sometimes, the user may not allow you to access the photo library. 
            // As a good practice, you should always use the class method isSourceTypeAvailable to 
            // verify if a particular media source is available.
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                // imagePicker.sourceType = .photoLibrary
                imagePicker.sourceType = .camera
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }

}
