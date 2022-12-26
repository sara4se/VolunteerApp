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
    @State var volunteerSelected: VolunteerOpp
    @State var volunteerSelectedList: [VolunteerOpp] = []
   @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel()  //create object
    var body: some View {
        
        NavigationView(){
            ZStack{
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
                            Spacer()
                            VStack(alignment: .leading){
                                Text(volunteerSelected.VolunteerTitle)
                                    .font(.system(size: 24,weight: .bold))
                                    .foregroundColor(Color("ourBlue"))
                                    .padding(.bottom,3)
                                Text(volunteerSelected.OrganizationName)
                                    .font(.system(size: 19 , weight: .regular))
                                .foregroundColor(Color("ourOrange"))}
                            if let url = volunteerSelected.ImageURL, let data = try? Data(contentsOf: url),
                               let image = UIImage(data: data){
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 290,height: 131)
                                    .cornerRadius(26)
                                .padding(.bottom,3)}
                            Text(volunteerSelected.Description)
                                .foregroundColor(Color("volunteerFont"))
                                .padding(.leading,27)
                                .padding(.bottom,22)
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "calendar")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color("ourOrange"))
                                    Text(volunteerSelected.Date)
                                        .foregroundColor(Color("volunteerFont"))
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading,12)
                                }.padding(.bottom,8)
                                
                                HStack{
                                    Image(systemName: "mappin.and.ellipse")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color("ourOrange"))
                                    Text(volunteerSelected.Location)
                                        .foregroundColor(Color("volunteerFont"))
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading,13)
                                }.padding(.bottom,8)
                                
                                HStack{
                                    Image(systemName: "clock")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color("ourOrange"))
                                        .padding(.bottom,29)
                                    
                                    Text(String(volunteerSelected.VolunteeringHours) + (" Hours"))
                                        .foregroundColor(Color("volunteerFont"))
                                        .padding(.bottom,29)
                                        .padding(.leading,12)
                                    
                                }
                            }.padding(.trailing, 60)
                            Text ("Requirements:")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color("ourBlue"))
                                .padding(.trailing,150)
                                .padding(.leading,25)
                                .padding(.bottom,16)
                            
                            Text(volunteerSelected.Requirement)
                                .font(.system(size: 18,weight: .regular))
                                .foregroundColor(Color("volunteerFont"))
                                .padding(.bottom,24)
                                .padding(.leading,27)
                            
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
                            }.padding()
                        }.onAppear{
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
