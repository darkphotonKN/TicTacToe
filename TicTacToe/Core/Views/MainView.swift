//
//  HomeView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    @State var gameViewState: GameViewState = .playersList
    
    var body: some View {
        ZStack {
            VStack {

                // MARK: Title
                Text("Tic-Tac-Toe")
                    .font(.title)
                    .padding(.top, 15)
                
                
                Spacer()
               
                // MARK: Navigation
                switch(gameViewState) {
                    
                // main home view
                case .home:
                    Text("test")
                    
                // players selection list
                case .playersList:
                    // MARK: Players List
                    PlayersListView()
                    
                // game view
                case .gameBoard:
                    // current move label
                    Text("Current Move: \(gameBoardDM.currentMove == .player ? "Circle" : "Cross")")
                        
                    // MARK: Main Grid
                    GameView()
                    
                }

                Spacer()
                
                // MARK: Navigation View
                NavigationView(gameViewState: $gameViewState)
                
            }
            
            // MARK: Game Result Overlay Modal
            if(gameBoardDM.winState != nil) {
                GameResultView()
            }
        }
    }
}

#Preview {
    MainView().environmentObject(GameBoardDataModel())
}
