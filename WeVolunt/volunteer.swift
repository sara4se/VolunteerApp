//
//  volunteer.swift
//  WeVolunt
//
//  Created by roba on 15/12/2022.
//

import Foundation

struct Volunteer : Identifiable{
    
    var id = UUID()
    var volunteerName: String
    var volunteerImage : String
    var orgnizationName: String
    var orgnizationImage: String
    var volunteerDate: String
    var volunteerDescribe: String
    var volunteerLocation: String
    var volunteerRequirement: String
    var volunteerCategory: String
    var volunteerHours: Int
    
}

var volunteerList = [
    Volunteer(volunteerName: "Transfer of tree seedlings", volunteerImage: "", orgnizationName: "The Charitable Association for Facilitating Marriage and Family Care", orgnizationImage: "", volunteerDate: "15 - 17 December", volunteerDescribe: "Transfer of seedlings according to type and size to the Marriage Facilitation Association in Al-Ahsa", volunteerLocation: "Al-Ahsa", volunteerRequirement: "", volunteerCategory: "Environmental", volunteerHours: 9),
    Volunteer(volunteerName: "Water distribution next to the Holy Mosque of Mecca", volunteerImage: "", orgnizationName: "Ikram Association for the preservation of food", orgnizationImage: "", volunteerDate: "", volunteerDescribe: "Participation in the distribution of water next to the Haram in the areas of Ajyad and Al-Masfala", volunteerLocation: "Makkah", volunteerRequirement: "", volunteerCategory: "Religious", volunteerHours: 3),
    Volunteer(volunteerName: "Producer of children's entertainment programmes", volunteerImage: "", orgnizationName: "Social Development Center ", orgnizationImage: "", volunteerDate: "14 December", volunteerDescribe: "Participation in the distribution of water next to the Haram in the areas of Ajyad and Al-Masfala", volunteerLocation: "Hafar Al-Batin", volunteerRequirement: "", volunteerCategory: "Entertainment", volunteerHours: 0),
    Volunteer(volunteerName: "Producer of children's entertainment programmes", volunteerImage: "", orgnizationName: "Social Development Center ", orgnizationImage: "", volunteerDate: "14 December", volunteerDescribe: "Participation in the distribution of water next to the Haram in the areas of Ajyad and Al-Masfala", volunteerLocation: "Hafar Al-Batin", volunteerRequirement: "", volunteerCategory: "Environmental", volunteerHours: 0)
]

