//
//  DetailViewController.swift
//  GeoMapping
//
//  Created by Tiffany on 10/24/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
//    @IBOutlet weak var details: ?
    var destination: Destination? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        var stackView = UIStackView(frame: self.view.frame)
        stackView.axis = NSLayoutConstraint.Axis.vertical
        var title = UILabel()
        var message = UILabel()
        var lon = UILabel()
        var lat = UILabel()

        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(message)
        stackView.addArrangedSubview(lon)
        stackView.addArrangedSubview(lat)
        self.view.addSubview(stackView)
        
        if let destination = destination {
            print("Successfully unwrapped destination")
            title.text = destination.title
            message.text = destination.message
//            lon.text = destination.coordinate.longitude
//            lat.text = destination.coordinate.latitude
        }

    }
}
