//
//  ProfileItemCell.swift
//  SMV-iper
//
//  Created by Rifat Firdaus on 09/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit

class ProfileItemCell: UICollectionViewCell {

    @IBOutlet private weak var imageViewIcon: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var viewContainer: UIView!
    
    var profileItem: ProfileItem? {
        didSet {
            if let profileItem = profileItem {
                imageViewIcon.image = profileItem.imageProfile
                labelTitle.text = profileItem.title
            } else {
                imageViewIcon.image = nil
                labelTitle.text = ""
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.backgroundColor = SMUITheme.color.secondary
    }

}
