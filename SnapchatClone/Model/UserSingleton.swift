//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Enes Kaya on 8.08.2022.
//

import Foundation

class UserSingleton {
    
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    
    private init(){
        
    }
}
