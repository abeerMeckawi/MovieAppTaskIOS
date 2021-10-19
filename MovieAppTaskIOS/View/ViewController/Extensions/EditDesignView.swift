//
//  EditDesignView.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import UIKit

extension UIView {
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    func addShadow(){
        layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        layer.shadowRadius = 2.0
        layer.cornerRadius = 4.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }

}
