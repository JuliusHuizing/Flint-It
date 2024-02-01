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
    
    static func chat(usingLastMessageOf chat: Chat) async throws -> Components.Schemas.ChatResponse {
        let client: APIProtocol = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        let fullHistory: Components.Schemas.Messages = chat.messagesV2
        let response = try await client.post_sol_chat(body: .json(.init(messages: fullHistory)))
        switch response {
            case let .ok(okResponse):
                switch okResponse.body {
                case .json(let json):
                    return json
                }
            

        case .undocumented(statusCode: let statusCode, let smth):
            throw Errors.undocumentedResponse
            
        default:
            throw Errors.undocumentedResponse

        }
        
    }
    
//    static var urlConfig: URLSessionConfiguration {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 60 // Request timeout interval in seconds
//        configuration.timeoutIntervalForResource = 60 // Reso
//        return configuration
//    }
    static func chatWithActFrameWorker(usingLastMessageOf chat: Chat) async throws -> Components.Schemas.ChatResponse {
      
        let client: APIProtocol = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let fullHistory: Components.Schemas.Messages = chat.messagesV2
        let response = try await client.post_sol_chatWithActFrameWorker(body: .json(.init(messages: fullHistory)))
        
        switch response {
            case let .ok(okResponse):
                switch okResponse.body {
                case .json(let json):
                    return json
                }
            

        case .undocumented(statusCode: let statusCode, let smth):
            throw Errors.undocumentedResponse
            
        default:
            throw Errors.undocumentedResponse

        }
        
    }
//    static func requestActFrame(for article: String) async throws -> Components.Schemas.ActFrame {
//            let client: APIProtocol = Client(
//                serverURL: try! Servers.server1(),
//                transport: URLSessionTransport()
//            )
//    
//            
//                let response = try await client.post_sol_computeActFrame(body: .json(.init(message: article)))
//    
//                switch response {
//    
//                    case let .ok(okResponse):
//                        switch okResponse.body {
//                        case .json(let json):
//                            return json
//                        }
//    
//                case .undocumented(statusCode: let statusCode, let smth):
//                    throw Errors.undocumentedResponse
//    
//                }
//            
//        }
}
