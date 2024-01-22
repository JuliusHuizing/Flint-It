//
//  InputNormView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession



struct InputNormView: View {
    @Binding var processingInput: Bool
    @State var text: String = ""
    @State var messageHistory: [Message] = .init()
    var onSubmit: (String) -> Void
    var body: some View {
        VStack {
            ChatView(chatHistory: $messageHistory)
        
            InputFieldView(text: $text) { article in
                withAnimation {
                    
                    self.messageHistory.append( .init(sender: .user, message: article))
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        
                        self.messageHistory.append(.init(sender: .bot, message: "Check! I'll try to extract all potential Act Frames for you."))
                    }
                      
                    }
                  
                self.onSubmit(article)
            }
            
            
            //        }
        }
    }
}

// keep as separate view so we can use it to align the heights of the contentunavailable views in the display act frame view.
struct InputFieldView: View {
    @Binding var text: String
    var onSubmit: (String) -> Void
    var body: some View {
        HStack {
            TextField("Copy and Paste a source", text: $text)
            //                .padding()
            //            TextField("Source", text: $text)
            Button {
                onSubmit(text)
            } label: {
                Image(systemName: "arrow.up.square.fill")
            }
            .disabled(text.isEmpty)
        }
        .padding()
    }
}

#Preview {
    NavigationSplitView {
        //
    } content: {
        InputNormView(processingInput: .constant(false), onSubmit: { _ in})

    } detail: {
        //
    }

    
}
