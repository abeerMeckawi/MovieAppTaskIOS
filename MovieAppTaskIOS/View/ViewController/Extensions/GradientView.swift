//
//  GradientView.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 17/10/2021.
//

import UIKit

@IBDesignable
class GradientScrollView: UIScrollView{
    
    @IBInspectable var FirstColor : UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var SecondColor : UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor,SecondColor.cgColor]
    }
}

class GradientView: UIView{
    
    @IBInspectable var FirstColor : UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var SecondColor : UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor,SecondColor.cgColor]
    }
}


