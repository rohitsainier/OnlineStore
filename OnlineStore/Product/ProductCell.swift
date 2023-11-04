//
//  ProductCell.swift
//  OnlineStore
//
//  Created by Rohit Saini on 03/11/23.
//

import SwiftUI
import ComposableArchitecture

struct ProductCell: View {
  let store: StoreOf<ProductDomain>
    var body: some View {
      WithViewStore(self.store, observe: {$0}) { viewStore in
        VStack {
          Image(viewStore.product.imageString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 300)
          VStack(alignment: .leading) {
            Text(viewStore.product.title)
            HStack {
              Text("$\(viewStore.product.price.description)")
                .font(.title)
                .fontWeight(.bold)
              Spacer()
              AddToCartButton(store: self.store.scope(state: \.addToCartState,
                                                      action: ProductDomain.Action.addToCart))
            }
          }
        }
        .padding(20)
      }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
      ProductCell(store: Store(initialState: ProductDomain.State(product: Product.sample[0])) {
        ProductDomain()
      })
    }
}
