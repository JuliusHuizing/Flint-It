//
//  FramesView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI

struct FramesView: View {
    @ObservedObject var chat: Chat
    @State var showingFrame: Components.Schemas.ActFrame? = nil
    var body: some View {
        if chat.isComputingActFrame {
            ComputingActFrameView()
        }
        else if chat.frames.isEmpty {
            FramesStartupView()
        }
        else {
            let backupframe = chat.frames.last!
            
            VStack(alignment: .leading) {
                Text("Frames")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .foregroundColor(Color.purple)
                Picker("", selection: $showingFrame) {
                    ForEach(chat.frames, id: \.self) { frame in
                        Text(frame.Action)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
//                TabView {
//                    ForEach(chat.frames, id: \.self) { actFrame in
                        ActFrameView(frame: showingFrame ?? backupframe)
//                            .tabItem {
//                                HStack {
//                                    Text(actFrame.Action)
//                                }
//                            }
                            .overlay(alignment: .bottomTrailing) {
                                Button {
                                    let url = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
                                    FileDownloader.loadFileAsync(url: url!) { (path, error) in
                                        print("PDF File downloaded to : \(path!)")
                                    }
                                } label: {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white, Color.accentColor)
                                }
                                .buttonStyle(.plain)
//                                .foregroundStyle(Color.accentColor)
                                .padding()
                            }
                        
                    }
            .onAppear {
                withAnimation {
                    
                    self.showingFrame = chat.frames.last
                }
                
            }
            .padding()
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadii))
            
                
//                }
                
            }
          
            
        }
    }


//#Preview {
//    Navigatio
//    FramesView()
//}
