//
//  SongCell.swift
//  Tema5-AppleMusic
//
//  Created by Ana Torres Piedra on 14/01/2019.
//  Copyright © 2019 Ana Torres. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var song: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var id: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
