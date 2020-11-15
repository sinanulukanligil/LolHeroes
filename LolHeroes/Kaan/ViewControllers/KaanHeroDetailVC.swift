//
//  HeroDetailVC.swift
//  LolHeroes
//
//  Created by Kaan Ozdemir on 15.11.2020.
//

import UIKit
import Kingfisher

class KaanHeroDetailVC: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var hero: KaanHero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congfigureCollectionView()
        setHero()
    }
    
    func congfigureCollectionView() {
        collectionView.register(UINib(nibName: "KaanHeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "KaanHeroCollectionViewCell")
    }
    
    func setHero() {
        navigationItem.title = hero?.heroName
        descriptionLabel.text = hero?.heroDescription
        
        if let imageURL = URL(string: hero?.heroImageUrl ?? "") {
            heroImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        }
    }
}

extension KaanHeroDetailVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hero?.relatedHeroes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KaanHeroCollectionViewCell", for: indexPath) as! KaanHeroCollectionViewCell
        
        if let relatedHero = hero?.relatedHeroes?[indexPath.item]{
            cell.heroNameLabel.text = relatedHero.heroName
            
            if let imageURL = URL(string: relatedHero.heroImageUrl ?? ""){
                cell.heroImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
            }
        }
        
        
        return cell
    }
    
    
}

extension KaanHeroDetailVC: UICollectionViewDelegate{
    
}
