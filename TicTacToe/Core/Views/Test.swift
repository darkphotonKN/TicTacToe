//
//  Test.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/7.
//

import SwiftUI

struct Alert: View {
    @Binding var dismissButton: Bool
    var title: String
    
    var body: some View {
        
        if(dismissButton) {
            ZStack{
                Color(.black)
                    .opacity(0.4)
                    .ignoresSafeArea()
                VStack {
                    Text(title)
                        
                    Button {
                        dismissButton = false
                    } label: {
                        Text("Close")
                    }
                }
                .frame(width: 100, height: 100)
                .background(.white)
                .cornerRadius(4)
            }
        } else {
            Text("closed")
        }
       
    }
}

#Preview {
    Alert(dismissButton: .constant(true), title: "hi")
}
