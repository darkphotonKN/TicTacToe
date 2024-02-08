//
//  NavigationView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import SwiftUI

struct NavigationView: View {
    @Binding var gameViewState: GameViewState
    
    
    var body: some View {
        HStack {
            NavigationButton(gameViewState: $gameViewState, link: .home, imageName: "house", label: "Home")
            NavigationButton(gameViewState: $gameViewState,  link: .gameBoard, imageName: "gamecontroller", label: "Game")
            NavigationButton(gameViewState: $gameViewState,  link: .playersList, imageName: "trophy", label: "Leaderboard")
        }
    }
}

#Preview {
    NavigationView(gameViewState: .constant(.home))
}
