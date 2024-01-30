//
//  HomeView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIURLSession

struct HomeView: View {
    @State var chats: [Chat] = [.init()]
    @State var text: String = ""
    @State var actFrames: [Components.Schemas.ActFrame] = .init()
    @State var isLoading = false
    @State var showingChat: Chat
    
    init() {
        let chats = [Chat.init()]
        self._chats = State(initialValue: chats)
        self._showingChat = State(initialValue:chats.first!)
    }
    var body: some View {
        NavigationSplitView {
            List {
                Button {
                    withAnimation {
                        let newChat: Chat = .init()
                        self.chats.append(newChat)
                        self.showingChat = newChat
                    }
                } label: {
                    Label("new chat", systemImage: "plus.circle")
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
                Divider()
                ForEach(chats.sorted(by: { chat1, chat2 in
                    chat1.date > chat2.date
                })) { chat in
                    Button(chat.id) {
                        withAnimation {
                            self.showingChat = chat
                        }
                    
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(self.showingChat.id == chat.id ? .primary : .secondary)
                    Divider()
       
                }
            }
             } content: {
                 ChatWindow(chat: showingChat, onSubmit: { article in
//                         Task {
//                             self.isLoading = true
//                             try? await Task.sleep(for: .seconds(6))
//                             self.isLoading = false
//                             let actFrame = try await InputHandler.requestActFrame(for: article)
//                             withAnimation {
//                                 self.actFrames.append(actFrame)
//                             }
//                         }
                     })
             } detail: {
                 if isLoading {
                     ComputingActFrameView()
                 }
                 else if actFrames.isEmpty {
                     FramesStartupView()
                 }
                
                 else {
                     FramesView(frames: $actFrames)
                         .padding()
                 }
                 
             }
             .navigationTitle("Flint-it")
         }
    }

#Preview {
    HomeView()
}
