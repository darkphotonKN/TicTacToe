//
//  PlayersListViewModel.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

/*
 
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
 */


import SwiftUI


final class PlayersListViewModel: ObservableObject {
    var playersListData: [Player] = []
    
    init() {
        // initialize api data
        NetworkManager.shared.getRequest(endpoint: "/users") { (result: Result<[Player], Error>) in
            // get the result success case
            switch result {
            case .success(let responseData):
                print("Final data: \(responseData)")
                self.playersListData = responseData
            case .failure(let error):
                print("DEBUG: failure to request player list data, error was: \(error)")
            }
        }
    }
    
}
