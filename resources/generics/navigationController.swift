//
//  navigationController.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit

final class navigationController: UINavigationController, UINavigationControllerDelegate {

    // MARK:- initilization
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
//        self.view.backgroundColor = iqaratBackgroundColor
//
//        UINavigationBar.appearance().titleTextAttributes = [
//                    .foregroundColor: iqaratTitleColor87,
//                    .font: fonts.setFontFor(.Bold_16)
//        ]
//        UINavigationBar.appearance().tintColor = iqaratTitleColor87
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        if lang.currentLanguage() == .en {
//            navigationController.view.semanticContentAttribute = .forceLeftToRight
//            navigationController.navigationBar.semanticContentAttribute = .forceLeftToRight
//        }else{
//            navigationController.view.semanticContentAttribute = .forceRightToLeft
//            navigationController.navigationBar.semanticContentAttribute = .forceRightToLeft
//        }
    }
}
