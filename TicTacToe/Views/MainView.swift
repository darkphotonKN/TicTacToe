//
//  HomeView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        ZStack {
            
            VStack {
                
                
                // MARK: Title
                Text("Tic-Tac-Toe")
                    .font(.title)
                    .padding(.top, 15)
                
                
                Spacer()
                // current move label 
                Text("Current Move: \(gameBoardDM.currentMove == .player ? "Circle" : "Cross")")
                
                // MARK: Main Grid
                GameView()
                
                Spacer()
                
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
