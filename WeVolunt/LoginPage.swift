//
//  LoginPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct LoginPage: View {
    @State var phoneNumber: String = ""
    var body: some View {
        VStack(spacing: 20){
            // *** START PAGE CONTENT ***
            Spacer()

       
            Image(systemName: "person.badge.shield.checkmark")
                .resizable()
                .frame(width:70 , height:70 )
                .foregroundColor(Color("ourBlue"))
            
            Text("Enter your mobile number ")
                .font(.title2).bold()
                .foregroundColor(Color("ourBlue"))
                
           
                Text("we will send you OTP code to verify your identity")
                    .foregroundColor(Color("volunteerFont"))
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.bottom)
                Spacer()
                //user phone number
            HStack(alignment: .center){
                
                Text("+966")
                    .foregroundColor(Color("ourBlue"))
                    .font(.system(size: 17))
                TextField("Phone Number", text: $phoneNumber)
                    .frame(width:207 , height:25 )
            }
              
//            //login button
//            NavigationLink(destination: OTPverify(), label:{
//                Text("Login")
//                    .frame(width:307 , height:44 )
//                    .foregroundColor(.white)
//                    .background(Color(.blue))
//                    .cornerRadius(8)
//                    .fontWeight(.semibold)
//            })
//
            //login button
            Spacer()
            Spacer()
            Button{
            
                    }label: {
                        NavigationLink(destination: OTPverify(), label:{
                        Text("Login")
                            .frame(width:281 , height:41 )
                            .foregroundColor(.white)
                            .background(Color("ourBlue"))
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                        })
                           
                    }
            
            Spacer()
        }
       
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
