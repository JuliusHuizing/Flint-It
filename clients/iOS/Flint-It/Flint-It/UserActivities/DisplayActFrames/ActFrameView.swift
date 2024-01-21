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
                Section("Actor") {
                    Text(frame.Actor)
                }
                Section("Action") {
                    Text(frame.Action)
                }
                Section("Object") {
                    Text(frame.Recipient)
                }
                Section("Recipient") {
                    Text(frame.Recipient)
                }
                Section("Preconditions") {
//                    PreconditionsView(conditions: frame.Preconditions)
                }
                Section("Creating Post-Conditions") {
                    ForEach(frame.Creating_postcondition, id: \.self) { postcondition in
                        Text(postcondition)
                    }
                }
                Section("Terminating Post-Conditions") {
                    ForEach(frame.Terminating_postcondition, id: \.self) { postcondition in
                        Text(postcondition)
                    }
                }
                Section("Reference to Sources") {
                    ForEach(frame.References_to_sources, id: \.self) { reference in
                        Text(reference)
                    }
                }
               
            } else {
                Text("No Act Frame yet")
            }
        }
       
        
    }
}


