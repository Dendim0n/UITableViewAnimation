//
//  UITableView+ReloadAnimation.swift
//  UITableViewAnimation
//
//  Created by 任岐鸣 on 2016/10/14.
//  Copyright © 2016年 Ned. All rights reserved.
//

import Foundation
import UIKit

class AnimTableView: UITableView {
    enum animType {
        case fromRightToLeft
        case fromLeftToRight
        case fromBottomToTop
        case superReload
    }
    override func reloadData() {
        super.reloadData()
        reloadDataWithAnim(type: .superReload)
    }
    func reloadDataWithAnim(type:animType) {
        if type != .superReload {
            super.reloadData()
        }
        self.alpha = 0
        let diff = 0.05
        let tableHeight = self.bounds.size.height
        let tableWidth = self.bounds.size.width
        let cells = self.visibleCells
        
        var transform:CGAffineTransform
        
        switch type {
        case .fromBottomToTop,.superReload:
            transform = CGAffineTransform.init(translationX: 0, y: tableHeight)
        case .fromLeftToRight:
            transform = CGAffineTransform.init(translationX: -tableWidth, y: 0)
        case .fromRightToLeft:
            transform = CGAffineTransform.init(translationX: tableWidth, y: 0)
        }
        
        for cell in cells {
            cell.transform = transform
        }
        self.alpha = 1
        
        for i in 0...cells.count - 1 {
            UIView.animate(withDuration: 1.6, delay: Double(i) * diff, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                cells[i].transform = CGAffineTransform.init(translationX: 0, y: 0)
                }, completion: nil)
        }
    }
}
