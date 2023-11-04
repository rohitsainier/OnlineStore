//
//  ProductDomain.swift
//  OnlineStore
//
//  Created by Rohit Saini on 03/11/23.
//

import Foundation
import ComposableArchitecture


/// Reducer responsible for managing the state of the product and its add-to-cart functionality.
struct ProductDomain: Reducer {
    /// The body of the reducer that describes how the state should be mutated in response to actions.
    var body: some ReducerOf<ProductDomain> {
        // Scoping the AddToCartDomain reducer within the ProductDomain.
        Scope(state: \.addToCartState, action: /ProductDomain.Action.addToCart) {
            AddToCartDomain()
        }
        // Additional actions specific to the ProductDomain.
        Reduce { state, action in
            switch action {
            /// Action to handle the addition of items to the cart when the plus button is tapped.
            case .addToCart(.didTapPlusButton):
                return Effect.none
            /// Action to handle the subtraction of items from the cart when the minus button is tapped.
            case .addToCart(.didTapMinusButton):
                state.addToCartState.count = max(0, state.addToCartState.count)
                return Effect.none
            }
        }
    }

    /// The state managed by the ProductDomain reducer, representing product details and the add-to-cart state.
    struct State: Equatable {
        /// The product details associated with the ProductDomain.
        let product: Product
        /// The state managed by the AddToCartDomain reducer within the ProductDomain.
        var addToCartState: AddToCartDomain.State = AddToCartDomain.State()
    }

    /// Actions that can be performed in the ProductDomain.
    enum Action: Equatable {
        /// Action representing the event of adding items to the cart within the product domain.
        case addToCart(AddToCartDomain.Action)
    }
}

