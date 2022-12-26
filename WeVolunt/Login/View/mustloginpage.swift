//
//  mustloginpage.swift
//  WeVolunt
//
//  Created by roba on 18/12/2022.
//

import SwiftUI

struct mustloginpage: View {
    @Binding var showingVolunteerSheet: Bool
    @StateObject var otpModel: OTPviewModel = OTPviewModel()
   var body: some View {
        VStack(spacing: 20){
            if (otpModel.verificationPhone.log_status == false) {
         
                    VStack(alignment:.center){
                                    Image(systemName: "exclamationmark.triangle")
                                        .font(.system(size: 60))
                                        .imageScale(.large)
                                        .foregroundColor(.orange)
                                    Text("you must login").bold()
                                }.padding(.top,100)
                Spacer()
                Spacer()
                    Button{
                    }label: {
                        NavigationLink(destination: LoginPage(showingVolunteerSheet:$showingVolunteerSheet)
                                
                                       , label:{
                            Text("Login")
                                .frame(width:281 , height:41 )
                                .foregroundColor(.white)
                                .background(Color("ourBlue"))
                                .cornerRadius(8)
                                .fontWeight(.semibold)

                        })
                    }
                    
                    
                                .padding()
                    
                    
                
                    Spacer()
                    
            }
            else{VolunteerRegister(showingVolunteerSheet:$showingVolunteerSheet)}
        }
    }
}
struct mustloginpage_Previews: PreviewProvider {
 
    static var previews: some View {
        mustloginpage(showingVolunteerSheet: .constant(true))
    }
}
