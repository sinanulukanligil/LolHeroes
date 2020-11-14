//
//  ViewController.swift
//  LolHeroes
//
//  Created by Yusuf Sinan Ulukanligil on 2020-11-07.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet var signInImage: UIImageView!
    @IBOutlet var signInUsername: UITextField!
    @IBOutlet var signInPassword: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }
    @IBAction func signInregister(_ sender: Any) {
        if signInUsername.text != nil && signInPassword.text != nil {
            Auth.auth().createUser(withEmail: signInUsername.text!, password: signInPassword.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(Title: "Error", text: error?.localizedDescription  ?? "Fatal Error")
                } else {
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["email":self.signInUsername.text!] as [String:Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            self.makeAlert(Title: "Error", text: error?.localizedDescription ?? "fatal error")
                        } else {
                            self.performSegue(withIdentifier: "toMainVC", sender: nil)
                        }
                    }
                }
            }
        } else {
            self.makeAlert(Title: "Error", text: "Email and Password is Required!")
        }
        
    }
    @IBAction func signInLogin(_ sender: Any) {
        if signInUsername.text != nil && signInPassword.text != nil {
            Auth.auth().signIn(withEmail: signInUsername.text!, password: signInPassword.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(Title: "Error", text: error?.localizedDescription ?? "Log In Error")
                }else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        }else {
            self.makeAlert(Title: "Error", text: "Email and Password is Required!")
        }
    }
    func makeAlert(Title:String,text:String) {
        let alert = UIAlertController(title: Title, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }
    

}

