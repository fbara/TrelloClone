//
//  Board.swift
//  TrelloClone
//
//  Created by Frank Bara on 1/6/22.
//

import Foundation

class Board: ObservableObject, Identifiable {
    
    private(set) var id = UUID()
    @Published var name: String
    @Published var lists: [BoardList]
    
    init(name: String, lists: [BoardList] = []) {
        self.name = name
        self.lists = lists
    }
    
}
