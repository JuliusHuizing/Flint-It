//
//  MessageView.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation
import SwiftUI


struct MessageView: View {
    let message: Components.Schemas.Message
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(message.role?.rawValue ?? "unkown")
                .font(.headline.bold())
            Text(message.content ?? "no content")
                .foregroundStyle(.secondary)
        }
               }
}
