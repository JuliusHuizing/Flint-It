//
//  NormView.swift
//  Flint-It
//
//  Created by Julius Huizing on 29/01/2024.
//

import SwiftUI

struct NormView: View {
    let norm: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Norm")
                .font(.largeTitle)
                .padding(.bottom)
            Text(verbatim: "\"\(norm)\"")
        }
        .foregroundStyle(.orange)
    }
}

//#Preview {
//    NormView()
//}
