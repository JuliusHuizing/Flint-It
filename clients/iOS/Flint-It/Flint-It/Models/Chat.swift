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
    
    @Published var isComputingActFrame: Bool = false
    @Published var frames: [Components.Schemas.ActFrame] = .init()
    @Published var isDisabled: Bool = false
    
    
}
extension Chat {
    var name: String {
        if let article {
            return article
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let currentTime = formatter.string(from: self.date)
            return currentTime
        }
    }
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
            self.isDisabled = true
            self.messagesV2.append(.init(role: .user, content: userMessage))
            self.isWaitingForServerResponse = true
            Task(priority: .userInitiated) {
                let response = try await InputHandler.chat(usingLastMessageOf: self)
                let latentResponse = response.latentResponse!
                await MainActor.run {
                    withAnimation {
                        if self.article == nil && latentResponse.provided_norm != nil {
                            self.article = latentResponse.provided_norm!
                        }
                        self.messagesV2.append(response.message!)
                        self.isWaitingForServerResponse = false
                    }
                   

                }
                if latentResponse.is_first_time_user_provides_norm! || latentResponse.user_asks_for_improved_act_frame! {
                    await MainActor.run {
                        withAnimation {
                            self.isComputingActFrame = true
                        }
                    }
                    let response = try await InputHandler.chatWithActFrameWorker(usingLastMessageOf: self)
                    if let frames = response.actFrames {
                        await MainActor.run {
                            withAnimation  {
                                self.frames.append(contentsOf: frames)
                            }
                        }
                    }
                    await MainActor.run {
                        withAnimation {
                            self.isComputingActFrame = false
                        }
                    }
                    
                }
                await MainActor.run {
                    withAnimation {
                        self.isDisabled = false
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
