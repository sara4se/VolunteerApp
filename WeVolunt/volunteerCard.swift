//
//  volunteerCard.swift
//  WeVolunt
//
//  Created by roba on 08/12/2022.
//

import SwiftUI
import CloudKit

//this is the recommendation card
struct recommendVolunteerCard: View {
  //  @StateObject var volunteers = volunteerModelView()
  // @StateObject var  volunteerList = [volunteers.volunteerList]
    @Binding var BWitSheet : Int
   
    @State var volunteerList: VolunteerOpp
    @State var showingVolunteerSheet = false
   // var eachVol: Volunteer
    
    @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel() //create object volunteer....
   /*/ init (volunteerViewModel : VolunteerViewModel){
        _volunteerViewModel = StateObject(wrappedValue: volunteerViewModel) //call the object
    }*/
    
    var body: some View {
     
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.gray), lineWidth: 0.5)
                        .frame(width:148,height:203)
                        .overlay(
                            VStack (alignment: .center){
                                
                                ZStack{
                                    Image("volunteerImage")
                                        .resizable()
                                        .frame(width: 148, height: 96)
                                        .shadow(radius: 1)
                                    
                                    //this is from the costumise shape and view extention
                                        .cornerRadius(20, corners: [.topLeft, .topRight])
                                    Image("volunteerCompany")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 37, height: 37)
                                        .offset(x:-50, y:50)
                                        .shadow(radius: 1)
                                }
                                VStack {
                                    
                                    //volunteer Title
                                    //Text(eachVol.volunteerName)
                                    
                                    Text(volunteerList.VolunteerTitle)
                                            .foregroundColor(Color("volunteerFont"))
                                            .padding(.top)
                                        // seperater line
                                        Rectangle()
                                            .fill(Color("volunteerFont"))
                                            .frame(height:0.5)
                                    
                                    
                                     
                                    
                                    HStack(alignment: .center){
                                        
                                        Image(systemName: "mappin.and.ellipse")
                                            .foregroundColor(Color("ourOrange"))
                                        Text(volunteerList.Location)
                                            .font(.callout)
                                            .foregroundColor(Color("volunteerFont"))
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color("ourOrange"))
                                        Text(volunteerList.Date)
                                            .font(.callout)
                                            .foregroundColor(Color("volunteerFont"))
                                        
                                        
                                    }
                                        
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            
                            
                        )
                    
                    
                    
                        .onTapGesture(perform: {
                            showingVolunteerSheet.toggle()
                            
                        })
                    
                    //the popup window will show
                        .fullScreenCover(isPresented: $showingVolunteerSheet){
                            ZStack(alignment: .center){
                                // the full background
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width:.infinity,height:.infinity).ignoresSafeArea()
                                    .background(Color("BabyBlue"))
                                    .opacity(0.05)
                                
                                //the pop up sheet
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(.white), lineWidth: 0.5)
                                    .frame(width:313,height:563)
                                    .background(.white)
                                    .cornerRadius(25)
                                    .shadow(radius: 2)
                                    .overlay(
                                        VStack{
                                            
                                            if ( BWitSheet == 1){
                                                //content of the pop up window
                                                
                                                SelectedVolunteer(showingVolunteerSheet:$showingVolunteerSheet, volunteerList: volunteerList)
                                                //   .padding(.vertical)
                                                //
                                            }
                                            else{
                                                EnrolledVolunteer(showingVolunteerSheet: $showingVolunteerSheet)
                                            }
                                        }
                                            .frame(width:313,height:563)
                                            .cornerRadius(25)
                                    )
                            }
                            //this will remove the background from full screen
                            .background(BackgroundBlurView().ignoresSafeArea())
                            
                        }
                    
                }
            }
        
    }
        
  //  }
//}

//this is all categories volunteering cards
struct volunteerCard: View {
   // @State var volunteerList: VolunteerOpp
    @State var showingVolunteerSheet = false
    var eachVol: VolunteerOpp
    
    @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel() //create object volunteer....
   // var eachVol: VolunteerOpp
    var body: some View {
        // there should be printing for all the dictionary list item
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.gray), lineWidth: 0.5)
                .frame(width:250,height:94)
                .overlay(
                    
                    //oppurtonity content
                    HStack {
                        Image("volunteerImage")
                            .resizable()
                            .frame(width: 108, height: 94)
                        
                        //this is from the costumise shape and view extention
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            //volunteer Title
                            Text(eachVol.VolunteerTitle)
                                    .foregroundColor(Color("volunteerFont"))
                                
                                // seperater line
                                Rectangle()
                                    .fill(Color("volunteerFont"))
                                    .frame(height:0.5)
                                
                                HStack{
                                    // orgnization logo
                                    Image("volunteerCompany")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 37, height: 37)
                                    VStack{
                                        HStack{
                                            Spacer()
                                            Image(systemName: "mappin.and.ellipse")
                                                .foregroundColor(Color("ourOrange"))
                                            Text(eachVol.Location)
                                                .font(.callout)
                                                .foregroundColor(Color("volunteerFont"))
                                            Spacer()
                                        }
                                        HStack{
                                            Spacer()
                                            Image(systemName: "calendar")
                                                .foregroundColor(Color("ourOrange"))
                                            Text(eachVol.Date)
                                                .font(.callout)
                                                .foregroundColor(Color("volunteerFont"))
                                        }
                                        .padding(.trailing, 5.0)
                                    }
                                }
                            }
                        
                        Spacer()
                    }
                    
                )
            
            
            
                .onTapGesture(perform: {
                    showingVolunteerSheet.toggle()
                    
                })
            
            //the popup window will show
                .fullScreenCover(isPresented: $showingVolunteerSheet){
                    ZStack(alignment: .center){
                        // the full background
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width:.infinity,height:.infinity).ignoresSafeArea()
                           .background(Color("BabyBlue"))
                            .opacity(0.05)
                        
                        //the pop up sheet
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.white), lineWidth: 0.5)
                            .frame(width:313,height:563)
                            .background(.white)
                            .cornerRadius(25)
                            .shadow(radius: 2)
                            .overlay(
                                VStack{
                                    
                                  
                                    //content of the pop up window
                                 
                                    SelectedVolunteer(showingVolunteerSheet:$showingVolunteerSheet, volunteerList: eachVol)
                                     //   .padding(.vertical)
                                    //
                                    
                                }
                                .frame(width:313,height:563)
                                .cornerRadius(25)
                            )
                    }
                    //this will remove the background from full screen
                    .background(BackgroundBlurView().ignoresSafeArea())
                    
                }
            
        }
        
    }
}


//this to make costmizable image corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


//this to create a costume rounded corners for image
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


//this will remove the background from the full screen
struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        //this will make the view blurry
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        //this will change the corner radius of the popup
        view.layer.cornerRadius = 25
        view.layer.opacity = 0.6
        view.clipsToBounds = true
        DispatchQueue.main.async {
            //this will remove the background around the popup
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}


////this is the preview of the page
//struct volunteerCard_Previews: PreviewProvider {
//    @StateObject static var volunteers = volunteerModelView()
//    static var previews: some View {
//       //   volunteerCard()
//        recommendVolunteerCard(volunteerList: volunteerList).environmentObject(volunteers)
//    }
//}
