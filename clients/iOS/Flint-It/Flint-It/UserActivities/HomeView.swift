//
//  HomeView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI

struct HomeView: View {
    @State var text: String = ""
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(1..<10) { articleNumber in
                    Text("Article \(articleNumber)")
                }
            }
             } content: {
                 VStack(alignment: .center) {
//                     Text("Source")
//                         .font(.title.bold())
                   InputNormView()
                     
                 }
             } detail: {
                 SwiftUI.List {
                     Group {
                         Section("🔫 Action") {
                             Text("saff")
                         }
                         Section("👱🏻‍♂️ Actor") {
                             Text("saff")
                         }
                     }
                     .headerProminence(.increased)
                 }
//                     .navigationTitle("test")
             }
             .navigationTitle("Flint-it")

         }
    

    }


#Preview {
    HomeView()
}
