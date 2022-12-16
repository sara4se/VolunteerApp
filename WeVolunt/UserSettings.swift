//
//  UserSettings.swift
//  WeVolunt
//
//  Created by Sara Alhumidi on 14/05/1444 AH.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var enterdInterstTogle: Bool {
        didSet {

            UserDefaults.standard.set(enterdInterstTogle, forKey: "enterdInterstTogle")
        }
    }
    @Published var username: String {
        didSet {

            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var isPrivate: Bool {
        didSet {
            UserDefaults.standard.set(isPrivate, forKey: "isAccountPrivate")
        }
    }
    
 
    @Published var arrayOfSelected : [String] {
        didSet {
            UserDefaults.standard.set(arrayOfSelected, forKey: "arrayOfSelected")
        }
    }
    
    init(enterdInterstTogle: Bool, username: String, isPrivate: Bool, arrayOfSelected: [String]) {
        self.enterdInterstTogle = enterdInterstTogle
        self.username = username
        self.isPrivate = isPrivate
        self.arrayOfSelected = arrayOfSelected
    }
}
