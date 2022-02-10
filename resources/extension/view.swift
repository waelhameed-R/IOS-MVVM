//
//  view.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit

extension UIView {
    static func isRightToLeft() -> Bool {
        return UIView.appearance().semanticContentAttribute == .forceRightToLeft
    }
}
