//
//  ChatView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI


struct ChatView: View {
    @ObservedObject var chat: Chat
    var body: some View {
        if chat.messages.isEmpty {
            VStack {
                Spacer()
                ContentUnavailableView("What norm can I parse for you today?", systemImage: "circle.hexagongrid.circle")
                Spacer()
            }
            
        } else {
            SwiftUI.List(chat.messages) { message in
                MessageView(message: message)
            }
        }
    }
}



//#Preview {
//    NavigationSplitView {
//        Text("test")
//    } content: {
//        ChatView(chatHistory: .constant(.init()))
//    } detail: {
//        Text("test")
//    }
//
//}
