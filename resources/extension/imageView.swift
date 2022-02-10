//
//  imageView.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit

extension UIImageView {
    func startAnimating() {
        let gradientColorOne : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        let gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    let gradientLayer = CAGradientLayer()
    /* Allocate the frame of the gradient layer as the view's bounds, since the layer will sit on top of the view. */
      
      gradientLayer.frame = self.bounds
    /* To make the gradient appear moving from left to right, we are providing it the appropriate start and end points.
    Refer to the diagram above to understand why we chose the following points.
    */
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
      gradientLayer.colors = [gradientColorOne, gradientColorTwo,   gradientColorOne]
      gradientLayer.locations = [0.0, 0.5, 1.0]
    /* Adding the gradient layer on to the view */
      self.layer.addSublayer(gradientLayer)
    }
}
