//
//  VolunteerRegister.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct VolunteerRegister: View {
    @Binding var showingVolunteerSheet: Bool
    
    @StateObject var modelView = userModelView()
    
    @State private var date = Date()
    @State var textFieldText1: String = ""
    @State var ID = ""
    @State var Email = ""
    @State var Adress = ""
    var body: some View {
        VStack(spacing: 20){
       
            ScrollView(.vertical){
                VStack(spacing: 20){
                    Image(systemName: "highlighter")
                        .font(.system(size: 40)).bold()
                        .imageScale(.large)
                    //.foregroundColor(.accentColor)
                        .foregroundColor(Color("ourBlue"))
                    // .padding(.top)
                    Text(" please fill your information to enroll ")
                    // .font(.headline)
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                    // .padding(.horizontal, 30)
                        .padding(.bottom)
                    
                    VStack{
                        HStack{
                            Text("Name")
                                .font(.system(size: 17))
                            //.underline(color:.gray)
                            TextField("Type your name", text: $textFieldText1).modifier(ClearButton(text: $textFieldText1))
                                .font(.system(size: 17))
                            // .underline(color:.gray)
                            
                        }.padding(.horizontal,30)
                      Divider()
                            .frame(width:  270)
                            .background(Color.black)
                    }
                    VStack{
                        HStack{
                            Text("ID")
                                .font(.system(size: 17))
                            TextField("Type your ID", text: $ID).modifier(ClearButton(text: $ID))
                                .font(.system(size: 17))
                        }.padding(.horizontal,30)
                      Divider()
                            .frame(width:  270)
                            .background(Color.black)
                    }
                    VStack{
                        HStack{
                            DatePicker(
                                "Birthd Date",
                                selection: $date,
                                displayedComponents: [.date]
                            )
                            .font(.system(size: 17))
                        }.padding(.horizontal,30)
                     Divider()
                            .frame(width:  270)
                            .background(Color.black)
                    }
                    VStack{
                        HStack{
                            Text("Email")
                                .font(.system(size: 17))
                            TextField("Type your Email", text: $Email).modifier(ClearButton(text: $Email))
                            
                        }.padding(.horizontal,30)
                        Divider()
                            .frame(width:  270)
                            .background(Color.black)
                    }
                    VStack{
                        HStack{
                            Text("Adress")
                                .font(.system(size: 17))
                            TextField("Type your Adress", text: $Adress).modifier(ClearButton(text: $Adress))
                        }.padding(.horizontal,30)
                       Divider()
                            .frame(width:  270)
                            .background(Color.black)
                    }
                    .padding(.vertical)
                    //login button
                    NavigationLink(destination: SubmitNotify(showingVolunteerSheet:$showingVolunteerSheet), label:{
                        Text("Submit")
                            .frame(width:281 , height:41 )
                            .foregroundColor(.white)
                            .background(Color("ourBlue"))
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                            .padding(.bottom,40)
                        
                        
                        
                    })
                }
          }
       }
    }
    
}

struct ClearButton: ViewModifier
{
@Binding var text: String

public func body(content: Content) -> some View
{
    ZStack(alignment: .trailing)
    {
        content

        if !text.isEmpty
        {
            Button(action:
            {
                self.text = ""
            })
            {
                Image(systemName: "x.circle.fill")
                    .foregroundColor(Color(UIColor.opaqueSeparator))
            }
            .padding(.trailing, 8)
        }
    }
}
}




struct VolunteerRegister_Previews: PreviewProvider {
   static var previews: some View {
        VolunteerRegister(showingVolunteerSheet: .constant(true))
  }
}
