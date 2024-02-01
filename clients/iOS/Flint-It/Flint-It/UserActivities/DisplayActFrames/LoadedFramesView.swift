//
//  LoadedFramesView.swift
//  Flint-It
//
//  Created by Julius Huizing on 01/02/2024.
//

import SwiftUI
import OpenAPIURLSession

struct LoadedFramesView: View {
    @ObservedObject var chat: Chat
    @State var showingFrame: Components.Schemas.ActFrame
    init(chat: Chat) {
        _chat = ObservedObject(initialValue: chat)
        _showingFrame = State(initialValue: chat.frames.last!)
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Act Frames")
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(Color.cyan)
            
//                Picker("", selection: $showingFrameKind) {
//                    ForEach(FrameKind.allCases, id: \.self) { frameKind in
//                        Text(frameKind.rawValue)
//                    }
//                }
//                .pickerStyle(.segmented)
//                .padding(.vertical)
            
            Picker("", selection: $showingFrame) {
                ForEach(chat.frames, id: \.self) { frame in
                    Button(frame.Action) {
                        withAnimation {
                            showingFrame = frame
                        }
                    }
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)
            
//                TabView {
//                    ForEach(chat.frames, id: \.self) { actFrame in
                    ActFrameView(frame: $showingFrame)
//                            .tabItem {
//                                HStack {
//                                    Text(actFrame.Action)
//                                }
//                            }
//                            .overlay(alignment: .bottomTrailing) {
//                                Button {
//                                    let url = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
//                                    FileDownloader.loadFileAsync(url: url!) { (path, error) in
//                                        print("PDF File downloaded to : \(path!)")
//                                    }
//                                } label: {
//                                    Image(systemName: "arrow.down.circle.fill")
//                                        .font(.largeTitle)
//                                        .foregroundStyle(.white, Color.accentColor)
//                                }
//                                .buttonStyle(.plain)
////                                .foregroundStyle(Color.accentColor)
//                                .padding()
//                            }
                    
                }
//            .onAppear {
//                withAnimation {
//
//                    self.showingFrame = chat.frames.last
//                }
//
//            }
        .padding()
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadii))
    }
}

//#Preview {
//    LoadedFramesView()
//}
