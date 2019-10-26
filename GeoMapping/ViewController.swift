//
//  ViewController.swift
//  GeoMapping
//
//  Created by Tiffany on 10/23/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    let apiUrl: String =  "https://codetest.geocaching.com/destinations"
    let startingCoord = CLLocationCoordinate2D(latitude: 47.608013, longitude: -122.335167)

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = MKCoordinateRegion(center: self.startingCoord, latitudinalMeters: 20000, longitudinalMeters: 20000)
        map.setRegion(region, animated: false)
        map.delegate = self as MKMapViewDelegate
        
        //retrieve the json data
        let url = URL(string: self.apiUrl)!
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try decoder.decode(Waypoints.self, from: data)
                    for destination in response.waypoints {
                        let annotation = DestinationAnnotation(destination: destination)
                        DispatchQueue.main.async {
                            self.map.addAnnotation(annotation)
                        }
                    }
                } catch {
                    //Do some error handling messages
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    //callback for annotation selection
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //if this is a destinationAnnotation, then show detail view
        if let annotation = view.annotation as? DestinationAnnotation {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                viewController.destination = annotation.destination
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
}

