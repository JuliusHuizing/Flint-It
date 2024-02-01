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
    var font: Font = .title

    @Binding var frame: Components.Schemas.ActFrame
    @State var isFavorite = false
    var body: some View {

                SwiftUI.List {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("Actor")
                                .font(font)
                            TextField("", text: $frame.Actor)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                        }
                        VStack(alignment: .leading) {
                            Text("Action")
                                .font(font)
                            TextField("", text: $frame.Action)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                        }
                        VStack(alignment: .leading) {
                            Text("Object")
                                .font(font)
                            TextField("", text: $frame.Object)
                                .background(.red.opacity(0))
                                .textFieldStyle(.roundedBorder)
                                .foregroundStyle(.secondary)
                        }
                        VStack(alignment: .leading) {
                            Text("Recipient")
                                .font(font)
                            TextField("", text: $frame.Recipient)
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
                            if frame.Creating_postcondition.isEmpty {
                                TextField("", text: .constant(""))
                                    .background(.red.opacity(0))
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach($frame.Creating_postcondition, id: \.self) { $postcondition in
                                    TextField("", text: $postcondition)
                                        .background(.red.opacity(0))
                                        .textFieldStyle(.roundedBorder)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Terminating Post-Conditions")
                                .font(font)
                            if frame.Terminating_postcondition.isEmpty {
                                TextField("", text: .constant(""))
                                    .background(.red.opacity(0))
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach($frame.Terminating_postcondition, id: \.self) { $postcondition in
                                    TextField("", text: $postcondition)
                                        .background(.red.opacity(0))
                                        .textFieldStyle(.roundedBorder)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Reference to Sources")
                                .font(font)
                            if frame.References_to_sources.isEmpty {
                                TextField("", text: .constant(""))
                                    .background(.red.opacity(0))
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach($frame.References_to_sources, id: \.self) { $postcondition in
                                    TextField("", text: $postcondition)
                                        .background(.red.opacity(0))
                                        .textFieldStyle(.roundedBorder)
                                        .foregroundStyle(.secondary)
                                    
                                }
                            }
                        }
                    }
                    
              
                   
                }
                
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .overlay(alignment: .bottomTrailing) {
                    VStack {
                        Button {
                            withAnimation {
                                isFavorite.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: isFavorite ? "checkmark.circle.fill": "arrow.down.circle.fill")
                                    .foregroundStyle(Color.white, isFavorite ? Color.green : Color.accentColor)
                                if isFavorite {
                                    Text("Downloaded")
                                        .foregroundStyle(.secondary)
                                    
                                }
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                        .buttonStyle(.plain)
                    }
                    .font(.largeTitle)
                    .padding()
                }
                    
                }
      
            }



