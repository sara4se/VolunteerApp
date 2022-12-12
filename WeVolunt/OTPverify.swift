//
//  OTPverify.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct OTPverify: View {
@StateObject static var userModelView: userModelView = .init()
    var body: some View {
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is OTP verify page")
                .padding()
            //login button
            NavigationLink(destination: VolunteerRegister()  .environmentObject(OTPverify.userModelView), label:{
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


//import SwiftUI
//
//struct OTPverify: View {
//@StateObject var otpModel: OTPviewModel = .init()
//@FocusState var activeField: OTPfield?
//var body: some View {
//VStack{
//OTPField()
//
//        Button{
//
//        }label: {
//            Text("verify")
//                .fontWeight(.semibold)
//                .foregroundColor(.white)
//                .padding(.vertical,12)
//                .frame(maxWidth: .infinity)
//                .background{
//                    RoundedRectangle(cornerRadius: 10, style: .continuous)
//                        .fill(.blue)
//                }
//        }
//        .disabled(checkStates())
//        .opacity(checkStates() ? 0.4 : 1)
//        .padding(.vertical)
//        HStack(spacing: 12){
//            Text("didnt get otp?")
//                .font(.caption)
//                .foregroundColor(.gray)
//            Button("Resend"){}
//                .font(.callout)
//        }
//        .frame(minWidth: .infinity, alignment: .leading)
//
//        // *** START PAGE CONTENT ***
//        Text("this is OTP verify page")
//            .padding()
//        //login button
//        NavigationLink(destination: VolunteerRegister(), label:{
//            Text("Submit")
//                .frame(width:307 , height:44 )
//                .foregroundColor(.white)
//                .background(Color(.blue))
//                .cornerRadius(8)
//                .fontWeight(.semibold)
//        })
//    }
//    .frame(maxHeight: .infinity, alignment: .center)
//    .navigationTitle("Verification")
//    .onChange(of: otpModel.otpFields){newValue in
//        OTPcondition(value: newValue)
//    }
//}
//func checkStates()->Bool{
//    for index in 0..<4{
//        if otpModel.otpFields[index].isEmpty{return true}
//    }
//    return false
//}
//
//
//func OTPcondition(value:[String]){
//    for index in 0..<3{
//        if value[index].count == 1 && activeStateForIndex(index: index) == activeField{activeField = activeStateForIndex(index: index + 1)}
//    }
//    for index in 1..<3{
//        if value[index].isEmpty && !value[index - 1].isEmpty{activeField = activeStateForIndex(index: index - 1)}
//
//        for index in 0..<4{
//            if value[index].count > 1 {
//                otpModel.otpFields[index] = String(value[index].last!)
//            }
//        }
//    }
//
//    @ViewBuilder
//    func OTPField()->some View{
//        HStack(spacing:14){
//            ForEach(0..<4,id: \.self){ index in
//                VStack(spacing:8){
//                    TextField("", text: $otpModel.otpFields[index])
//                        .keyboardType(.numberPad)
//                        .textContentType(.oneTimeCode)
//                        .multilineTextAlignment(.center)
//                        .focused($activeField, equals: activeStateForIndex(index: index))
//
//                    Rectangle()
//                        .fill(activeField == activeStateForIndex(index: index) ? .blue : .gray.opacity(0.3))
//                        .frame(height:4)
//                }
//                .frame(width:48)
//            }
//        }
//    }
//    func activeStateForIndex(index: Int)->OTPfield{
//        switch index{
//        case 0: return .field1
//        case 1: return .field2
//        case 2: return .field3
//        default: return .field4
//        }
//    }
//}
//
//struct OTPverify_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//enum OTPfield{
//    case field1
//    case field2
//    case field3
//    case field4
//}
//}
