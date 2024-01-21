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
    let client: APIProtocol = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    @State var text: String = ""
    var body: some View {
        VStack {
            TextField("Source", text: $text)
            Button("Analyze") {
                print("pressed")
                Task {
                    try await requestActFrame(for: self.text)
                }
            }
        }
    }
    func requestActFrame(for article: String) async throws {
        
        let response = try await client.post_sol_computeActFrame(body: .json(.init(message: article)))
        switch response {
              case let .ok(okResponse):
                  switch okResponse.body {
      
                  case .json(let json):
                      
                      print("got")
                      print(json)
                 
                  }
      
        case .undocumented(statusCode: let statusCode, let smth): 
            break

              }
    }
}

#Preview {
    InputNormView()
}
