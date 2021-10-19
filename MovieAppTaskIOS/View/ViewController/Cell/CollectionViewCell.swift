//
//  CollectionViewCell.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 17/10/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCast: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgCast.layer.cornerRadius = imgCast.frame.size.width / 2
    }
    
    func configureCell(cast : CastDetails){
        
        imgCast.sd_setImage(with: URL(string:Constants.BASE_IMG_URL + cast.castImg), placeholderImage: UIImage(named: "placeholder.png"))
    }

}
