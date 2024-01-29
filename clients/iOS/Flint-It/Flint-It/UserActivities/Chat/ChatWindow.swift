//
//  InputNormView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession


struct ChatWindow: View {
    @ObservedObject var chat: Chat
//    @Binding var processingInput: Bool
    @State var text: String = ""
//    @State var messageHistory: [Message] = .init()
    var onSubmit: (String) -> Void
    var body: some View {
        VStack {
            if let article = chat.article {
                NormView(norm: article)
                    .padding()
            }
            ChatView(chat: chat)
                .padding()
            
            Divider()
            InputFieldView(text: $text, placeHolder: chat.article == nil ? .constant("Copy and paste a norm here.") : .constant("Message FlintGPT...")) { article in
                withAnimation {
                    chat.add(message: .init(sender: .user, message: article))
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        chat.messages.append(.init(sender: .bot, message: "Check! I'll try to extract all potential Act Frames for you."))
                    }
                }
                self.onSubmit(article)
            }
            .frame(height: chat.article == nil ? 500 : 250 )
            
        }
    }
}


//#Preview {
//    NavigationSplitView {
//        //
//    } content: {
//        ChatWindow(processingInput: .constant(false), onSubmit: { _ in})
//
//    } detail: {
//        //
//    }
//
//    
//}
