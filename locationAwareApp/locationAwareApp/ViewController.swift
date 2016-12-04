//
//  ViewController.swift
//  locationAwareApp
//
//  Created by Doug Wells on 12/4/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self  //sets delegate to VC so VC can control it
        locationManager.desiredAccuracy = kCLLocationAccuracyBest  //several accuracies avail.
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    
// Code inside this fn runs each time location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print (error)
            } else {
                if let placemark = placemarks?[0] {
                    if placemark.administrativeArea != nil {
                        var state = placemark.administrativeArea!
                        print(state)
                    }

                }
            }
        }
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

