//
//  FeedVC.swift
//  SnapchatClone
//
//  Created by Enes Kaya on 7.08.2022.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    let firestoreDB = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        getUserData()
    }
    
    
    
    func getUserData(){
    
       
        firestoreDB.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser?.email).getDocuments { snapshot, error in
            if error != nil {
                self.alertPopUp(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error ")
                
            }
            else{
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents{
                        
                        if let username = document.get("username") as? String{
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                            UserSingleton.sharedUserInfo.username = username
                        }
                        
                    }
                }
            }
        }
        
        
    }
    
    func alertPopUp(titleInput:String, messageInput:String){
           let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
           let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(okButton)
           self.present(alert, animated: true, completion: nil)
       }
    

}
