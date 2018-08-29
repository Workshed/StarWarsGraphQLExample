//
//  CharacterTableViewCell.swift
//  StarWarsIMDB
//
//  Created by Daniel Leivers on 28/08/2018.
//  Copyright © 2018 Otaku. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var homeworldNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
