//
//  Destination.swift
//  GeoMapping
//
//  Created by Tiffany on 10/24/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import Foundation
import MapKit

//parse json into these objects
struct Destination: Codable {
    var id: Int
    var latitude: Double
    var longitude: Double
    var message: String
    var radius: Int
    var title: String
}

//this is the point on the map using Destination
class DestinationAnnotation: NSObject, MKAnnotation {
    var destination: Destination
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(destination: Destination) {
        self.destination = destination
        self.title = destination.title
        self.coordinate = CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude)
        super.init()
    }
}
