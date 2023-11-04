//
//  OnlineStoreApp.swift
//  OnlineStore
//
//  Created by Rohit Saini on 03/11/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct OnlineStoreApp: App {
    var body: some Scene {
        WindowGroup {
          ProductCell(store: Store(initialState: ProductDomain.State(product: Product.sample[0])) {
            ProductDomain()
          })
        }
    }
}
