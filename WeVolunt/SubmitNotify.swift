//
//  SubmitNotify.swift
//  WeVolunt
//
//  Created by roba on 06/12/2022.
//

import SwiftUI

struct SubmitNotify: View {
    @Binding var showingVolunteerSheet: Bool
    var body: some View {
        VStack{
                  ZStack{
                      VStack{
                          Image(systemName: "checkmark.circle")
                              .font(.system(size: 60))
                              .foregroundColor(Color("ourBlue"))
                          //  .offset(y:220)
                          // .offset(x:161)
                              .padding(.bottom,10)
                          
                          
                          Text("Thank you")
                          
                              .font(.system(size: 30 , weight: .bold))
                              .multilineTextAlignment(.center)
                              .padding(.bottom,48)
                              .foregroundColor(Color("ourBlue"))
                          
                         // Text("You can check the status \n from your Profile")
                          Text("You can check the status")
                              .font(.system(size: 18, weight: .regular))
                              .foregroundColor(Color("volunteerFont"))
                              .multilineTextAlignment(.center)
                          Text("from your Profile")
                              .font(.system(size: 18, weight: .regular))
                              .foregroundColor(Color("volunteerFont"))
                              .multilineTextAlignment(.center)
                           //   .padding(.bottom,132)
                          //  .padding(.trailing,55)
                          //    .padding(.leading,55)
                          //  .padding(.horizontal,30)
                          
                          
                      }
                  }
                  Button("Ok"){
                      showingVolunteerSheet.toggle()
                  }
                  .frame(width:281 , height:41 )
                  .foregroundColor(.white)
                  .background(Color("ourBlue"))
                  .cornerRadius(8)
                  .fontWeight(.semibold)
                  .padding(.bottom,53)
                  .padding(.top,100)
              }
          }
      }


struct SubmitNotify_Previews: PreviewProvider {
    @Binding var showingVolunteerSheet: Bool
    static var previews: some View {
        SubmitNotify(showingVolunteerSheet: .constant(true))
    }
}
