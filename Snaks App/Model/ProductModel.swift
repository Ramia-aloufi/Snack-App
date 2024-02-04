//
//  ProductModel.swift
//  Snaks App
//
//  Created by ramia n on 03/04/1445 AH.
//

import Foundation
import SwiftUI

struct ProductModel:Identifiable{
    let id = UUID()
    let name :String
    let category:String
    let image:String
    let price:Int
    let color:Color
}

let productsList:[ProductModel] = [
    ProductModel(name: "Good Source", category: "Choco", image: "img1", price: 8, color: .pink),
    ProductModel(name: "Unreal Muffnins", category: "Choco", image: "img1", price: 4, color: .yellow),
    ProductModel(name: "Twister Chips", category: "Chips", image: "img1", price: 5, color: .red),
    ProductModel(name: "Twister Chips", category: "Chips", image: "img1", price: 6, color: .green),
    ProductModel(name: "Regular Nature", category: "Chips", image: "img1", price: 3, color: .blue),
    ProductModel(name: "Dark Russet", category: "Chips", image: "img1", price: 5, color: .brown),
    ProductModel(name: "Smithis Chips", category: "Chips", image: "img1", price: 6, color: .orange),
    ProductModel(name: "Deep River", category: "Chips", image: "img1", price: 7, color: .purple),
    
]
