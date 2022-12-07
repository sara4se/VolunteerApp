//
//  OTPverify.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct OTPverify: View {
    var body: some View {
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is OTP verify page")
                .padding()
            //login button
            NavigationLink(destination: VolunteerRegister(), label:{
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

struct OTPverify_Previews: PreviewProvider {
    static var previews: some View {
        OTPverify()
    }
}
