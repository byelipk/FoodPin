//
//  AddRestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/30/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var photoImageView: UIImageView!
    
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
                
                // This class implements the UIImagePicker protocol
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // When the method is called, the system passes you an info dictionary object that contains the selected image.
        // UIImagePickerControllerOriginalImage is the key of the image selected by the user.
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        } else {
            print("Something went wrong...")
        }
        
        
        
        // Programatically set auto layout constraints for the image
        
        let leadingConstraint = NSLayoutConstraint(
            item: photoImageView,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: photoImageView.superview,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: 0
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: photoImageView,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: photoImageView.superview,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: 0
        )
        
        let topConstraint = NSLayoutConstraint(
            item: photoImageView,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: photoImageView.superview,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: photoImageView,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: photoImageView.superview,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: 0
        )
    
        
        leadingConstraint.isActive    = true
        trailingConstraint.isActive   = true
        topConstraint.isActive        = true
        bottomConstraint.isActive     = true
   
        // Programatically set horizontal and vertical alignment for image
        
//        NSLayoutConstraint(
//            item: photoImageView,
//            attribute: NSLayoutAttribute.centerY,
//            relatedBy: NSLayoutRelation.equal,
//            toItem: photoImageView.superview,
//            attribute: NSLayoutAttribute.centerY,
//            multiplier: 1,
//            constant: 0
//            ).isActive = true
//        
//        NSLayoutConstraint(
//            item: photoImageView,
//            attribute: NSLayoutAttribute.centerX,
//            relatedBy: NSLayoutRelation.equal,
//            toItem: photoImageView.superview,
//            attribute: NSLayoutAttribute.centerX,
//            multiplier: 1,
//            constant: 0
//            ).isActive = true
        
        dismiss(animated: true, completion: nil)
    }

}
