//
//  NavigationButton.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import SwiftUI

struct NavigationButton: View {
    @Binding var gameViewState: GameViewState
    var link: GameViewState
    var imageName: String
    var label: String
    
    var body: some View {
        Button {
            gameViewState = link
        } label: {
            Image(systemName: imageName)
            Text(label)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    NavigationButton(gameViewState: .constant(.home), link: .home, imageName: "house", label: "Home")
}
