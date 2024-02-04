//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Kranti on 2024/1/21.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    
    @StateObject var gameBoardDM = GameBoardDataModel()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(GameBoardDataModel())
        }
    }
}
