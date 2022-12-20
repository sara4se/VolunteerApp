//
//  ProfilePage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct ProfilePage: View {
    @State var showingVolunteerSheet = false
    @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel()  //create object
    @State var BWitSheet : Int = 0
    let columns = [GridItem(.flexible())]
    let rows = [GridItem(.flexible())]
    
    
    var body: some View {
        
        ZStack{
            VStack {
                ZStack(alignment: .top){
                    MyCustomShape2().fill(.linearGradient(colors: [Color.darkBlue, Color.lightBlue,Color.babyBlue], startPoint: .leading, endPoint: .trailing)).frame(width: CGFloat(400),height: CGFloat(400)).ignoresSafeArea()
                    MyCustomShape3().padding(.bottom,230).padding(.leading,25).foregroundColor(.backgroundColor).frame(width: CGFloat(400),height: CGFloat(400)).ignoresSafeArea()
                }
            }.padding(.bottom,370)
            VStack (alignment: .center){
                HStack {
                    Text("Hello Ahmad").font(Font.custom("SF-Compact", size: CGFloat(25))).foregroundColor(.white)
                }.frame(width: .infinity,height: 2,alignment: .leading).padding(.trailing,210)
                
                //.padding(.trailing,150).padding(.bottom,100)
                ZStack{
                    Circle()
                        .strokeBorder(.linearGradient(colors: [Color.DarkOrange,Color.LightOrange,Color.LightOrange], startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 30)
                        .background(Circle().fill(Color.backgroundColor))
                        .frame(width: 202, height: 198)
                        .overlay {
                            HStack{
                                Text("17").font(Font.custom("SF-Compact", size: CGFloat(63))).foregroundColor(Color.darkBlue).frame(alignment : .center)
                                Text("hrs").font(Font.custom("SF-Compact", size: CGFloat(16))).foregroundColor(Color.darkBlue).frame(width: 23,height: 50,alignment : .bottomTrailing)
                            }
                        }
                }.frame(width: .infinity ,height: 2,alignment: .leading).padding(.top,100)
                
                Spacer()
                
                HStack (alignment: .top){
                    Text("Total hours of volunteer").font(Font.custom("SF-Compact", size: CGFloat(25))).foregroundColor(Color.skipColor)
                }.frame(width: .infinity,height: 50,alignment: .center).padding(.top,20)
                
                Divider().frame(width: 300,height: 1)
                
                HStack (alignment:.top){
                    Text("Enrolld in").font(Font.custom("SF-Compact", size: CGFloat(25))).fontWeight(.bold).foregroundColor(Color.darkBlue).multilineTextAlignment(.leading)
                }.frame(width: .infinity,height: 50,alignment: .leading).padding(.top,20).padding(.trailing,240)
                
                LazyVGrid(columns: columns, spacing: 0) {
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, spacing: 0) {
                            ForEach(volunteerViewModel.listVolunteerOpps) {listVol in
                                //   recommendVolunteerCard(listVol)
                                recommendVolunteerCard(BWitSheet: $BWitSheet, volunteerList: listVol)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                }.frame(width: 360,height:233,alignment: .bottom).onAppear{
                    volunteerViewModel.fetchProfile()
                }
                Spacer()
            }.padding(.top,140)
            
        }
        .background(Color.backgroundColor).ignoresSafeArea()
            //.toolbar{
            
          
//            ToolbarItem(placement: .principal) { // <3>
//                VStack {
//                    Text("Profile").font(.subheadline).foregroundColor(.white)
//
//                }
            //}
        
  //      }
            .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
struct MyCustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: -0.16923*width, y: -0.24124*height, width: 1.35641*width, height: 1.24124*height))
        return path
    }
}
struct MyCustomShape3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: -0.10256*width, y: 1.54974*height, width: 1.14359*width, height: height))
        return path
    }
}
