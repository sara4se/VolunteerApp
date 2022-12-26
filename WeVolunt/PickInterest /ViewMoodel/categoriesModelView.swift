//
//  categoriesModelView.swift
//  WeVolunt
//
//  Created by roba on 08/12/2022.
//

import Foundation

class categoriesModelView : ObservableObject{
    @Published var categories : categories
    init(categories: categories) {
        self.categories = categories
    }
}
