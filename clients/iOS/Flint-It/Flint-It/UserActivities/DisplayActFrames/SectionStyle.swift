//
//  SectionStyle.swift
//  Flint-It
//
//  Created by Julius Huizing on 31/01/2024.
//

import SwiftUI

struct SectionStyle: View {
    var body: some View {
        SwiftUI.List {
            Group {
                Section {
                    Text("Test")
                } header: {
                    Text("test")
                        .font(.largeTitle)
                }
                
                Section {
                    Text("Test")
                } header: {
                    Text("test")
                        .font(.largeTitle)
                }
            }
            .listRowSeparator(.hidden)


        }
        .listStyle(.inset)
        .listSectionSeparator(.hidden)
        
        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    SectionStyle()
}
