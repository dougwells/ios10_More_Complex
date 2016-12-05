//
//  ViewController.swift
//  locationAwareApp
//
//  Created by Doug Wells on 12/4/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    
    @IBOutlet var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    @IBOutlet weak var courseLab: UILabel!
    @IBOutlet weak var speedLab: UILabel!
    @IBOutlet weak var altLab: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    
// Code inside this fn runs each time location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        //Set lat/lon, altitude and speed variables
        let lat = userLocation.coordinate.latitude
        let lon = userLocation.coordinate.longitude
        let altitude = userLocation.altitude
        let course = userLocation.course
        let speed = userLocation.speed

        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print (error)
            } else {
                
            //Set variables for address
                if let placemark = placemarks?[0] {
                    
                    //Ternary solution to set var = empty string if no placemark value
                    let city = placemark.locality != nil ? placemark.locality! : ""
                    
                    //If statement solution to same issue ternary solves above
                        var state = ""
                    if placemark.administrativeArea != nil {
                        state = placemark.administrativeArea!
                    }
                    
                    let zip = placemark.postalCode != nil ? placemark.postalCode! : ""
                    
                    let address = placemark.subThoroughfare != nil ? placemark.subThoroughfare! : ""
                    let street = placemark.thoroughfare != nil ? placemark.thoroughfare! : ""
                    let fullAddress:String = String(address)+" "+street+"\n"+city+", " + state+"  "+zip
                    
                    self.latLabel.text = String(lat)
                    self.lonLabel.text = String(lon)
                    self.courseLab.text = String(course)
                    self.speedLab.text = String(speed)
                    self.altLab.text = String(altitude)
                    self.addressLabel.text = fullAddress
                
                    
                    print(address, street, "\n", city, state, "\n", state, zip)
                    print(lat, lon, "\n", altitude, "\n", course, speed)
                    
                }
            }
        }
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

