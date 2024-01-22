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
    @Binding var actFrame: Components.Schemas.ActFrame?
    @Binding var processingInput: Bool
    @State var text: String = ""
    @State var submitted = false
    var onSubmit: (String) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            if submitted {
                
            } else {
                ContentUnavailableView("What norm can I parse for you today?", systemImage: "circle.hexagongrid.circle")
            }
            
            Spacer()
          
            InputFieldView(text: $text) { article in
                self.submitted = true
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
        VStack {
            
                
            TextEditor(text: $text)
                .font(.title)
                .foregroundColor(.orange)
                .textEditorStyle(.plain)
             
            
//            TextField("Copy and Paste a source", text: $text)
            //                .padding()
            //            TextField("Source", text: $text)
            
            
            Button {
                onSubmit(text)
            } label: {
                Label("Analyze", systemImage: "arrow.up.square.fill")
                    .padding()
                    .font(.largeTitle)
            }
            .buttonStyle(.borderedProminent)
            .disabled(text.isEmpty)
        }
        .padding()
    }
}

#Preview {
    NavigationSplitView {
        //
    } content: {
        InputNormView(actFrame: .constant(nil), processingInput: .constant(false), onSubmit: { _ in})

    } detail: {
        //
    }

    
}
