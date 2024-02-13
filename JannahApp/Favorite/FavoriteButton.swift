//
//  FavoriteButton.swift
//  JannahApp
//
//  Created by amal badr on 01/02/2024.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet:Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill":"heart" )
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .colorPrimer : .accentColor)
       }

    }
}

#Preview {
    FavoriteButton(isSet: .constant(false))
}
