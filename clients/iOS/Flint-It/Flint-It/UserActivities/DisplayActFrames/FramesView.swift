//
//  FramesView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI

struct FramesView: View {
    @Binding var frames: [Components.Schemas.ActFrame]
    var body: some View {
        TabView {
            ForEach(frames, id: \.self) { actFrame in
                ActFrameView(frame: actFrame)
                    .tabItem {
                        HStack {
                            Text(actFrame.Action)
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
