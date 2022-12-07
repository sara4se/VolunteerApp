//
//  EnrolledVolunteer.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct EnrolledVolunteer: View {
    var body: some View {
        
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is enrolled volunteers page")
                .padding()
            //login button
            Button("withdraw"){
            }
            .frame(width:307 , height:44 )
            .foregroundColor(.white)
            .background(Color(.orange))
            .cornerRadius(8)
            .fontWeight(.semibold)
        }
    }
}

struct EnrolledVolunteer_Previews: PreviewProvider {
    static var previews: some View {
        EnrolledVolunteer()
    }
}
