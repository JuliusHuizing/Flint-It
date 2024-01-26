//
//  InputHandler.swift
//  Flint-It
//
//  Created by Julius Huizing on 25/01/2024.
//

import Foundation
import OpenAPIURLSession


class InputHandler {
    enum Errors: Error {
        case undocumentedResponse
    }
    static func requestActFrame(for article: String) async throws -> Components.Schemas.ActFrame {
            let client: APIProtocol = Client(
                serverURL: try! Servers.server1(),
                transport: URLSessionTransport()
            )
    
            
                let response = try await client.post_sol_computeActFrame(body: .json(.init(message: article)))
    
                switch response {
    
                    case let .ok(okResponse):
                        switch okResponse.body {
                        case .json(let json):
                            return json
                        }
    
                case .undocumented(statusCode: let statusCode, let smth):
                    throw Errors.undocumentedResponse
    
                }
            
        }
}
