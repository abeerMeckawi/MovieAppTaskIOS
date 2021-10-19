//
//  FullScreen + DetailsVC.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import UIKit

extension DetailsViewController{
    
    @IBAction func fullScreenImage(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
         let newImageView = UIImageView(image: imageView.image)
         newImageView.frame = UIScreen.main.bounds
         newImageView.backgroundColor = .black
         newImageView.contentMode = .scaleAspectFit
         newImageView.isUserInteractionEnabled = true
         let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
         newImageView.addGestureRecognizer(tap)
         self.view.addSubview(newImageView)
         self.navigationController?.isNavigationBarHidden = true
         self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
}
