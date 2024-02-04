//
//  CollectionView.swift
//  Snaks App
//
//  Created by ramia n on 06/04/1445 AH.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var cartManager:CartManager
    @Environment(\.dismiss) var mode
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    HStack{
                        Text("Order from the best **Snaks**" )
                            .font(.system(size: 30 ))
                            .padding(.trailing)
                        Spacer()
                        Button(action: {
                            mode.callAsFunction()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke()
                                        .opacity(0.4 )
                                }
                        }).foregroundColor(.black)
 
                    }.padding(30)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width - 20)),GridItem(.adaptive(minimum:UIScreen.main.bounds.width - 20))], content: {
                        ForEach(productsList,id: \.id) { product in
                            SmallProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
struct SmallProductCard: View {
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
                        .font(.system(size: 18) .weight(.semibold))
                        .frame(width: 70)
                    
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    HStack{
                        Text("$\(product.price)")
                            .font(.system(size: 14,weight: .semibold))
                        Spacer()

                        Button{
                            print("tapped\(product.id)")
                            cartManager.addToCart(product: product)

                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 45,height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    
                    .padding(.trailing,-12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                    
                    
                }
                
            }
            .padding(20)
            .frame(width: 170,height: 215)
            
        }
        .frame(height: 240)
        .background(product.color.opacity(0.13 ))
        .clipShape(.rect(cornerRadius:30))
        .padding(.leading,10)
        
    }
}


#Preview {
    CollectionView()
        .environmentObject(CartManager())
}
