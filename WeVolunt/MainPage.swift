//
//  MainPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI
import CloudKit

struct MainPage: View {
    @State var showingVolunteerSheet = false
    @State var recommendations = false
    @State private var searchText = ""
    // var categoriesList: [categories]
  //  @StateObject var categories : categories  //create object
    //@State var volunteersList: [Volunteer]
    
    @StateObject var volunteerViewModel : VolunteerViewModel = VolunteerViewModel()  //create object volunteer....
   /*/ init (volunteerViewModel : VolunteerViewModel){
        _volunteerViewModel = StateObject(wrappedValue: volunteerViewModel) //call the object
    }*/
    
    let columns = [GridItem(.flexible())
    ]
    let rows = [GridItem(.flexible())]
       
    
    var body: some View {
        //the navigation view might be removed from here later, but for now im keeping it so we can see it in the preview
        NavigationView(){
            VStack{
                
                
                backgroundShape()
                    .frame(width: 534,height: 253)
                    .frame(height: 10)
                    .foregroundStyle(LinearGradient(colors: [ .blue.opacity(0.3),Color("ourBlue"),],
                                                    startPoint: .topLeading, endPoint: .bottomTrailing))
                    .offset(y:-100)
                
                // display the recommendationns based on selected interests
                if(recommendations == false){
                    Text("Just for you")
                    
                    //    .padding(.top, 50.0)
                        .frame(maxWidth:365, alignment: .leading)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ourBlue"))
                        .padding(.vertical)
                    
                 //   to view the recommended volunteers
                    LazyVGrid(columns: columns, spacing: 0) {
                        ScrollView(.horizontal){
                            LazyHGrid(rows: rows, spacing: 0) {
                                ForEach(volunteerViewModel.listVolunteerOpps) {listVol in
                                 //   recommendVolunteerCard(listVol)
                                   recommendVolunteerCard(volunteerList: listVol)
                                }
                                .padding(.horizontal)
                            }
                            
                        }
                    }

                }
                
                
                // *** START PAGE CONTENT ***
                Text("All Categories")
                
                    .frame(maxWidth:365, alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ourBlue"))
                    .padding(.vertical)
                    .searchable(text: $searchText, placement:.automatic, prompt: "Searcah for categories" )

                //**** STARTING CATEGORIES: *****
                
                //lazy grid
                ScrollView(.vertical){
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(searchResults) { eachCategory in
                            //categoryRow(volunteersList: volunteersList, showingVolunteerSheet: $showingVolunteerSheet , eachCategory:eachCategory)
                            categoryRow(showingVolunteerSheet: $showingVolunteerSheet, eachCategory: eachCategory)
                           
                        }
                    }
                }
                //.frame(width: CGFloat(481),height: .infinity)
                // **** END OF CATEGORIES *****
                
                
            }
            
            
            .toolbar{
                NavigationLink(destination: ProfilePage(), label:{
                    Label("Profile", systemImage: "person.circle")
                        .foregroundColor(.white)
                })
                
                .navigationBarTitle("Explore", displayMode: .inline)
              
            }
         //   .searchable(text: $searchText, placement:.automatic, prompt: "Searcah for categories" )
     
        }.onAppear{
            volunteerViewModel.fetchProfile()
        }
        
        .accentColor(.white)
        .navigationBarBackButtonHidden(true)
        
    }
    
    var searchResults: [categories] {
        if searchText.isEmpty {
            return categoriesList
        } else {
            return categoriesList.filter { $0.name.contains(searchText) }
        }
    }
    
}


//each category row
struct categoryRow: View {
    
//    
    @StateObject var volunteerViewModel: VolunteerViewModel = VolunteerViewModel()  //create object volunteer
//   // var volunteersList: [Volunteer]
    
    @Binding var showingVolunteerSheet : Bool
    var eachCategory : categories
    let rows = [
        GridItem(.flexible())
    ]
    var body: some View{
      //  ForEach(volunteerViewModel.listVolunteerOpps){list in
          
            Text(eachCategory.name)
            //Text(list.VolunteerCategories)
                .frame(maxWidth:350, alignment: .leading)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("ourOrange"))
        // }
        //category content
        VStack (spacing : 20){
            ScrollView(.horizontal){


                LazyHGrid(rows: rows, spacing: 20) {
                    
                    ForEach(volunteerViewModel.listVolunteerOpps.filter { $0.VolunteerCategories.contains(eachCategory.name)}) {listVol in
                            volunteerCard(eachVol: listVol)

                        }
                
                    
                }.padding()

            }.onAppear{
                volunteerViewModel.fetchProfile()
        }
        }
  
        
    }
}



//background header shape
struct backgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49189*width, y: 0.95231*height))
        path.addCurve(to: CGPoint(x: 1.06876*width, y: 1.06283*height), control1: CGPoint(x: 0.72455*width, y: 0.95231*height), control2: CGPoint(x: 0.92777*width, y: 0.87629*height))
        path.addCurve(to: CGPoint(x: 1.27436*width, y: 1.49276*height), control1: CGPoint(x: 1.1975*width, y: 1.23317*height), control2: CGPoint(x: 1.27436*width, y: 1.67715*height))
        path.addCurve(to: CGPoint(x: 1.12143*width, y: 0.23024*height), control1: CGPoint(x: 1.27436*width, y: 1.30098*height), control2: CGPoint(x: 1.26068*width, y: 0.63378*height))
        path.addCurve(to: CGPoint(x: 0.48758*width, y: -0.32353*height), control1: CGPoint(x: 0.98017*width, y: -0.17913*height), control2: CGPoint(x: 0.71174*width, y: -0.32353*height))
        path.addCurve(to: CGPoint(x: -0.09487*width, y: 0.06853*height), control1: CGPoint(x: 0.04246*width, y: -0.32353*height), control2: CGPoint(x: -0.09487*width, y: -0.3178*height))
        path.addCurve(to: CGPoint(x: 0.13003*width, y: 0.79606*height), control1: CGPoint(x: -0.09487*width, y: 0.30711*height), control2: CGPoint(x: -0.01614*width, y: 0.61606*height))
        path.addCurve(to: CGPoint(x: 0.49189*width, y: 0.95231*height), control1: CGPoint(x: 0.22054*width, y: 0.90753*height), control2: CGPoint(x: 0.32167*width, y: 0.95231*height))
        path.closeSubpath()
        return path
    }
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        
        MainPage()
    }
}

