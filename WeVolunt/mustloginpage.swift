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
    @StateObject var modelView = userModelView()
    
    var body: some View {
        VStack(spacing: 20){
            if (otpModel.log_status == false) {
             //   else{ 
                    VStack(alignment:.center){
                                    Image(systemName: "exclamationmark.triangle")
                                        .font(.system(size: 60))
                                        .imageScale(.large)
                                        .foregroundColor(.orange)
                                    Text("you must login").bold()
                                }.padding(.top,100)
                                Spacer()
                                
                                //login button (look for a way to make the navigation link into a button and go to the login page
                                
                    Button{
                     //   otpModel.log_status.toggle()
                    }label: {
                        NavigationLink(destination: LoginPage(showingVolunteerSheet:$showingVolunteerSheet)
                                       //LoginPage()
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
                    
    //                Image(systemName: "exclamationmark.triangle")
    //                    .imageScale(.large)
    //                    .foregroundColor(.orange)
    //                Text("you must login")
                    
                    
                    //login button (look for a way to make the navigation link into a button and go to the login page
    //                Button{
    //                   log_status.toggle()
    //                }label: {
    //                    NavigationLink(destination: LoginPage()
    //                                   //LoginPage()
    //                                   , label:{
    //                        Text("Login")
    //                        Text("Login")
    //                            .frame(width:281 , height:41 )
    //                            .foregroundColor(.white)
    //                            .background(Color("ourBlue"))
    //                            .cornerRadius(8)
    //                            .fontWeight(.semibold)
    //
    //                    })
    //                }
    //
                    //this will trigger the botton and switch it once its clicked
                    //  modelView.user.isLogd.toggle()
                //}
            }
            else{VolunteerRegister(showingVolunteerSheet:$showingVolunteerSheet)}
        }
    }
}
struct mustloginpage_Previews: PreviewProvider {
    @StateObject static var modelView : userModelView = .init()
    static var previews: some View {
        mustloginpage(showingVolunteerSheet: .constant(true))
            .environmentObject(modelView)
    }
}
