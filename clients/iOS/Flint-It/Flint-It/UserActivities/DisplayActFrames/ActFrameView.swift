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
    var frame: Components.Schemas.ActFrame
    var body: some View {

                SwiftUI.List {
                    Section {
                        Text(frame.Actor)
                    } header: {
                        Text("Actor")
                            .font(font)
                    }
                    
                    Section {
                        Text(frame.Action)
                    }
                    header: {
                        Text("Action")
                            .font(font)
                    }
                    
                    Section {
                        Text(frame.Object)
                    } header: {
                        Text("Object")
                            .font(font)
                    }
                    
                    
                    Section {
                        Text(frame.Recipient)
                    }
                             header: {
                                 Text("Recipient")
                                     .font(font)
                             }
                    
                    Section {
                        BooleanSetView(booleanSet: frame.Preconditions)
                        //                    PreconditionsView(conditions: frame.Preconditions)
                    }
                header: {
                    Text("Pre-Conditions")
                        .font(font)
                }
                    Section{
                        ForEach(frame.Creating_postcondition, id: \.self) { postcondition in
                            Text(postcondition)
                        }
                    }
                header: {
                    Text("Creating Post-Conditions")
                        .font(font)
                }
                    Section {
                        ForEach(frame.Terminating_postcondition, id: \.self) { postcondition in
                            Text(postcondition)
                        }
                    }
                header: {
                    Text("Terminating Post-Conditions")
                        .font(font)
                }
                    Section{
                        ForEach(frame.References_to_sources, id: \.self) { reference in
                            Text(reference)
                        }
                    }
                header: {
                    Text("Reference to Sources")
                        .font(font)
                }
                   
                }
                
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                    
                }
            }



