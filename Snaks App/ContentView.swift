//
//  ContentView.swift
//  Snaks App
//
//  Created by ramia n on 03/04/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
         
        NavigationView {
            ZStack(alignment: .bottom){
                Home()
                    .environmentObject(cartManager)
                
                if(cartManager.products.count > 0){
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        HStack(spacing: 30){
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Cart")
                                    .font(.system(size: 26,weight: .semibold))
                                Text("\(cartManager.products.count) items")
                                    .font(.system(size: 18))
                            }
                            Spacer()
                            ForEach(cartManager.products) { product in
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 60,height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading,-60)
                                
                            }

                            
                        }
                        .padding(30)
                        .frame(width: UIScreen.main.bounds.width,height: 120)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 30))
                        .foregroundColor(.white)
                    }

                }

            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)


    }
}

#Preview {
    ContentView()
}
