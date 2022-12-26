//
//  UserSettings.swift
//  WeVolunt
//
//  Created by Sara Alhumidi on 14/05/1444 AH.
//

import Foundation
import Combine

class UserSettingsViewModel : ObservableObject {
    
    @Published var userSettings : UserSettings{
       didSet {
            UserDefaults.standard.set(userSettings.arrayOfSelected, forKey: "arrayOfSelected")
        }
    }
    
    init(userSettings: UserSettings) {
        self.userSettings = userSettings
    }
    
}
