//
//  FeedCell.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-08.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet var feedCellLabel: UILabel!
    @IBOutlet var feedCellImage: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
