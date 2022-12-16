//
//  OTPviewModel.swift
//  WeVolunt
//
//  Created by roba on 12/12/2022.
//

import SwiftUI
import Firebase

class OTPviewModel: ObservableObject {
    
    //login data
    @Published var phoneNumber:String = ""
    @Published var code:String = "966"
    
    @Published var otpText : String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    //in case error occure
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    //OTP credentials
    @Published var verificationCode: String = ""
    
    @Published var isLoading: Bool = false
    
    @Published var navigationTag: String?
  //  @AppStorage("log_status") var log_status = false
    @Published var  log_status : Bool = false

    @EnvironmentObject var modelView : userModelView
    
    //sending OTP
    func sendOTP()async{
        if isLoading{return}
        do{
            isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(phoneNumber)",uiDelegate: nil)
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                //   self.verificationCode = "123456"
                self.navigationTag = "VERIFICATION"
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
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
    
    
    //verify the OTP function
    func verifyOTP()async{
        do{
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let _ = try await Auth.auth().signIn(with: credential)
            DispatchQueue.main.async {[self] in
                isLoading = false
                log_status = true
               
            }
        }catch{
            handleError(error: error.localizedDescription)
        }
        
    }
}
