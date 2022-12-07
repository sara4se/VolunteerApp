//
//  VolunteerRegister.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct VolunteerRegister: View {
    var body: some View {
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is volunteer registration page")
                .padding()
            //login button
            NavigationLink(destination: SubmitNotify(), label:{
                Text("Submit")
                    .frame(width:307 , height:44 )
                    .foregroundColor(.white)
                    .background(Color(.blue))
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            })
        }
    }
}

struct VolunteerRegister_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerRegister()
    }
}
