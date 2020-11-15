//
//  FeedVC.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit

class FeedVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
  
    var chosenHero: heroes? = nil
    
   var heroArray = [diana,azir,ahri,akali,cass,fizz,galio,kassadin,katarina,leblanc,malzahar,neeko,orianna,qiyana,sylas,syndra,talon,twistedfate,veigar,viktor,vlad,yasuo,yone,ziggs,zoe,zed]

    @IBOutlet var collectionView: UICollectionView!
  
    
    @IBOutlet var feedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        feedTableView.delegate = self
        feedTableView.dataSource = self
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.rowHeight = 200
        
        
        
      
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.feedCellLabel.text = heroArray[indexPath.row].name
        cell.feedCellImage.image = UIImage(named:heroArray[indexPath.row].heroImage)
        
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenHero = self.heroArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: chosenHero)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! Hero_Details
            let hero = sender as? heroes
            destinationVC.receivedHeroLabel = hero?.details
            destinationVC.receivedHeroImage = UIImage(named: hero?.heroImage ?? "")
            destinationVC.heroName = hero?.name
            
        }
    }

}
