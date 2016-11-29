//
//  MapViewController.swift
//  FoodPin
//
//  Created by Patrick White on 11/29/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // Establish connection with mapview in storyboard
    @IBOutlet var mapView: MKMapView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Query the Apple server for some placemarks
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {(placemarks, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // get the first placemark
                let placemark = placemarks[0]
                
                // add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
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
