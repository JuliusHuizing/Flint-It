//
//  FramesView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI

struct FramesView: View {
    @ObservedObject var chat: Chat
    var body: some View {
        VStack(alignment: .leading) {
            Text("Frames")
                .font(.largeTitle)
                .padding(.bottom)
            TabView {
                ForEach(chat.frames, id: \.self) { actFrame in
                    ActFrameView(frame: actFrame)
                        .tabItem {
                            HStack {
                                Text(actFrame.Action)
                            }
                        }
                        .overlay(alignment: .bottomTrailing) {
                            Button {
                                let url = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
                                FileDownloader.loadFileAsync(url: url!) { (path, error) in
                                    print("PDF File downloaded to : \(path!)")
                                }
                            } label: {
                                Image(systemName: "arrow.down.circle")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.plain)
                            .foregroundStyle(Color.accentColor)
                            .padding()
                        }
                    
                }
            }
        }
    }
}

//#Preview {
//    Navigatio
//    FramesView()
//}
