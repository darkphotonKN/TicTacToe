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
        VStack {
            // MARK: Title
            Text("Tic-Tac-Toe")
                .font(.title)
                .padding(.top, 15)
            Spacer()
                
            Text("Current Move: \(gameBoardDM.currentMove == .opponent ? "Cross" : "Circle")")
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
    }
}

#Preview {
    GameView().environmentObject(GameBoardDataModel())
}
