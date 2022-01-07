//
//  BoardDropDelegate.swift
//  TrelloClone
//
//  Created by Frank Bara on 1/7/22.
//

import Foundation
import SwiftUI

struct BoardDropDelegate: DropDelegate {
    
    let board: Board
    let boardList: BoardList
    
    private func cardItemProviders(info: DropInfo) -> [NSItemProvider] {
        info.itemProviders(for: [Card.typeIdentifier])
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        // if the card is not empty
        if !cardItemProviders(info: info).isEmpty {
            return DropProposal(operation: .copy)
        }
        return nil
    }
    
    func performDrop(info: DropInfo) -> Bool {
        let cardItemProviders = cardItemProviders(info: info)
        
        for cardItemProvider in cardItemProviders {
            cardItemProvider.loadObject(ofClass: Card.self) { item, _ in
                guard let card = item as? Card,
                      card.boardListId != boardList.id // not dropping card on same board
            else { return }
                DispatchQueue.main.async {
                    board.move(card: card, to: boardList, at: 0)
                }
            }
        }
        
        return true
    }
}
