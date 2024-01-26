//
//  Message.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation

struct Message: Identifiable {
    let id = UUID().uuidString
    enum Sender: String {
        case user = "You"
        case bot = "FlintGPT"
    }
    var sender: Sender
    var message: String
    var timeStamp: Date = Date.now
    
    
}

extension Message {
    func mock() -> [Message] {
        [
           .init(sender: .user, message: "how are you"),
           .init(sender: .bot, message: "Good. you?")
       ]
    }
}
