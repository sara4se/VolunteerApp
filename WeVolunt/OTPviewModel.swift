//
//  OTPviewModel.swift
//  WeVolunt
//
//  Created by roba on 12/12/2022.
//

import SwiftUI

class OTPviewModel: ObservableObject {
    @Published var otpText : String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 4)
    
    
}
