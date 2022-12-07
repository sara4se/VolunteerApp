//
//  ContentView.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State var splashScreen  = true
    var body: some View {
        //this will view the splash screen for 2 sec then switch to main page
        ZStack{
            Group{
                if splashScreen {
                    SplashScreen()
                }
                else{
                    InterestPage()
                }
            }
            .onAppear {
                DispatchQueue
                    .main
                    .asyncAfter(deadline:
                            .now() + 2) {
                                self.splashScreen = false
                            }
            }
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
