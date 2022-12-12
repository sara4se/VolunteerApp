//
//  SelectedVolunteer.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct SelectedVolunteer: View {
    var body: some View {
        NavigationView(){
            ZStack{
                // *** background should be here ***
                VStack{
                    
                    // *** START PAGE CONTENT ***
                    Text("this is the selected volunteer page")
                        .padding()
                    //enroll button
                    NavigationLink(destination: LoginPage(), label:{
                        Text("Enroll")
                            .frame(width:307 , height:44 )
                            .foregroundColor(.white)
                            .background(Color(.blue))
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                        
                    })
                    
                }
            }
            
        }
    }
}

struct SelectedVolunteer_Previews: PreviewProvider {
    static var previews: some View {
        SelectedVolunteer()
    }
}
