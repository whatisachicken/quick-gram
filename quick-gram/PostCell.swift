//
//  PostCell.swift
//  quick-gram
//
//  Created by Jonathan on 3/7/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    //Create outlets
    @IBOutlet weak var photoVIew: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
