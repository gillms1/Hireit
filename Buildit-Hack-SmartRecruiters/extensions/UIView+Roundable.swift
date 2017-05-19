//
//  UIView+Roundable.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Tiago Bencardino on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation

import UIKit

extension UIView {

    func roundView() {

        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }

    func roundViewWithCorner(_ corner: CGFloat) {

        self.layer.cornerRadius = corner
    }
}
