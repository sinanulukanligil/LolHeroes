//
//  KaanHeroesVC.swift
//  LolHeroes
//
//  Created by Kaan Ozdemir on 15.11.2020.
//

import UIKit
import Kingfisher

class KaanHeroesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var heroes: [KaanHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fillHeroDatas()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "KaanHeroFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "KaanHeroFeedTableViewCell")
    }
    
    func fillHeroDatas() {
        
        let zed = KaanHero(
            heroName: "Zed",
            heroImageUrl: "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt402d6da485218720/5db0601de9effa6ba5295fc5/RiotX_ChampionList_zed.jpg?quality=90&width=250",
            heroDescription: "Utterly ruthless and without mercy, Zed is the leader of the Order of Shadow, an organization he created with the intent of militarizing Ionia's magical and martial traditions to drive out Noxian invaders. During the war, desperation led him to unlock the secret shadow form—a malevolent spirit magic as dangerous and corrupting as it is powerful. Zed has mastered all of these forbidden techniques to destroy anything he sees as a threat to his nation, or his new order",
            relatedHeroes: [
                KaanHero(
                    heroName: "Yasuo",
                    heroImageUrl: "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt3a319fc884dc6880/5db0601c242f426df132f985/RiotX_ChampionList_yasuo.jpg?quality=90&width=250",
                    heroDescription: "An Ionian of deep resolve, Yasuo is an agile swordsman who wields the air itself against his enemies. As a proud young man, he was falsely accused of murdering his master—unable to prove his innocence, he was forced to slay his own brother in self defense. Even after his master's true killer was revealed, Yasuo still could not forgive himself for all he had done, and now wanders his homeland with only the wind to guide his blade.",
                    relatedHeroes: []
                ),
                KaanHero(
                    heroName: "LeBlanc",
                    heroImageUrl: "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt4aaf881bb90b509f/5db05fde6e8b0c6d038c5cae/RiotX_ChampionList_leblanc.jpg?quality=90&width=250",
                    heroDescription: "Mysterious even to other members of the Black Rose cabal, LeBlanc is but one of many names for a pale woman who has manipulated people and events since the earliest days of Noxus. Using her magic to mirror herself, the sorceress can appear to anyone, anywhere, and even be in many places at once. Always plotting just out of sight, LeBlanc's true motives are as inscrutable as her shifting identity.",
                    relatedHeroes: []
                )
            ]
        )
        
        
        let ziggs = KaanHero(
            heroName: "Ziggs",
            heroImageUrl: "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt0f8c12d54d8ecd28/5db0602289fb926b491ed835/RiotX_ChampionList_ziggs.jpg?quality=90&width=250",
            heroDescription: "With a love of big bombs and short fuses, the yordle Ziggs is an explosive force of nature. As an inventor's assistant in Piltover, he was bored by his predictable life and befriended a mad, blue-haired bomber named Jinx. After a wild night on the town, Ziggs took her advice and moved to Zaun, where he now explores his fascinations more freely, terrorizing the chem-barons and regular citizens alike in his never ending quest to blow stuff up.",
            relatedHeroes: []
        )
        
        let yone = KaanHero(
            heroName: "Yone",
            heroImageUrl: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yone_0.jpg",
            heroDescription: "In life, he was Yone—half-brother of Yasuo, and renowned student of his village's sword school. But upon his death at the hands of his brother, he found himself hunted by a malevolent entity of the spirit realm, and was forced to slay it with its own sword. Now, cursed to wear its demonic mask upon his face, Yone tirelessly hunts all such creatures in order to understand what he has become.",
            relatedHeroes: []
        )
        
        heroes = [zed, ziggs, yone]

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueHeroDetailVC"{
            let heroDetailVC = segue.destination as? KaanHeroDetailVC
            let hero = sender as! KaanHero
            heroDetailVC?.hero = hero
        }
    }
}

extension KaanHeroesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "KaanHeroFeedTableViewCell", for: indexPath) as! KaanHeroFeedTableViewCell
        
        let hero = heroes[indexPath.row]
        
        cell.heroNameLabel.text = hero.heroName
        
        
        
        if let imageURL = URL(string: hero.heroImageUrl ?? ""){
            cell.heroImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        }
        
        
        return cell
    }
    
    
}

extension KaanHeroesVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = heroes[indexPath.row]
        performSegue(withIdentifier: "SegueHeroDetailVC", sender: hero)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
