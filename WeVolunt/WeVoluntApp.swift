//
//  WeVoluntApp.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI
import Firebase


@main
struct WeVoluntApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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

// this will set up the  firebase
class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    // OTP remote notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
    
    }

