//
//  controller.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit
import SnapKit

protocol controllerFunctions:AnyObject {
    func setUPUI()
    func updateView()
    func viewBinder()
}

class controller:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MAIN_APP_COLOR
    }
}
