//
//  InterestPage.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct InterestPage: View {
    
    var body: some View {
        NavigationView(){
            ZStack{
                // *** background should be here ***
                VStack{
                    // *** START PAGE CONTENT ***
                    Text("This is interest page")
                    
                    //next button
                    NavigationLink(destination: MainPage(categoriesList: categoriesList), label:{
                        Text("Next")
                            .frame(width:307 , height:44 )
                            .foregroundColor(.white)
                            .background(Color(.blue))
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                    })
                    
                    .toolbar{
                        
                        NavigationLink(destination: MainPage(categoriesList: categoriesList), label:{
                            Text("Skip")
                            
                        })
                    }
                }
            }
        }
    }
}

struct InterestPage_Previews: PreviewProvider {
    static var previews: some View {
        InterestPage()
    }
}
