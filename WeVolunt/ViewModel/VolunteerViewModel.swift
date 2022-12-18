//
//  volunteerViewModel.swift
//  WeVolunt
//
//  Created by Remaz Abdulkareem Alghamdi on 16/12/2022.
//

import Foundation
import CloudKit

class VolunteerViewModel : ObservableObject {
   // private var database : CKDatabase
    private var container : CKContainer = CKContainer.default()
     
    @Published var listVolunteerOpps: [VolunteerOpp] = []
     
   
    init( container: CKContainer, listVolunteerOpps: [VolunteerOpp]) {
      //  self.database = database
        self.container = container
        self.listVolunteerOpps = listVolunteerOpps
    }
    init() {
    
    }
    
func fetchProfile(){
    let container = CKContainer(identifier: "iCloud.twq.WeVoluntApp")
    let predicate = NSPredicate(value: true)
    let query = CKQuery(recordType: "Volunteer", predicate: predicate)
    let operations = CKQueryOperation(query: query)
    operations.recordMatchedBlock = {  recordId, result in
        
        switch result {
        case .success( let records):
            let VolunteerOpp = VolunteerOpp(record: records)
            self.listVolunteerOpps.append(VolunteerOpp)
            
        case .failure( let error):
            print(error.localizedDescription)
        }
        
    }
    
    container.publicCloudDatabase.add(operations)
}
    
//    func savedItem( ){ //object
//         
//        let record = CKRecord(recordType: "Volunteer")
//        let listvolunteerOpps = VolunteerOpp (record : record) //create object and send the records
//        record.setValuesForKeys(listvolunteerOpps.toDictionary())
//        
//        CKDatabase.save(CKDatabase).save(record){ newRecord, error in
//            if let error = error{
//                print(error)
//            }else{
//                if let _ = newRecord{
//                    print("SAVED")
//                }
//            }
//            
//        }
//    }

}

 
