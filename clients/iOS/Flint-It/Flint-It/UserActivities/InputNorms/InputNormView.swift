//
//  InputNormView.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

struct InputNormView: View {
    

    @State var text: String = ""
    var onSubmit: (String) -> Void
    var body: some View {
        VStack {
            TextField("Source", text: $text)
            Button("Analyze") {
                onSubmit(text)
            }
//                print("pressed")
//                Task {
//                    await requestActFrame(for: self.text)
//                }
//            }
            .disabled(text.isEmpty)
        }
    }
//    func requestActFrame(for article: String) async {
//        do {
//
//            let response = try await client.post_sol_computeActFrame(body: .json(.init(message: article)))
//            
//            switch response {
//                
//            case let .ok(okResponse):
//                switch okResponse.body {
//                    
//                case .json(let json):
//                    
//                    print("got")
//                    print(json)
//                    
//                }
//                
//            case .undocumented(statusCode: let statusCode, let smth):
//                break
//                
//            }
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
}

//#Preview {
//    InputNormView()
//}
