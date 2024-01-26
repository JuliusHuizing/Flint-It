//
//  Chat.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation

class Chat: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    let date: Date = Date.now
    @Published var messages: [Message] = .init()
    
}
