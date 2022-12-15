//
//  volunteerModelView.swift
//  WeVolunt
//
//  Created by roba on 15/12/2022.
//

import Foundation

class volunteerModelView : ObservableObject {
    
    @Published var volunteer : Volunteer
  //  @Published var volunteerList : [Volunteer]
    
    init() {
      volunteer = Volunteer(volunteerName: "sample", volunteerImage: "", orgnizationName: "", orgnizationImage: "", volunteerDate: "", volunteerDescribe: "", volunteerLocation: "", volunteerRequirement: "", volunteerCategory: "", volunteerHours: 0)
    }
    
    
//  @Published var volunteerList = [
//        Volunteer(volunteerName: "Transfer of tree seedlings", volunteerImage: "", orgnizationName: "The Charitable Association for Facilitating Marriage and Family Care", orgnizationImage: "", volunteerDate: "15 - 17 December", volunteerDescribe: "Transfer of seedlings according to type and size to the Marriage Facilitation Association in Al-Ahsa", volunteerLocation: "Al-Ahsa", volunteerRequirement: "", volunteerCategory: "", volunteerHours: 9),
//        Volunteer(volunteerName: "Water distribution next to the Holy Mosque of Mecca", volunteerImage: "", orgnizationName: "Ikram Association for the preservation of food", orgnizationImage: "", volunteerDate: "", volunteerDescribe: "Participation in the distribution of water next to the Haram in the areas of Ajyad and Al-Masfala", volunteerLocation: "Makkah", volunteerRequirement: "", volunteerCategory: "Religious", volunteerHours: 3)
//        
//        
//    ]
    
    
    
}

