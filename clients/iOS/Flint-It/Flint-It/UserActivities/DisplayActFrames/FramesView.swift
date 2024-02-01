//
//  FramesView.swift
//  Flint-It
//
//  Created by Julius Huizing on 22/01/2024.
//

import SwiftUI

struct FramesView: View {
    enum FrameKind: String, CaseIterable {
        case act = "Act Frames"
        case fact = "Fact Frames"
    }
    @ObservedObject var chat: Chat
//    @State var showingFrame: Components.Schemas.ActFrame? = nil
//    @State var showingFrameKind: FrameKind = .act
  
    var body: some View {
        if chat.isComputingActFrame {
            ComputingActFrameView()
        }
        else if chat.frames.isEmpty {
            FramesStartupView()
        }
        else {
            LoadedFramesView(chat: chat)
        }
            
            
            
                
//                }
                
            }
          
            
        
    }


//#Preview {
//    Navigatio
//    FramesView()
//}
