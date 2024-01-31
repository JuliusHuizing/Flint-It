//
//  ActFrameView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession
import ActivityIndicatorView

struct ActFrameView: View {
    var font: Font = .largeTitle

    @State var frame: Components.Schemas.ActFrame
    var body: some View {

                SwiftUI.List {
                    VStack(alignment: .leading) {
                        Text("Actor")
                            .font(font)
                        TextField("Actor", text: $frame.Actor)
                            .background(.red.opacity(0))
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Action")
                            .font(font)
                        TextField("Action", text: $frame.Action)
                            .background(.red.opacity(0))
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Object")
                            .font(font)
                        TextField("Object", text: $frame.Object)
                            .background(.red.opacity(0))
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Recipient")
                            .font(font)
                        TextField("Recipient", text: $frame.Recipient)
                            .background(.red.opacity(0))
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.secondary)
                    }
                    
//                    VStack(alignment: .leading) {
//                        Text("Actor")
//                            .font(font)
//                        TextField("Actor", text: $frame.Actor)
//                    }
                 
                    VStack(alignment: .leading) {
                        Text("Pre-Conditions")
                            .font(font)
                        BooleanSetView(booleanSet: frame.Preconditions)

                    }
                    VStack(alignment: .leading) {
                        Text("Creating Post-Conditions")
                            .font(font)
                        ForEach($frame.Creating_postcondition, id: \.self) { $postcondition in
                            TextField("Creating Post-Conditions", text: $postcondition)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                        }
                    }
                 
                    VStack(alignment: .leading) {
                        Text("Terminating Post-Conditions")
                            .font(font)
                        ForEach($frame.Terminating_postcondition, id: \.self) { $postcondition in
                            TextField("Terminating Post-Conditions", text: $postcondition)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Reference to Sources")
                            .font(font)
                        ForEach($frame.References_to_sources, id: \.self) { $postcondition in
                            TextField("Reference to Sources", text: $postcondition)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                                
                        }
                    }
                    
              
                   
                }
                
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                    
                }
            }



