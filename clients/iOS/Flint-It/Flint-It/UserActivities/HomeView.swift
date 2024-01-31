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
//                 .overlay(alignment: .bottomTrailing) {
//                     Button {
//                         let url = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
//                         FileDownloader.loadFileAsync(url: url!) { (path, error) in
//                             print("PDF File downloaded to : \(path!)")
//                         }
//                     } label: {
//                         Image(systemName: "arrow.down.circle")
//                             .font(.largeTitle)
//                     }
//                     .buttonStyle(.plain)
//                     .foregroundStyle(Color.accentColor)
//                     .padding()
//                 }
             } detail: {
               
                     FramesView(chat: showingChat)
                         .padding()
                 
                 
             }
             .navigationTitle("Flint-it")
             .onAppear {
                 Task {
                     try? await Task.sleep(nanoseconds: 1_000_000_000)
                     await MainActor.run {
                         withAnimation {
                             let message: Components.Schemas.Message = .init(role: .system, content: "Hi there!")
                             showingChat.messagesV2.append(message)
                         }
                     }
                 }
               
                 
             }
         }
    }

#Preview {
    HomeView()
}
