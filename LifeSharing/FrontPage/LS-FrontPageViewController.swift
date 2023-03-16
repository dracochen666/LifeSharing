//
//  LS-FrontPageViewController.swift
//  LifeSharing
//
//  Created by 陈龙 on 2023/3/14.
//

import UIKit
import XLPagerTabStrip

class LS_FrontPageViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        //配置buttonbar
        settings.style.buttonBarMinimumLineSpacing = 20
        settings.style.buttonBarLeftContentInset = 115
        settings.style.buttonBarRightContentInset = 115
        settings.style.selectedBarBackgroundColor = .red
        settings.style.selectedBarHeight = 2
        //配置buttonbarItem
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
//        settings.style.buttonBarItemLeftRightMargin = 0
//        settings.style.buttonBarItemLeftRightMargin = 0
        super.viewDidLoad()
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label

            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        containerView.bounces = false
        DispatchQueue.main.async {//潜在问题：Unbalanced calls to begin/end appearance transitions for
            self.moveToViewController(at: 1,animated: false)
        }
        self.view.backgroundColor = .white

    }
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    
        let follow = self.storyboard!.instantiateViewController(withIdentifier: kfollowVCID)
        let discovery = storyboard!.instantiateViewController(withIdentifier: kdiscoveryVCID)
        let nearby = storyboard!.instantiateViewController(withIdentifier: knearbyVCID)
        return [follow,discovery,nearby]

    }
//    override func calculateStretchedCellWidths(_ minimumCellWidths: [CGFloat], suggestedStretchedCellWidth: CGFloat, previousNumberOfLargeCells: Int) -> CGFloat {
//        return 10
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
