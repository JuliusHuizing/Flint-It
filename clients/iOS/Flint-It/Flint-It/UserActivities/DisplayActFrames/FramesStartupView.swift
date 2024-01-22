//
//  FramesStartupView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI

struct FramesStartupView: View {
    var body: some View {
        VStack {
            Spacer()
            ContentUnavailableView("No Act Frame yet.", systemImage: "scribble.variable", description: Text("Copy paste a source to the left and press the analyze button to get started."))
            Spacer()
            InputFieldView(text: .constant(""), onSubmit: {_ in})
                .opacity(0)
        }
    }
}

#Preview {
    FramesStartupView()
}
