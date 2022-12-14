//
//  ProfilePage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct ProfilePage: View {
    @State var showingVolunteerSheet = false
    var body: some View {
        ZStack{
            // *** background should be here ***
            VStack{
                // *** START PAGE CONTENT ***
                Text("this is profile page")
                    .padding()
                Text("click here to open selected volunteer")
                    .onTapGesture(perform: {
                        showingVolunteerSheet.toggle()
                    })
                    .fullScreenCover(isPresented: $showingVolunteerSheet){
                        EnrolledVolunteer(showingVolunteerSheet:$showingVolunteerSheet)
                    }
            }
            
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
