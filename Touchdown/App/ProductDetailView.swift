//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Dzmitry Bladyka on 3.04.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        VStack(alignment: .leading, spacing: 5) {
            // Navbar
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, window?.safeAreaInsets.top)

            
            // Header
            HeaderDetailView()
                .padding(.horizontal)
            
            
            // Detail top part
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            
            // Detail bottom part
            VStack(alignment: .center, spacing: 0) {
                // Rating + sizes
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                // Description
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                
                // Quantity + Fav
                QuantityFavouriteDetailView()
                    //.padding(.vertical, 10)
                
                
                // Add to cart
                AddToCartDetailView()
                    .padding(.vertical, 20)
                
            }
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )
        }
        .zIndex(0)
        .background(
            Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                  green: shop.selectedProduct?.green ?? sampleProduct.green,
                  blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        )
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
