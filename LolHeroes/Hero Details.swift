//
//  Hero Details.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit

class Hero_Details: UIViewController {
    
    @IBOutlet var heroLabel: UILabel!
    @IBOutlet var heroImageView: UIImageView!
    
    var receivedHeroLabel : String?
    var heroName: String?
    var receivedHeroImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = heroName

        heroImageView.image = receivedHeroImage
        heroLabel.text = receivedHeroLabel
    }
 
    


}
