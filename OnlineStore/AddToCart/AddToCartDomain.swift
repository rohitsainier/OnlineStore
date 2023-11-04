//
//  AddToCartDomain.swift
//  OnlineStore
//
//  Created by Rohit Saini on 03/11/23.
//

import Foundation
import ComposableArchitecture

/// Reducer responsible for managing the state of the add-to-cart functionality.
struct AddToCartDomain: Reducer {
    /// The body of the reducer that describes how the state should be mutated in response to actions.
    var body: some ReducerOf<AddToCartDomain> {
        Reduce { state, action in
            switch action {
            /// Action to increment the count when the plus button is tapped.
            case .didTapPlusButton:
                state.count += 1
                return Effect.none
            /// Action to decrement the count when the minus button is tapped.
            case .didTapMinusButton:
                state.count -= 1
                return Effect.none
            }
        }
    }

    /// The state managed by the AddToCartDomain reducer, representing the count of items added to the cart.
    struct State: Equatable {
        /// The count of items added to the cart.
        var count: Int = 0
    }

    /// Actions that can be performed in the AddToCartDomain.
    enum Action: Equatable {
        /// Action representing the event when the plus button is tapped.
        case didTapPlusButton
        /// Action representing the event when the minus button is tapped.
        case didTapMinusButton
    }
}

