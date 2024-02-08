//
//  PlayersView.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import SwiftUI

struct PlayersListView: View {
    
    @StateObject var playersListVM = PlayersListViewModel()
    
    var body: some View {
       
        ForEach(playersListVM.playersListData) { player in
            Text(player.name)
                .onAppear {
                    print("player: \(player)")
                }
        }
        
    }
}

#Preview {
    PlayersListView()
}
