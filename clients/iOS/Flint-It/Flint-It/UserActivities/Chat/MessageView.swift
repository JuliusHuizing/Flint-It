//
//  MessageView.swift
//  Flint-It
//
//  Created by Julius Huizing on 26/01/2024.
//

import Foundation
import SwiftUI


struct MessageView: View {
    let message: Message
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(message.sender.rawValue)
                .font(.headline.bold())
            Text(message.message)
                .foregroundStyle(.secondary)
        }
               }
}
