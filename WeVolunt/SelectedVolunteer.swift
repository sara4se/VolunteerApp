//
//  SelectedVolunteer.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI
import CloudKit

struct SelectedVolunteer: View {
    
    @Binding var showingVolunteerSheet: Bool
    @State var volunteerList: VolunteerOpp
    @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel()  //create object
    var body: some View {
         
        NavigationView(){
            ZStack{
                // *** background should be here ***
                ScrollView(.vertical){
                    LazyVStack{
                        VStack{
                            Button {
                                showingVolunteerSheet.toggle()
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color("ourOrange"))
                            }
                            .padding(.trailing, 250)
                            .padding(.top, 20)
                            //
                            Spacer()
                            
                            // *** START PAGE CONTENT ***
                            
                           // ForEach(volunteerViewModel.listVolunteerOpps){list in
                                
                                Text(volunteerList.VolunteerTitle)
                                    .font(.system(size: 24,weight: .bold))
                                    .foregroundColor(Color("ourBlue"))
                                    .multilineTextAlignment(.leading)
                                //.fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom,3)
                                
                                
                            Text(volunteerList.OrganizationName)
                                    .font(.system(size: 19 , weight: .regular))
                                //  .multilineTextAlignment(.leading)
                                    .padding(.trailing,60)
                                    .foregroundColor(Color("ourOrange"))
                                
                                
                               // Image("volunteerImage")
                            if let url = volunteerList.ImageURL, let data = try? Data(contentsOf: url),
                               let image = UIImage(data: data){
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 290,height: 131)
                                    .cornerRadius(26)
                                    .padding(.bottom,3)
                            }
                                //  ScrollView(.vertical){
                                //  LazyVStack(spacing: 10)
                                //  LazyVStack{
                            Text(volunteerList.Description)
                                    .foregroundColor(Color("volunteerFont"))
                                    .padding(.top,16)
                                // .padding(.leading,40)
                                // .padding(.trailing,60)
                                    .padding(.bottom,22)
                                // .padding(.bottom,8)
                                //.padding(.horizontal,30)
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "calendar")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color("ourOrange"))
                                        // .padding(.leading,-75)
                                        
                                        Text(volunteerList.Date)
                                            .foregroundColor(Color("volunteerFont"))
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading,12)
                                    }.padding(.bottom,8)
                                    
                                    HStack{
                                        Image(systemName: "mappin.and.ellipse")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color("ourOrange"))
                                        //  .padding(.leading,-90)
                                        
                                        Text(volunteerList.Location)
                                            .foregroundColor(Color("volunteerFont"))
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading,13)
                                    }.padding(.bottom,8)
                                    
                                    HStack{
                                        Image(systemName: "clock")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color("ourOrange"))
                                        //  .padding(.leading,-90)
                                            .padding(.bottom,29)
                                        
                                        Text(String(volunteerList.VolunteeringHours))
                                            .foregroundColor(Color("volunteerFont"))
                                            .padding(.bottom,29)
                                            .padding(.leading,12)
                                        
                                    }
                                    
                                    
                                }.padding(.trailing, 100)
                            
                                Text ("Requirements:")
                                    .font(.system(size: 21, weight: .medium))
                                    .foregroundColor(Color("ourBlue"))
                                //.multilineTextAlignment(.leading)
                                //.padding(.leading,23)
                                    .padding(.trailing,150)
                                    .padding(.leading,25)
                                //.padding(.leading, -30.0)
                                    .padding(.bottom,16)
                                
                            Text(volunteerList.Requirement)
                                    .font(.system(size: 18,weight: .regular))
                                    .foregroundColor(Color("volunteerFont"))
                                    .padding(.bottom,24)
                                    .padding(.leading,27)
                                
                                
                           // }
                                                       
                            //enroll button
                            Button{
                            }label: {
                                NavigationLink(destination: mustloginpage(showingVolunteerSheet:$showingVolunteerSheet), label:{
                                    Text("Enroll")
                                        .frame(width:281 , height:41 )
                                        .foregroundColor(.white)
                                        .background(Color("ourBlue"))
                                        .cornerRadius(8)
                                        .fontWeight(.semibold)
                                    
                                })
                            }
                            
                                        .padding()

                           
                           // Spacer()
                        } .onAppear{
                            volunteerViewModel.fetchProfile()
                        }
                    }
                    
                }
            }
            .padding(.bottom)
        }
    }
}

/*struct SelectedVolunteer_Previews: PreviewProvider {
    @Binding var showingVolunteerSheet: Bool
    static var previews: some View {
        SelectedVolunteer(showingVolunteerSheet: .constant(true))
    }
}*/
