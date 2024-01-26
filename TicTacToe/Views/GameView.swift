//
//  ContentView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/1/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    private var gridSpacing: CGFloat = 10
    
    var body: some View {
        
        ZStack {
            
            VStack {
                // MARK: Title
                Text("Tic-Tac-Toe")
                    .font(.title)
                    .padding(.top, 15)
                
                Spacer()
                
                Text("Current Move: \(gameBoardDM.currentMove == .player ? "Circle" : "Cross")")
                // MARK: Main Grid
                Grid(horizontalSpacing: gridSpacing, verticalSpacing: gridSpacing) {
                    
                    // iterating through columns
                    ForEach(0..<3, id: \.self) { columnIndex in
                        
                        GridRow {
                            // iterating through rows
                            ForEach(0..<3, id: \.self) { rowIndex in
                                
                                GridBlockView(index: columnIndex*3 + rowIndex)
                            }
                        }
                    }
                }
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
    GameView().environmentObject(GameBoardDataModel())
}
