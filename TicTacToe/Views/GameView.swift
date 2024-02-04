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
            
        }
            
}

#Preview {
    GameView().environmentObject(GameBoardDataModel())
}
