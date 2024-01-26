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
                // if player lost
                if(gameBoardDM.winState == .opponent) {
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
                        
                    } label: {
                        Text("Try Again?")
                    }
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top, 18)
                } else {
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
                        
                    } label: {
                        Text("Play Again?")
                    }
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top, 18)
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
