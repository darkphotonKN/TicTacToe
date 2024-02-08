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
    @Published var winState: BlockState?
    
    
    // initialize game
    init() {
        newGame()
        print("Initialized game board... \(board)")
    }
    
    func resetGame() {
        newGame()
    }
    
    // MARK: Handles all New Game Initalization
    func newGame() {
        var initBoard = [BlockState]()
        for _ in 0..<9 {
            initBoard.append(BlockState.empty)
        }
        
        // initialize game board with array of empty non-move states
        board = initBoard
        
        // randomize starting player
        let coinFlip = Bool.random()
        
        if(coinFlip) {
            currentMove = MoveState.player
        } else {
            currentMove = MoveState.opponent
        }
        
        // reset winner if there was one
        winState = nil
    }
    
    // MARK: determine move made and who's turn it is
    func makeMove(indexOfMove: Int) {
        
        // guard against the situation board is not empty to prevent unnecessary move
        guard board[indexOfMove] == .empty else { return }
        
        if let tempCurrentMove = currentMove {
            // make move based on who's turn it is
            if(currentMove == .player) {
                board[indexOfMove] = .circle
                currentMove = .opponent
            } else {
                board[indexOfMove] = .cross
                currentMove = .player
            }
        
            let winner = checkWinner(move: tempCurrentMove)
            if let winner = winner {
                print("\(winner == .player ? "circle" : "cross") has won the game!")
                winState = winner == .player ? .circle : .cross
            }
            let gameDrawn = checkDraw()
            if(gameDrawn) {
                winState = .empty
            }
        }
        
    }
    
    // MARK: Check for Draw
    func checkDraw() -> Bool {
        // iterate through board state and find the first .empty block
        // we guard against this and if none are empty, then we return
        // true to show that the game is at a draw
        
        guard board.first(where: { $0 == .empty }) != nil else { return true }
        
        return false
    }
    
    // MARK: Check for Winner
    func checkWinner(move: MoveState) -> MoveState? {
        print("move:", move)
        
        // run through board state to check for winner
        
        // list out all possible board states
        
        /*
         > array representation
        [
         0, 0, 0
         0, 0, 0
         0, 0, 0
         ]
         
         > list of possible winning indexes
         
         - row wins
         0, 1, 2
         3, 4, 5
         6, 7, 8
         
         - column wins
         0, 3, 6
         1, 4, 7
         2, 5, 8
         
         - diagonal wins
         0, 4, 8
         2, 5, 6
         */
        
        let winStates = [[0, 1, 2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,5,6]]
        
        // record number of consequetive matching O's or X's
        var score = 0
        
        for winState in winStates {
            // check if these win state indexes are occupied by a specific player
            for index in winState {
                // check circles during player's turn
                if(move == .player) {
                    print("DEBUG: current board - \(board)")
                    if(board[index] == .circle) {
                        score += 1
                        // print("DEBUG: Current player is circle, and after adding score: \(score)")
                    }
                }
                // else check for crosses during opponent's turn
                else {
                    print("DEBUG: current board - \(board)")
                    if(board[index] == .cross) {
                        score += 1
                        // print("DEBUG: Current player is cross, and after adding score: \(score)")
                    }
                }
            }
            print("current score: \(score)")
            // stop loop to determine winner
            guard score != 3 else { return move }
            
            // reset score after checking each pattern
            score = 0
        }
        
        return nil
    }

}
