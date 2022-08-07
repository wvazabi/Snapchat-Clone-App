//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Enes Kaya on 7.08.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class SettingsVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logout2(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error")
        }
        
            
            
        
        performSegue(withIdentifier: "toSigninVC", sender: nil)
        
    }
    
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error")
        }
        
            
            
        
        performSegue(withIdentifier: "toSigninVC", sender: nil)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
