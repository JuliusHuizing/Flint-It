//
//  ChatView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI
import ActivityIndicatorView

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
            VStack(alignment: .leading) {
                Text("Chat")
                    .font(.largeTitle)
                SwiftUI.List {
                    ForEach(chat.messages, id: \.self) { message in
                        
                        MessageView(message: message)
                            .listRowBackground(Color.red.opacity(0))

                        
                    }
                    if chat.isWaitingForServerResponse {
                        HStack {
                            ActivityIndicatorView(isVisible: .constant(true), type: .opacityDots(count: 3, inset: 4))
                                .frame(width: 25, height: 25)
                            Spacer()
                        }
                    }
                }
//                .listStyle(.inset)
//                .listStyle(.plain)
               
            }
            .padding()
            .scrollContentBackground(.hidden)
            .background(
                backgroundColor,
               in: RoundedRectangle(cornerRadius: cornerRadii, style: .continuous)
            )
                
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
