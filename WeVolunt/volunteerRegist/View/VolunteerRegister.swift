//
//  VolunteerRegister.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct VolunteerRegister: View {

// this will create an object from the model to use it and its published attributes
@EnvironmentObject var modelView : userModelView

@State private var date = Date()
@State var textFieldText1: String = ""
@State var ID = ""
@State var Email = ""
@State var Adress = ""
var body: some View {
    VStack(alignment: .center){
        
        //if the user isnt logging in then the u must login will appear
        if modelView.user.isLogd {
            Image(systemName: "exclamationmark.triangle")
                .imageScale(.large)
                .foregroundColor(.orange)
            Text("you must login")
            
            
            //login button (look for a way to make the navigation link into a button and go to the login page
            
            NavigationLink(destination: SubmitNotify()
                            //LoginPage()
                           , label:{
                Text("Login")
                    .frame(width:307 , height:44 )
                    .foregroundColor(.white)
                    .background(Color(.blue))
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            })
            
            //this will trigger the botton and switch it once its clicked
          //  modelView.user.isLogd.toggle()
        }
        
       //if the user alr logging un the form page will appear
        else{
        Image(systemName: "highlighter")
            .imageScale(.large)
            .foregroundColor(.accentColor)
    
        Text(" please fill your information to enroll ")
          //  .font(.headline)
            .foregroundColor(.gray)
            
            HStack{
                Text("Name")
                TextField("Type your name", text: $textFieldText1)
            }.padding()
            HStack{
                Text("ID")
                TextField("Type your ID", text: $ID)
            }.padding()
            
            HStack{
                DatePicker(
                        "Birthd Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
            }.padding()
            
            HStack{
                Text("Email")
                TextField("Type your Email", text: $Email)
            }.padding()
            
            HStack{
                Text("Adress")
                TextField("Type your Adress", text: $Adress)
            }.padding()
            
        
            
            
            
            
            
            
        // *** START PAGE CONTENT ***
                  //  Text("this is volunteer registration page")
                        .padding()
        //login button
        NavigationLink(destination: SubmitNotify(), label:{
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
}

struct VolunteerRegister_Previews: PreviewProvider {

@StateObject static var userModelView: userModelView = .init()
static var previews: some View {
    VolunteerRegister()
        .environmentObject(userModelView)
}
}
