//
//  WeVoluntApp.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

@main
struct WeVoluntApp: App {
    init() {
        //to change the navigation title color in the .inline display mode
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some Scene {
        
        WindowGroup {
            SplashScreen()
        }
    }
}
