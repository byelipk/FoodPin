//
//  AddRestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/30/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var isVisited = false

    
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
        
        dismiss(animated: true, completion: nil)
    }
    
    func formIsValid() -> Bool {
        if nameField.text?.isEmpty     == true ||
           typeField.text?.isEmpty     == true ||
           locationField.text?.isEmpty == true
        {
            return false
        }
        
        return true
    }
    
    func displayAlertToUser() -> Void {
        let alertController = UIAlertController(
            title: "Oh, shit!",
            message: "There are some errors you need to fix before we can allow you to submit this form.",
            preferredStyle: .alert
        )
        
        let action1 = UIAlertAction(
            title: "I get it",
            style: .default,
            handler: nil
        )
        
        alertController.addAction(action1)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func handleValidForm() -> Void {
        print("Nice job!")
    }
    

    // ACTIONS
    
    @IBAction func saveRestaurant(_ sender: Any) {
        if formIsValid() == true {
            handleValidForm()
        } else {
            displayAlertToUser()
        }
    }
    
    @IBAction func toggleIsVisited(_ sender: UIButton) {
        if sender == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor  = UIColor.lightGray
        }
            
        else {
            isVisited = false
            yesButton.backgroundColor = UIColor.lightGray
            noButton.backgroundColor  = UIColor.red
        }
    }
}
