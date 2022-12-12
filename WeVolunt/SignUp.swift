//
//  SignUp.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//
import SwiftUI

struct SignUp: View {
@State var textFieldText: String = ""
@State var input = ""
var body: some View {
VStack{
// *** START PAGE CONTENT ***
Image(systemName: "person.fill")
.imageScale(.large)
.foregroundColor(.accentColor)

        Text(" Registration ")
            .font(.headline)
            .foregroundColor(.blue)
        
        HStack{
            Text(" Name ")
            TextField("Type your name", text: $textFieldText)
               // .padding()
        }.padding()
        
        HStack{
            Text(" +966 ")
                .foregroundColor(.blue)
            TextField("Type your number", text: $input)
                .keyboardType(.decimalPad)
        }.padding()
        
        //login button
        NavigationLink(destination: VolunteerRegister(), label:{
            Text("Register")
                .frame(width:307 , height:44 )
                .foregroundColor(.white)
                .background(Color(.blue))
                .cornerRadius(8)
                .fontWeight(.semibold)
        })
     
    }
}
}

struct SignUp_Previews: PreviewProvider {
static var previews: some View {
SignUp()
}
}
