//
//  ChatView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI
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


struct ChatView: View {
    @Binding var chatHistory: [Message]
    var body: some View {
        if chatHistory.isEmpty {
            VStack {
                Spacer()
                ContentUnavailableView("What norm can I parse for you today?", systemImage: "circle.hexagongrid.circle")
                Spacer()
            }
            
        } else {
            SwiftUI.List(chatHistory) { message in
                MessageView(message: message)
            }
        }
    }
}

struct MessageView: View {
    let message: Message
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(message.sender.rawValue)
                .font(.headline.bold())
            Text(message.message)
                .foregroundStyle(.secondary)
        }
               }
}

#Preview {
    NavigationSplitView {
        Text("test")
    } content: {
        ChatView(chatHistory: .constant(.init()))
    } detail: {
        Text("test")
    }

}
