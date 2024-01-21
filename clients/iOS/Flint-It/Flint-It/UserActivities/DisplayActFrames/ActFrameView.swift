//
//  ActFrameView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

struct ActFrameView: View {
    @Binding var frame: Components.Schemas.ActFrame?
    var body: some View {
        SwiftUI.List {
            if let frame {
                VStack {
                    Text(frame.Actor)
                }
            } else {
                Text("No Act Frame yet")
            }
        }
       
        
    }
}


