//
//  ViewController.swift
//  memorablePlaces
//
//  Created by Doug Wells on 12/10/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var map: MKMapView!
    var streetAddress: String = ""
    var cityState: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set vars to make code cleaner.  Note: CL stands for "Call Location".  Coord are for Park City
        let latitude: CLLocationDegrees = 40.6461
        let longitude: CLLocationDegrees = -111.4980
        let latDelta: CLLocationDegrees = 0.05	//amnt of lat/lon in set amount of space
        let lonDelta: CLLocationDegrees = 0.05	//lower = less distance so more “zoom”
        
        //Sets "zoom" level
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        //Sets location
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        //Sets initial "region" (location and zoom level with vars "location" & "span")
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        //Finally, time to tell iOS where in map to set initial location and zoom level
        //Technically, could simply use this line but code would not be clear ...
        map.setRegion(region, animated: true)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2     //2 second press
        map.addGestureRecognizer(uilpgr)

    }
    
    func longpress (gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        //get address
        let lat = map.convert(touchPoint, toCoordinateFrom: self.map).latitude
        let lon = map.convert(touchPoint, toCoordinateFrom: self.map).longitude
        let longPressLocation = CLLocation(latitude: lat, longitude: lon)
        
        CLGeocoder().reverseGeocodeLocation(longPressLocation) { (placemarks, error) in
            if error != nil {
                print (error)
            } else {
                //Set variables for address
                if let placemark = placemarks?[0] {
                    let address = placemark.subThoroughfare != nil ? placemark.subThoroughfare! : ""
                    let street = placemark.thoroughfare != nil ? placemark.thoroughfare! : ""
                    let city = placemark.locality != nil ? placemark.locality! : ""
                    let state = placemark.administrativeArea != nil ? placemark.administrativeArea! : ""
                    self.streetAddress = String(address)+" "+street
                    self.cityState = city+", " + state
                }
            }
        }   //End CLGeocoder
        
        //Make Annotation
        let annotation = MKPointAnnotation()
        annotation.title = streetAddress
        annotation.subtitle = cityState
        annotation.coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        map.addAnnotation(annotation)

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

