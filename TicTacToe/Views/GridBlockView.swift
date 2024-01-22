//
//  GridBlockView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/1/22.
//

import SwiftUI

struct GridBlockView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    var index: Int
    var squareDimension: CGFloat = 60
    
    
    
    var body: some View {
        VStack {
            switch gameBoardDM.board[index] {
            case .empty:
                Text("")
                    .frame(width: squareDimension - 20, height: squareDimension - 20)
                    .background(.white)
                    
            case .cross:
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: squareDimension - 20, height: squareDimension - 20)
                    
            case .circle:
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: squareDimension - 20, height: squareDimension - 20)
                    
            }
        }
        .frame(width: squareDimension, height: squareDimension)
        .border(.black)
        .onTapGesture {
            gameBoardDM.board[index] = BlockState.circle
        }
    }
}

#Preview {
    GridBlockView(index: 1).environmentObject(GameBoardDataModel())
}
