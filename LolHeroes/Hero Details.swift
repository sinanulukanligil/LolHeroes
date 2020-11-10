//
//  Hero Details.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit

class Hero_Details: UIViewController {
    
    var receivedHeroLabel = ""
    var receivedHeroImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        heroImageView.image = receivedHeroImage
        heroLabel.text = receivedHeroLabel
    }
    @IBOutlet var heroImageView: UIImageView!
    
    @IBOutlet var heroLabel: UILabel!
    


}
