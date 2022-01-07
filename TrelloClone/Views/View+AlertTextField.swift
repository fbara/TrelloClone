//
//  View+AlertTextField.swift
//  TrelloClone
//
//  Created by Frank Bara on 1/7/22.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    
    func presentAlertTextField(title: String, message: String? = nil, defaultTextFieldText: String? = nil, confimationAction: @escaping (String?) -> ()) {
        
        guard let rootVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .keyWindow?
                .rootViewController else { return }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.text = defaultTextFieldText
        }
        alertController.addAction(.init(title: "Cancel", style: .cancel) { _ in })
        alertController.addAction(.init(title: "Save", style: .default, handler: { _ in
            guard let textField = alertController.textFields?.first else { return }
            confimationAction(textField.text)
        }))
        
        rootVC.present(alertController, animated: true, completion: nil)
    }
    
}
