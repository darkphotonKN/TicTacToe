//
//  GameResultView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/1/26.
//

import SwiftUI

struct GameResultView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    private let viewSizeWidth: CGFloat = UIScreen.main.bounds.size.width - 90
    private let viewSizeHeight: CGFloat = UIScreen.main.bounds.size.width - 130
    
    
    var body: some View {
        ZStack {
            // faded background overlay
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
            
            // game result modal
            VStack {
                
                switch(gameBoardDM.winState) {
                case .empty:
                    HStack {
                        Text("The game was drawn!")
                            .font(.system(size: 24, weight: .medium))
                    }
                    
                    Button {
                        // reset game
                        gameBoardDM.resetGame()
                    } label: {
                        Text("Try Again?")
                    }
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top, 18)
                case .cross:
                    HStack {
                        Text("Cross was the winner")
                            .font(.system(size: 24, weight: .medium))
                        
                        Image(systemName: "medal.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    
                    Text("You have lost.")
                        .font(.system(size: 20, weight: .medium))
                        .padding(.top, 10)
                    
                    Button {
                        // reset game
                        gameBoardDM.resetGame()
                    } label: {
                        Text("Try Again?")
                    }
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top, 18)
                    
                case .circle:
                    // if player won
                    HStack {
                        Text("Circle was the winner")
                            .font(.system(size: 24, weight: .medium))
                        
                        Image(systemName: "medal.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    
                    Text("You won!")
                        .font(.system(size: 24, weight: .medium))
                        .padding(.top, 10)
                    
                    Button {
                        // reset game
                        gameBoardDM.resetGame()
                    } label: {
                        Text("Play Again?")
                    }
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top, 18)
                    
                default:
                    Text("")
                }
                
               
            }
            .frame(width: viewSizeWidth, height: viewSizeHeight)
            .background(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    GameResultView().environmentObject(GameBoardDataModel())
}
