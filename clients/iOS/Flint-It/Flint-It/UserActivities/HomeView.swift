//
//  HomeView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIURLSession

struct HomeView: View {
    @State var text: String = ""
    @State var actFrames: [Components.Schemas.ActFrame] = .init()
    @State var isLoading = false
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(1..<10) { articleNumber in
                    Text("Article \(articleNumber)")
                }
                .listStyle(.sidebar)

            }
             } content: {
                 
                 InputNormView(processingInput: $isLoading, onSubmit: { article in
                         Task {
                             self.isLoading = true
                             try? await Task.sleep(for: .seconds(6))
                             self.isLoading = false
                             let actFrame = try await InputHandler.requestActFrame(for: article)
                             withAnimation {
                                 self.actFrames.append(actFrame)
                             }
                         }
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
                 }
                 
//                 ActFrameView(frame: $actFrame, computingActFrame: $isLoading)
//                     .navigationTitle("test")
             }
             .navigationTitle("Flint-it")

         }
    

    }



#Preview {
    HomeView()
}
