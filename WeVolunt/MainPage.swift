//
//  MainPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct MainPage: View {
    @State var showingVolunteerSheet = false
    var body: some View {
        //the navigation view might be removed from here later, but for now im keeping it so we can see it in the preview
        NavigationView(){
            ZStack{
                // *** background should be here ***
                VStack{
                    // *** START PAGE CONTENT ***
                    Text("this is main page")
                        .padding()
                    Text("click here to open selected volunteer")
                        .onTapGesture(perform: {
                            showingVolunteerSheet.toggle()
                        })
                        .sheet(isPresented:  $showingVolunteerSheet){
                            SelectedVolunteer()
                        }
                       
                        .toolbar{
                            
                            NavigationLink(destination: ProfilePage(), label:{
                                Label("Profile", systemImage: "person.circle")
                            })
                        }
                    
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
