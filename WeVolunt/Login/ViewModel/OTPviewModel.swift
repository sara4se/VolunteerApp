//
//  OTPviewModel.swift
//  WeVolunt
//
//  Created by roba on 12/12/2022.
//

import SwiftUI
import Firebase

class OTPviewModel: ObservableObject {
 
    @Published var isLoading: Bool = false
 
    
    @Published var verificationPhone = VerificationPhone() 
    
    //sending OTP
    func sendOTP()async{
        
        //to enable tesing code, if u want to use real number u should make it false
        Auth.auth().settings?.isAppVerificationDisabledForTesting = false
        
        if isLoading{return}
        do{
            isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(verificationPhone.code)\(verificationPhone.phoneNumber)",uiDelegate: nil)
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationPhone.verificationCode = result
                //   self.verificationCode = "123456"
                self.verificationPhone.navigationTag = "VERIFICATION"
              //  self.log_status = true
                
            }
            
        }
        catch{
            
            handleError(error: error.localizedDescription)
            
        }
        
    }
    
    //error handler function
    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.verificationPhone.errorMsg = error
            self.verificationPhone.showAlert.toggle()
        }
    }
    
    
    //verify the OTP function
    func verifyOTP()async{
        do{
            self.verificationPhone.otpText =    self.verificationPhone.otpFields.joined(separator: "")//print the array as string
            self.isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID:    self.verificationPhone.verificationCode, verificationCode:    self.verificationPhone.otpText)
            let _ = try await Auth.auth().signIn(with: credential)
            DispatchQueue.main.async {[self] in
                self.isLoading = false
                self.verificationPhone.log_status = true
               
            }
        }catch{
            handleError(error: error.localizedDescription)
        }
        
    }
}
