//
//  userModelView.swift
//  WeVolunt
//
//  Created by roba on 12/12/2022.
//

import Foundation
class userModelView : ObservableObject {
@Published var user : User

    init(){
        user = User(userName:"",userPhoneNumber: 0000000,isLogd: false)
    }

}
