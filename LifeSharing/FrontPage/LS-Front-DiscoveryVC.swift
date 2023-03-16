//
//  LS-Front-DiscoveryVC.swift
//  LifeSharing
//
//  Created by 陈龙 on 2023/3/16.
//

import UIKit
import XLPagerTabStrip

class LS_Front_DiscoveryVC: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4

    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return IndicatorInfo(title: "发现")
    }
    

}
