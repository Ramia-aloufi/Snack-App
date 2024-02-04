//
//  CardView.swift
//  Snaks App
//
//  Created by ramia n on 06/04/1445 AH.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager:CartManager
    @Environment(\.dismiss) var mode

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    HStack{
                        Text("Cart" )
                            .font(.system(size: 30 ))
                            .padding(.trailing)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("\(cartManager.products.count)")
                        })
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay {
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.4 )
                            }
                    }.padding(30)
                    VStack(spacing: 20, content: {
                        ForEach(cartManager.products) { product in
                                                CartProductCards(product: product )
                                            }
                                        })
                                        .padding(.horizontal)
                    VStack(alignment: .leading,content: {
                        HStack{
                            Text("Delivery Amount")
                            Spacer()
                            Text("Free")
                                .font(.system(size: 24,weight: .semibold))
                        }
                        Divider()
                        Text("Total Amount")
                            .font(.system(size: 24))
                        Text("USD \(cartManager.total)")
                            .font(.system(size: 36,weight: .semibold))
                        
                    }).padding(30)
                        .frame(maxWidth: .infinity)
                        .background(.yellow.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 30))
                        .padding()
                    
                    Button {
                        
                        
                    }label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20,weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                        
                    }
                    
                    


                }}}
        .navigationBarHidden(true)
    }
}

struct CartProductCards:View {
    var product:ProductModel
    var body: some View {
        HStack(alignment: .center,spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            VStack(alignment: .leading, content: {
                Text(product.name)
                    .font(.headline)
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            Spacer()
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
