//
//  SubmitNotify.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct SubmitNotify: View {
    
    var body: some View {
        VStack{
            // *** START PAGE CONTENT ***
            Text("this is submit notify page")
                .padding()
            Button("Ok"){
            }
            .frame(width:307 , height:44 )
            .foregroundColor(.white)
            .background(Color(.blue))
            .cornerRadius(8)
            .fontWeight(.semibold)
        }
    }
}

struct SubmitNotify_Previews: PreviewProvider {
    static var previews: some View {
        SubmitNotify()
    }
}
