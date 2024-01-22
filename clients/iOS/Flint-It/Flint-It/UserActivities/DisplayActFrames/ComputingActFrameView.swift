//
//  ComputingActFrameView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI
import ActivityIndicatorView

struct ComputingActFrameView: View {
    var body: some View {
        VStack {
            Spacer()
            ActivityIndicatorView(isVisible: .constant(true), type: .opacityDots(count: 3, inset: 4))
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            Text("Constructing Act Frames")
                .font(.headline.bold())
            Spacer()
        }
    }
}

#Preview {
    ComputingActFrameView()
}
