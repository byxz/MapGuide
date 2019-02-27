//
//  MapMarkerWindow.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/27/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

protocol MapMarkerDelegate: class  {
    
    func didTappedInfoButton(data: NSDictionary)
}

class MapMarkerWindow: UIView {
    
    @IBOutlet weak var markerImageView: UIImageView!
    @IBOutlet weak var titleMarkerLabel: UILabel!
    @IBOutlet weak var descriptionMarkerLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var routeFromButton: UIButton!
    
    weak var delegate: MapMarkerDelegate?
    var spotData: NSDictionary?
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        delegate?.didTappedInfoButton(data: spotData!)
    }
    
    @IBAction func routeFromButtonTapped(_ sender: UIButton) {
        
    }
    
    class func instanceFromNib() -> UIView {
        
        return UINib(nibName: "MapMarkerWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}
