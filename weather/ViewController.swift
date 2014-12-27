//
//  ViewController.swift
//  weather
//
//  Created by Jin on 14/12/24.
//  Copyright (c) 2014年 Jin. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    let locationManger:CLLocationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        
        if(ios8()){
            locationManger.requestAlwaysAuthorization()
        }
        locationManger.stopUpdatingLocation()
    }
    func ios8() ->Bool {
        return UIDevice.currentDevice().systemVersion == "8.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        var location:CLLocation = locations[locations.count-1] as CLLocation
        
        if(location.horizontalAccuracy > 0){
            println(location.coordinate.latitude)
            println(location.coordinate.longitude)
            
            locationManger.stopUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager!, rangingBeaconsDidFailForRegion region: CLBeaconRegion!, withError error: NSError!){
        println(error)
    }


}

