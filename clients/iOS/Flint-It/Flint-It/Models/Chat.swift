//
//  Chat.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation
import SwiftUI

class Chat: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    let date: Date = Date.now
    @Published var article: String? = nil
    @Published var messages: [Message] = .init()
    
    
}

extension Chat {
    func add(message: Message) {
        withAnimation {
            if self.messages.isEmpty {
                self.article = message.message
            }
            self.messages.append(message)
        }
    }
}
