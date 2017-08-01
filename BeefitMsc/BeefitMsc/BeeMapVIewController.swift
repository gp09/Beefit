//
//  BeeMapVIewController.swift
//  BeefitMsc
//
//  Created by Priyank on 31/07/2017.
//  Copyright © 2017 priyank. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

let client_id = "DZI4XQWAVOVUHXHTZ2BUQJH1O2YJ25V4KRNPX3PQVUYG01MW" // visit developer.foursqure.com for API key
let client_secret = "PYKWMVPW4432QSTKDQVWUWQU4QVACNSCAGLKRMF3DSKVEIUH" // visit developer.foursqure.com for API key


class BeeMapVIewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
    // Try to ad import MapKit - MK Annotation

{

    let locationManager = CLLocationManager()
    var currentLocation:CLLocationCoordinate2D!
    var searchResults = [JSON]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // Do any additional setup after loading the view.
        
        // check if access is granted
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // MARK: - Foursquare API

    func checkPlacesAtCurrentLocation() {
        let url = "https://api.foursquare.com/v2/venues/search?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=checkin&limit=1&radius=4000&client_id=\(client_id)&client_secret=\(client_secret)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            var currentVenueName:String?
            
            let json = JSON(data: data!)
            currentVenueName = json["response"]["venues"][0]["name"].string
            
            // set label name and visible
//            DispatchQueue.main.async {
//                if let v = currentVenueName {
//                    self.currentLocationLabel.text = "You're at \(v). Here's some ☕️ nearby."
//                }
//                self.currentLocationLabel.isHidden = false
//            }
        })
        task.resume()
    }
    
    // MARK: - search/recommendations endpoint
    // https://developer.foursquare.com/docs/search/recommendations
    func searchForhopitalCall() {
        let url = "https://api.foursquare.com/v2/search/recommendations?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=coffee&limit=15&client_id=\(client_id)&client_secret=\(client_secret)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            let json = JSON(data: data!)
            self.searchResults = json["response"]["group"]["results"].arrayValue
        })
        task.resume()
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
