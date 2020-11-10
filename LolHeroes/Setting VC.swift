//
//  Setting VC.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit
import Firebase

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logOutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    

 

}
