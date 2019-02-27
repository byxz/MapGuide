//
//  TapBarController.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/21/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

enum TabBarItemTag: Int {
    case navigationItem = 100
    case busItemView = 101
    case settingsItemView = 102
}

class TapBarController: UITabBarController, UITabBarControllerDelegate {
    
    var mapItemImageView: UIImageView!
    var busItemImageView: UIImageView!
    var settingsItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapItemView = self.tabBar.subviews.first!
        mapItemImageView = mapItemView.subviews.first as? UIImageView
        mapItemImageView.contentMode = .center
        
        let busItemView = self.tabBar.subviews[1]
        busItemImageView = busItemView.subviews.first as? UIImageView
        busItemImageView.contentMode = .center
        
        let settingsItemView = self.tabBar.subviews[2]
        settingsItemImageView = settingsItemView.subviews.first as? UIImageView
        settingsItemImageView.contentMode = .center
        
    }
    
    func setImage() {
        
        let mapBarItem = (self.tabBar.items?[0])! as UITabBarItem
        mapBarItem.image = UIImage(named: "map")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let busTabBarItem = (self.tabBar.items?[1])! as UITabBarItem
        busTabBarItem.image = UIImage(named: "bus")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let settingsTabBarItem = (self.tabBar.items?[2])! as UITabBarItem
        settingsTabBarItem.image = UIImage(named: "settings")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    
    func animation(elementBarItem: UIImageView) {
        UIView.animate(withDuration: 0.2, animations: {
            elementBarItem.transform = CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6)
        }) { (finish) in
            UIView.animate(withDuration: 0.2, animations: {
                elementBarItem.transform = CGAffineTransform.identity
            })
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)  {
        
        guard let tabBarItemTag = TabBarItemTag(rawValue: item.tag) else {
            return
        }
        switch tabBarItemTag {
        case .navigationItem:
            animation(elementBarItem: mapItemImageView)
        case .busItemView:
            animation(elementBarItem: busItemImageView)
        case .settingsItemView:
            animation(elementBarItem: settingsItemImageView)
        }
    }
    
}
