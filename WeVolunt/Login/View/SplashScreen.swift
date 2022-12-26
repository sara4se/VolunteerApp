//
//  SplashScreen.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI
import CloudKit

extension Color {
    static let skipColor = Color("SkipColor")
    static let darkBlue = Color("DarkBlue")
    static let lightBlue = Color("LightBlue")
    static let babyBlue = Color("BabyBlue")
    static let DarkOrange = Color("DarkOrange")
    static let LightOrange = Color("LightOrange")
    static let backgroundColor = Color("BackgroundColor")
    
}

struct SplashScreen: View {
    
    @State var tapLocation: CGPoint?
    @State private var isActive = false
    var body: some View {
        ZStack{
            
            if self.isActive{
                InterestPage()
            }
            else{
                VStack{
                    
                    ZStack(alignment: .topLeading){
                        MyCustomShape()
                        
                        .fill(.linearGradient(colors: [Color.darkBlue, Color.lightBlue,Color.babyBlue], startPoint: .leading, endPoint: .trailing)).frame(width:CGFloat( 249.56),height:CGFloat(239.21))}.padding(.trailing,200).padding(.top,10).ignoresSafeArea()
                    Spacer()
                    Image("Logo").resizable().frame(width: 162.45, height: 146.15)
                    HStack{
                        Text("WE").foregroundColor(.darkBlue)   .font(.custom("SF-Compact", size: 40)).bold()
                        Text("VOLUNT").foregroundColor(Color("ourOrange"))   .font(.custom("SF-Compact", size: 40)).bold().padding(.horizontal,-10)
                    }
                    Spacer()
                    ZStack{
                        MyCustomShape().rotation(Angle(degrees: 180)).fill(.linearGradient(colors: [Color.darkBlue, Color.lightBlue,Color.babyBlue], startPoint: .leading, endPoint: .trailing)).frame(width:CGFloat( 299.56),height:CGFloat(239.21))}.padding(.leading,200).padding(.top,10).ignoresSafeArea()
                    
                    
                    
                }.ignoresSafeArea()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation (.easeOut){
                    self.isActive = true
                }
            }
        }
    }
}
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
//shapes for background
struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.03958*width, y: height))
        path.addCurve(to: CGPoint(x: 0.65295*width, y: 0.47847*height), control1: CGPoint(x: 0.31365*width, y: height), control2: CGPoint(x: 0.65295*width, y: 0.78368*height))
        path.addCurve(to: CGPoint(x: 0.88868*width, y: 0.2823*height), control1: CGPoint(x: 0.65295*width, y: 0.42319*height), control2: CGPoint(x: 0.80304*width, y: 0.35906*height))
        path.addCurve(to: CGPoint(x: 0.99615*width, y: -0.05159*height), control1: CGPoint(x: 0.95218*width, y: 0.22538*height), control2: CGPoint(x: 1.01747*width, y: -0.01804*height))
        path.addCurve(to: CGPoint(x: -0.03958*width, y: -0.10526*height), control1: CGPoint(x: 0.88744*width, y: -0.22268*height), control2: CGPoint(x: 0.20224*width, y: -0.10526*height))
        return path
    }
}
