//
//  MapKitVC.swift
//  Gmap
//
//  Created by MV Jadav on 18/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit
import MapKit

class MapKitVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var IBMKMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map Kit")
        self.setMap(Latitude: 21.282778, Longitude: -157.829444)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setMap(Latitude:Double, Longitude:Double) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            var mapRegion = MKCoordinateRegion()
            let Lat = Latitude
            let Long = Longitude
            let Coordinates = CLLocationCoordinate2D(latitude: Lat as CLLocationDegrees, longitude: Long as CLLocationDegrees)
            mapRegion.center = Coordinates;
            mapRegion.span.latitudeDelta    = 0.002
            mapRegion.span.longitudeDelta   = 0.002
            self.IBMKMapView.setRegion(mapRegion, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = Coordinates
            annotation.title = "Maninagar"
            annotation.subtitle = "Ahmedabad"
            self.IBMKMapView.addAnnotation(annotation)
            
            self.IBMKMapView.delegate = self
        }
    }

}
