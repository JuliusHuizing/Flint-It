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
                .foregroundColor(.orange)

            Text(norm)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.secondary)
               
//                .shadow(color: .black.opacity(0.05), radius: 10)


        }
        .padding()
        .background(
            backgroundColor,
           in: RoundedRectangle(cornerRadius: cornerRadii, style: .continuous)
        )
       
    }
}

//#Preview {
//    NormView()
//}
