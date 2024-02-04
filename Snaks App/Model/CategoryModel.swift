//
//  CategoryModel.swift
//  Snaks App
//
//  Created by ramia n on 03/04/1445 AH.
//

import Foundation

struct CategoryModel:Identifiable,Hashable{
    let id = UUID()
    let icon :String
    let title:String
}

let categoriesList:[CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "waffels", title: "Waffels"),
    CategoryModel(icon: "toffee", title: "Toffee"),
    
]
