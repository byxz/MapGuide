//
//  BusScreen.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/21/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class BusScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.tag = TabBarItemTag.busItemView.rawValue
    }
}
