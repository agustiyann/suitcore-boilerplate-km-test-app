//
//  UserTableViewCell.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 09/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    var user: User? {
        didSet {
            if let user = user {
                imageViewUser.layer.cornerRadius = 25
                imageViewUser.clipsToBounds = true
                imageViewUser.sd_imageIndicator = SDWebImageActivityIndicator.gray
                imageViewUser.sd_setImage(with: URL(string: user.avatar!))
                labelName.text = "\(user.firstName!) \(user.lastName!)"
                labelEmail.text = user.email!
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
