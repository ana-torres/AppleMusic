//
//  PlayListCell.swift
//  Tema5-AppleMusic
//
//  Created by Ana Torres Piedra on 11/01/2019.
//  Copyright © 2019 Ana Torres. All rights reserved.
//

import UIKit

class PlayListCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.backgroundColor = UIColor.clear
    }

    func setUpViews() {
        //Border redondeado en la imagen
        self.img.layer.borderWidth = 1
        self.img.layer.cornerRadius = 4
        self.img.layer.borderColor = UIColor.clear.cgColor
        self.img.layer.masksToBounds = true
        
        // Sombra en la celda
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 5)
        self.layer.shadowOpacity = 0.9
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 4).cgPath
        self.contentView.layer.cornerRadius = 20
        
    }
    
}
