//
//  Chat.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation
import OpenAPIURLSession
import SwiftUI

class Chat: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    let date: Date = Date.now
    @Published var article: String? = nil
//    @Published var messages: [Message] = .init()
    @Published var messagesV2: Components.Schemas.Messages = .init()
    @Published var isWaitingForServerResponse: Bool = false
    
    
}



extension Chat {
    var messages: Components.Schemas.Messages {
        self.messagesV2
    }
//    func add(message: Message) {
//        withAnimation {
//            if self.messages.isEmpty {
//                self.article = message.message
//            }
//            self.messages.append(message)
//        }
//    }
//    
}

extension Chat {
    func chat(userMessage: String) {
        withAnimation {
            self.messagesV2.append(.init(role: .user, content: userMessage))
            self.isWaitingForServerResponse = true
            Task(priority: .userInitiated) {
                let responseMessage = try await InputHandler.chat(usingLastMessageOf: self)
                await MainActor.run {
                    self.messagesV2.append(responseMessage)
                    self.isWaitingForServerResponse = false

                }
            }
        }
    }
    
    func add(message: Components.Schemas.Message) {
        withAnimation {
            self.messagesV2.append(message)
        }
    }
    
//    func add(message: String) {
//        self._add(message: self.createMessage(for: message))
//    }
    func createMessage(for messageContent: String) -> Components.Schemas.Message {
        .init(role: .user, content: messageContent)
        
    }
    func _add(message: Components.Schemas.Message) {
        self.messagesV2.append(message)
    }
   
}
