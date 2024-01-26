//
//  ChatView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI


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



#Preview {
    NavigationSplitView {
        Text("test")
    } content: {
        ChatView(chatHistory: .constant(.init()))
    } detail: {
        Text("test")
    }

}
