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
    }
    
    // MARK: determine move made and who's turn it is
    func makeMove(indexOfMove: Int) {
        
        // guard against the situation board is not empty to prevent unnecessary move
        guard board[indexOfMove] == .empty else { return }
        
        // make move based on who's turn it is
        if(currentMove == .player) {
            board[indexOfMove] = .circle
            currentMove = .opponent
        } else {
            board[indexOfMove] = .cross
            currentMove = .player
        }
        
        let winner = checkWinner()
        if (winner) {
            print("\(currentMove == .player ? "circle" : "cross") has won the game!")
        }
    }
    
    // MARK: check for winner
    func checkWinner() -> Bool {
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
        
        let winStates = [[0, 1, 2]]
        
        // record number of consequetive matching O's or X's
        var score = 0
        
        for winState in winStates {
            // check if these win state indexes are occupied by the current player
            for index in winState {
                if(currentMove == .player) {
                    // check circles during player's turn
                    if(board[index] == .circle) {
                        score += 1
                    }
                } else {
                    // else check for crosses during opponent's turn
                    if(board[index] == .cross) {
                        score += 1
                    }
                }
            }
            print("current score: \(score)")
            // stop loop to determine winner
            guard score == 3 else { return true }
            // reset score after checking each pattern
            score = 0
        }
        
        // end state, no winner yet
        return false
    }

}
