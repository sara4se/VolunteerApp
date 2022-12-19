//
//  VolunteerOpp..swift
//  WeVolunt
//
//  Created by Remaz Abdulkareem Alghamdi on 15/12/2022.
//

import Foundation
import CloudKit
import UIKit
import SwiftUI

//Model
struct VolunteerOpp: Identifiable {
    
    let id: CKRecord.ID
    let VolunteerCategories : String
    let VolunteerTitle : String
    let OrganizationName : String
    let Description : String
    let Date : String
    let Location : String
    let VolunteeringHours : Int
    let Requirement : String
 //   let VolunteerImage : CKAsset
   
    
   
    init(record:CKRecord) {
        
        self.id = record.recordID
        self.VolunteerCategories = record["VolunteerCategories"] as? String ?? "N/A"
        self.VolunteerTitle = record["VolunteerTitle"] as? String ?? "N/A"
        self.OrganizationName = record["OrganizationName"] as? String ?? "N/A"
        self.Description = record["Description"] as? String ?? "N/A"
        self.Date = record["Date"] as? String ?? "N/A"
        self.Location = record["Location"] as? String ?? "N/A"
        self.VolunteeringHours = record["VolunteeringHours"] as? Int ?? 0
        self.Requirement = record["Requirement"] as? String ?? "N/A"
     //   self.VolunteerImage = record["VolunteerImage"] as? CKAsset ?? Image("Logo")
    }
//    ? UIImage(named:"Logo") as! CKAsset
    func toDictionary()->[String : Any]{
        return ["VolunteerTitle" : VolunteerTitle]
    }
    
}
