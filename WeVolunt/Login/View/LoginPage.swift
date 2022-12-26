//
//  LoginPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct LoginPage: View {
    @Binding var showingVolunteerSheet: Bool
    @StateObject var otpModel: OTPviewModel = OTPviewModel()
    
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
                    TextField("  51 234 5678", text: $otpModel.verificationPhone.phoneNumber)
                        .keyboardType(.numberPad)
                    
                    Rectangle()
                        .fill(otpModel.verificationPhone.phoneNumber == "" ? .gray.opacity(0.35) : .gray)
                        .frame(height: 1)
                }
                .frame(width:207 , height:25 )
                .padding(.top, 8.0)
                
            }
            
            Spacer()
            Spacer()
            
            Button {
                
                Task{await otpModel.sendOTP()}
                
            } label: {
                VStack {
                    Text("Send OTP")
                        .frame(width:281 , height:41 )
                        .foregroundColor(.white)
                        .background(Color("ourBlue"))
                        .cornerRadius(8)
                        .fontWeight(.semibold)
                        .opacity(otpModel.isLoading ? 0 : 1)
            }  .overlay {
                    //loading before oppening the CAPTCHA
                    ProgressView()
                        .opacity(otpModel.isLoading ? 1 : 0)
                        
                            if (!otpModel.verificationPhone.verificationCode.isEmpty){
                                NavigationLink(destination: OTPverify(showingVolunteerSheet:$showingVolunteerSheet).environmentObject(otpModel),label:{
                                    Text("Continue")
                                        .frame(width:281 , height:41 )
                                        .foregroundColor(.white)
                                        .background(Color("ourBlue"))
                                        .cornerRadius(8)
                                        .fontWeight(.semibold)
                                })}
                              
                        
                            
            }
            .background()
            .disabled(otpModel.verificationPhone.phoneNumber == "")
            .opacity(otpModel.verificationPhone.phoneNumber == "" ? 0.4 : 1)
            
            
         
            
        }
            Spacer()
        } //.frame(maxHeight: .infinity,alignment: .top)
       
        .alert(otpModel.verificationPhone.errorMsg,isPresented: $otpModel.verificationPhone.showAlert){}
    }
}


struct LoginPage_Previews: PreviewProvider {
    @StateObject static var otpModel : OTPviewModel = .init()
    static var previews: some View {
        LoginPage(showingVolunteerSheet: .constant(true)).environmentObject(otpModel)
    }
}
