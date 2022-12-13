//
//  LoginPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var otpModel: OTPviewModel = .init()
 //   @State var phoneNumber: String = ""
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 20){
                
                // *** START PAGE CONTENT ***
                
                
                
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
            }
            Spacer()
            //user phone number
            HStack(alignment: .center){
               
                Text("+966")
                    .foregroundColor(Color("ourBlue"))
                    .font(.system(size: 17))
                VStack{
                    TextField("  51 234 5678", text: $otpModel.phoneNumber)
                        .keyboardType(.numberPad)
                    
                    Rectangle()
                        .fill(otpModel.phoneNumber == "" ? .gray.opacity(0.35) : .gray)
                        .frame(height: 1)
                }
                .frame(width:207 , height:25 )
                .padding(.top, 8.0)
                
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
                
                Task{await otpModel.sendOTP()}
                
                
                
            }label: {
                VStack{
//                NavigationLink(destination: OTPverify().environmentObject(otpModel),label:{
//                    Text("this is navigstion")
              //  })
                Text("Login")
                    .frame(width:281 , height:41 )
                    .foregroundColor(.white)
                    .background(Color("ourBlue"))
                    .cornerRadius(8)
                    .fontWeight(.semibold)
                    .opacity(otpModel.isLoading ? 0 : 1)
            }
                .overlay{
                    //loading before oppening the CAPTCHA
                    ProgressView()
                        .opacity(otpModel.isLoading ? 1 : 0)
                    
                    //the navigation button will appear when the virification code is sent
                    if (!otpModel.verificationCode.isEmpty){
                        
                        NavigationLink(destination: OTPverify().environmentObject(otpModel),label:{
                            Text("this is navigstion")
                                .foregroundColor(.white)
                                .background(Color("ourBlue"))
                                .cornerRadius(8)
                                .fontWeight(.semibold)
                        })}
                }
                           
                        
                
            }
            .background()
            .disabled(otpModel.phoneNumber == "")
            .opacity(otpModel.phoneNumber == "" ? 0.4 : 1)
            
           
            Spacer()
          
        }
        
        .frame(maxHeight: .infinity,alignment: .top)
        //        .background{
////            NavigationLink(destination: OTPverify().environmentObject(otpModel),label:{})
//
//            NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag){
//                OTPverify().environmentObject(otpModel)
//            } label: {}
//                .labelsHidden()
//        }
         
        
        //sending alerts in case error occure
        .alert(otpModel.errorMsg,isPresented: $otpModel.showAlert){}
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
