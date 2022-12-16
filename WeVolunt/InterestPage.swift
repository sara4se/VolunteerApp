//
//  InterestPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct Title : Identifiable {
    var titleStr = ""
    var fontsize = 0
    var id = UUID()
    
    
}

struct InterestPage: View {
    
    
    @StateObject var userSettings : UserSettings = UserSettings(enterdInterstTogle: true, username: "", isPrivate: true, arrayOfSelected: [])
    @State var itemsTitles: [Title] = [Title(titleStr:"Environmental" , fontsize : 60) ,Title(titleStr:"Sports" , fontsize : 40),Title(titleStr:"Social" , fontsize : 40), Title(titleStr:"Religious" , fontsize : 60),Title(titleStr:"Technical" , fontsize : 50),Title(titleStr:"Education" , fontsize : 50),Title(titleStr:"Entertainment" , fontsize : 60) ,Title(titleStr:"Health" , fontsize : 40)]
    
    //  @State var selections: [String] = []
    let layout = [
        GridItem(.adaptive(minimum: 130, maximum: 120))
    ]
    
    @State var selected = 0    // 1
    
    
    var body: some View {
        NavigationView(){
            VStack{
                VStack{
                    Text("Pick your interset").foregroundColor(Color.lightBlue).font(Font.custom("SF-Compact", size: CGFloat(30))).padding(.bottom,30).padding(.trailing,94).padding(.leading,39)
                }
                ScrollView(.horizontal,showsIndicators: true){
                    HStack{
                        ForEach(userSettings.arrayOfSelected, id: \.self) { selectd in
                            Text(selectd).padding(6)
                                .background(Color.skipColor).foregroundColor( Color.white)
                                .cornerRadius(5).animation(Animation.easeIn(duration: 2.0))
                            
                        }
                    }
                }.frame(width: CGFloat(340) ,height:CGFloat(50) ,alignment: .leading)
                
                VStack(spacing: 1){
                    ScrollView(.vertical){
                        LazyVGrid(columns: layout, spacing: 10) {
                            ForEach(self.itemsTitles) { item in
                                MultipleSelectionRow(title: item.titleStr, isSelected: userSettings.arrayOfSelected.contains(item.titleStr) , font: UIFont.systemFont(ofSize:CGFloat(item.fontsize) , weight: .light) ) {
                                    if userSettings.arrayOfSelected.contains(item.titleStr) {
                                        userSettings.arrayOfSelected.removeAll(where: { $0 == item.titleStr })
                                    }
                                    else {
                                        userSettings.arrayOfSelected.append(item.titleStr)
                                        self.itemsTitles.removeAll(where: {$0.id == item.id})
                                        
                                    }
                                }
                            }
                        }
                    }.frame(width: CGFloat(300),height: CGFloat(350),alignment: .leading).padding(.bottom,1).padding(.top,1)
                    
                }.frame(width: CGFloat(300),height: CGFloat(350),alignment: .leading)
                
                
                //next button
                
                VStack{
                    NavigationLink(destination:   MainPage( categoriesList: categoriesList, volunteersList: volunteerList), label:{
                        Text("Next")
                            .frame(width:281 , height:41 )
                            .foregroundColor(.white)
                            .background(Color.darkBlue)
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                    })
                }
                
                .toolbar{
                    
                    NavigationLink(destination:  MainPage( categoriesList: categoriesList, volunteersList: volunteerList), label:{
                        Text("Skip").foregroundColor(Color.skipColor).font(Font.custom("SF-Compact", size: CGFloat(20)))
                        
                    })
                }
            }
        }.background(Color.backgroundColor)
    }
    
    
    
    struct MultipleSelectionRow: View {
        var title: String
        var isSelected: Bool
        
        var font = UIFont.preferredFont(forTextStyle: .body)  // << default !!
        
        var action: () -> Void
        
        @State private var half = false
        @State private var dim = false
        
        var body: some View {
            let size = font.lineHeight * 2.0
            
            Button(action: self.action,
                   label: {
                HStack {
                    Text(self.title)
                    if self.isSelected {
                    }
                }
            }).frame(width: size, height: 49)
                .foregroundColor(self.isSelected ? Color.white : Color.lightBlue)
                .background(self.isSelected ? Color.skipColor : Color.backgroundColor)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.blue, lineWidth: 1)
                )
                .scaleEffect(half ? 1.0  : 0.5)
                .opacity(dim ? 1.0 : 0.2 )
                .animation(Animation.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                        self.dim.toggle()
                        self.half.toggle()
                    }
                                                  
                                                  
                    )}
            
        }
    }
}
struct InterestPage_Previews: PreviewProvider {
    static var previews: some View {
        InterestPage()
    }
}
