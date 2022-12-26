//
//  File.swift
//  WeVolunt
//
//  Created by Sara Alhumidi on 02/06/1444 AH.
//

import Foundation

struct VerificationPhone {
    var phoneNumber : String = ""
    var code : String = "966"
    var otpText : String = ""
    var otpFields: [String] = Array(repeating: "", count: 6)
    var showAlert : Bool = false
    var errorMsg : String = ""
    var verificationCode : String = ""
    
   
    
    var navigationTag: String?
    var  log_status : Bool = false
   
    init(phoneNumber: String, code: String, otpText: String, otpFields: [String], showAlert: Bool, errorMsg: String, verificationCode: String, navigationTag: String? = nil, log_status: Bool) {
        self.phoneNumber = phoneNumber
        self.code = code
        self.otpText = otpText
        self.otpFields = otpFields
        self.showAlert = showAlert
        self.errorMsg = errorMsg
        self.verificationCode = verificationCode
        self.navigationTag = navigationTag
        self.log_status = log_status
    }
    init(){}
     
}
