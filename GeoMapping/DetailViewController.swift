//
//  DetailViewController.swift
//  GeoMapping
//
//  Created by Tiffany on 10/24/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var destination: Destination? = nil

    @IBOutlet weak var detailsTitle: UILabel! //Destination title
    @IBOutlet weak var detailsMessage: UILabel! //Destination Message
    @IBOutlet weak var detailsCoords: UILabel! //Destination coords
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let destination = destination {
            detailsTitle.text = destination.title
            detailsMessage.text = destination.message
            let lonString = String(destination.longitude)
            let latString = String(destination.latitude)
            detailsCoords.text = "\(latString) || \(lonString)"
        }
    }
}
