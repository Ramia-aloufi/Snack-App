//
//  Home.swift
//  Snaks App
//
//  Created by ramia n on 03/04/1445 AH.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var cartManager:CartManager
    @State var categoryList  = categoriesList
    @State var selectedCategory  = ""

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    HStack{
                        Text("Order from the best **Snaks**" )
                            .font(.system(size: 30 ))
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay {
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.4 )
                            }
                    }
                    categoryListView
                    HStack{
                        Text("Choco **Collection**")
                            .font(.system(size: 24))
                        Spacer()
                        NavigationLink {
                            CollectionView().environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.black)

                        
                    }
                    .padding()
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            ForEach(productsList,id: \.id){product in
                    
                                ProductCard(product: product)

                            }
                        }
                    }
      
                }.padding()
            }
        }
    }
    var categoryListView: some View{
        HStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(categoryList,id: \.id){item in
                        Button(action: {
                            selectedCategory = item.title
                        }, label: {
                            HStack{
                                if(item.title != "All"){
                                    Image(systemName: item.icon)}
                                Text(item.title)
                            }
                            .padding()
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                            .clipShape(Capsule())
                        })
                    }
                    
                }
            }
        }
    }
}
struct ProductCard: View {
    @EnvironmentObject var cartManager:CartManager
    @State var product:ProductModel
    
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFill()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack{
                VStack(alignment: .leading){
                    Text(product.name)
                        .font(.system(size: 36) .weight(.semibold))
                        .frame(width: 140)

                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    HStack{
                        Text("$\(product.price)")
                            .font(.system(size: 24,weight: .semibold))
                        Spacer()
                        Button{
                            print("tapped\(product.id)")
                            cartManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 90,height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
//                        .padding(.horizontal,-10)
                    }
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())

                    
                    
                }
              
            }
            .padding(30)
            .frame(width: 336,height: 422)
  
        }
        .frame(width: 336,height: 422)
        .background(product.color.opacity(0.13 ))
        .clipShape(.rect(cornerRadius:57))
        .padding(.leading,20)
        
    }}

#Preview {
    Home()
        .environmentObject(CartManager())
}
