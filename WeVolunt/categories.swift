//
//  categories.swift
//  WeVolunt
//
//  Created by roba on 08/12/2022.
//

import Foundation

// A struct to store exactly one category
struct categories: Identifiable {
    let id = UUID()
    let name: String
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



