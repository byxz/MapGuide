//
//  SettingsViewController.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/25/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.tag = TabBarItemTag.settingsItemView.rawValue
    }
}
