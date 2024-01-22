//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Kranti on 2024/1/21.
//

import Foundation


/*
 Logic and data structure for game board items
 */
class GameBoardDataModel: ObservableObject {
    @Published var board: [BlockState] = []
    @Published var currentMove: MoveState?
    
    // initialize game
    init() {
        newGame()
        print("Initialized game board... \(board)")
    }
    
    func newGame() {
        
        var initBoard = [BlockState]()
        for _ in 0..<9 {
            initBoard.append(BlockState.empty)
        }
        
        // initialize game board with array of empty non-move states
        board = initBoard
    }
    
    
    
}
