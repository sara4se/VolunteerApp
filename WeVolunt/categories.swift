//
//  categories.swift
//  WeVolunt
//
//  Created by roba on 08/12/2022.
//

import Foundation

// A struct to store exactly one category
class categories: Identifiable , ObservableObject {
    let id = UUID()
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    init() {
        
    }
}
 var categoriesList = [
    categories(name: "Environmental"),
    categories(name: "Religious"),
    categories(name: "Entertainment"),
    categories(name: "Health"),
    categories(name: "Education"),
    categories(name: "Social"),
    categories(name: "Technical"),
    categories(name: "Sports")
]
    


