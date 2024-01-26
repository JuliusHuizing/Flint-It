//
//  TextInputView.swift
//  Flint-It
//
//  Created by Julius Huizing on 23/01/2024.
//

import SwiftUI

// keep as separate view so we can use it to align the heights of the contentunavailable views in the display act frame view.
struct InputFieldView: View {
    @Binding var text: String
    var onSubmit: (String) -> Void
    var body: some View {
        ZStack {
            if self.text.isEmpty {
                TextEditor(text:.constant("Copy and paste a norm here."))
                        .foregroundColor(.gray)
                        .disabled(true)
            }
            TextEditor(text: $text)
                .opacity(self.text.isEmpty ? 0.25 : 1)
        }
        
        .font(.headline)
                .textEditorStyle(.plain)
                .foregroundStyle(.orange)
                .scrollIndicators(.never)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        onSubmit(text)
                        withAnimation {
                            self.text = ""
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                    }
                    .disabled(text.isEmpty)
                    .padding()
                    .buttonStyle(.plain)
                    .font(.largeTitle)
                    .foregroundStyle(Color.white, Color.accentColor)
                    .shadow(radius: 10)
                    
                }
            //                .padding()
            //            TextField("Source", text: $text)
           
        
        .padding()
    }
}

