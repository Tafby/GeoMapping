//
//  ViewController.swift
//  GeoMapping
//
//  Created by Tiffany on 10/23/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    let apiUrl: String =  "http://localhost:3000/destinations"
    
    @IBOutlet weak var map: MKMapView?
    
    override func viewDidLoad() {
        map?.delegate = self as? MKMapViewDelegate
        super.viewDidLoad()
        let url = URL(string: self.apiUrl)!
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let destinations = try decoder.decode([Destination].self, from: data)
                    for d in destinations {
                        let annotation = DestinationAnnotation(destination: d)
                        self.map?.addAnnotation(annotation)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    //callback for annotation selection
    //TODO: unselect marker when you back, display labels propertly, and refactor
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

