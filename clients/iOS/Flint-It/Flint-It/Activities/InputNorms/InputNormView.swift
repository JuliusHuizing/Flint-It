//
//  InputNormView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI

struct InputNormView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            TextField("Source", text: $text)
            Button("Analyze") {
                //
            }
        }
    }
}

#Preview {
    InputNormView()
}
