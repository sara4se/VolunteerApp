//
//  LoginPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is login page")
                .padding()
            //login button
            NavigationLink(destination: OTPverify(), label:{
                Text("Login")
                    .frame(width:307 , height:44 )
                    .foregroundColor(.white)
                    .background(Color(.blue))
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            })
        }
       
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
