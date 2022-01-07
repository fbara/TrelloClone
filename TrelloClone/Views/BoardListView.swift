//
//  BoardListView.swift
//  TrelloClone
//
//  Created by Frank Bara on 1/7/22.
//

import SwiftUI

struct BoardListView: View {
    
    @ObservedObject var board: Board
    @StateObject var boardList: BoardList
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            // header
            headerView
            
            listView
                .listStyle(.plain)
            
            Button("+ Add Card") {
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.vertical)
        .background(boardListBackgroundColor)
        .frame(width: 300)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(boardList.name)
                .font(.headline)
                .lineLimit(2)
            
            Spacer()
            
            Menu {
                Button("Rename") {
                    
                }
                
                Button("Delete") {
                    
                }
                
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }
        }
        .padding(.horizontal)
    }
    
    private var listView: some View {
        List {
            ForEach(boardList.cards) { card in
                CardView(boardList: boardList, card: card)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
            .listRowBackground(Color.clear)
        }
    }
}

struct BoardListView_Previews: PreviewProvider {
    @StateObject static var board = Board.stub
    
    static var previews: some View {
        BoardListView(board: board, boardList: board.lists[0])
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 512)
    }
}
