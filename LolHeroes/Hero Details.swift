//
//  Hero Details.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit

class Hero_Details: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var heroArray = [diana,azir,ahri,akali,cass,fizz,galio,kassadin,katarina,leblanc,malzahar,neeko,orianna,qiyana,sylas,syndra,talon,twistedfate,veigar,viktor,vlad,yasuo,yone,ziggs,zoe,zed]
   
    @IBOutlet var collectionView: UICollectionView!
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FirstCollectionViewCell
        cell.cellImageView.image = UIImage(named: heroArray[indexPath.row].heroImage)
        cell.cellLabel.text = heroArray[indexPath.row].name
        return cell
    }
    


}
