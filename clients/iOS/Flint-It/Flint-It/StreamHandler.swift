////
////  InputHandler.swift
////  Flint-It
////
////  Created by Julius Huizing on 25/01/2024.
////
//
//import Foundation
//import OpenAPIURLSession
//
//
//class StreamHandler {
//    enum Errors: Error {
//        case undocumentedResponse
//        case invalidResponseType
//    }
//    
//    // Define an AsyncStream type to publish server messages
//    typealias MessageStream = AsyncStream<String>
//    
//    static private func requestActFrame(for article: String) async throws -> String {
//        let client: APIProtocol = Client(
//            serverURL: try! Servers.server1(),
//            transport: URLSessionTransport()
//        )
//        
//        
//        let response = try await client.post_sol_stream_reasoning(body: .json(.init(message: article)))
//        switch response {
//        case .ok(let okResponse):
//            switch okResponse.body {
//            case .text_event_hyphen_stream(let body):
//                return "yes"
//            }
//           
//        default:
//            return "no"
//        }
//
//            
//    
//    }
//    
//    static func download(_ url: URL, progressHandler: (Float) -> Void, completion: (Result<Data, Error>) -> Void) throws {
//        // .. Download implementation
//    }
//    
//    static private func requestActFrame(for article: String) -> String {
//        let result = Task {
//            let client: APIProtocol = Client(
//                serverURL: try! Servers.server1(),
//                transport: URLSessionTransport()
//            )
//            
//            
//            let response = try await client.post_sol_stream_reasoning(body: .json(.init(message: article)))
//            switch response {
//                
//            case let .ok(okResponse):
//                switch okResponse.body {
//                case .text_event_hyphen_stream(let httpBody):
//                    return "test"
//                    
//                }
//                
//                
//            case .undocumented(statusCode: let statusCode, let smth):
//                throw Errors.undocumentedResponse
//                
//            }
//        }
//        return result.val
//        
//    }
//    
//    static public func fetchChat(for message: String) async throws -> AsyncThrowingStream<String, Error> {
//        AsyncThrowingStream { continuation in
//            do {
//                try await Self.requestActFrame(for: <#T##String#>)
//                
//            }
//            catch {
//                
//            }
//        }
//    }
//    
//    
//    
//    //    // A method to start processing messages
//    //    static func processMessage(for article: String) -> MessageStream {
//    //        return MessageStream { continuation in
//    //            Task {
//    //                do {
//    //                    // Connect to the server
//    //                    let client: APIProtocol = Client(
//    //                        serverURL: try Servers.server1(),
//    //                        transport: URLSessionTransport()
//    //                    )
//    //
//    //                    // Make the request and handle the response
//    //                    let response = try await client.post_sol_stream_reasoning(body: .json(.init(message: article)))
//    //
//    //                    switch response {
//    //                    case let .ok(okResponse):
//    //                        switch okResponse.body {
//    //                        case .text_event_hyphen_stream(let httpBody):
//    //
//    //                            continuation.yield("test")
//    ////                            httpBody.data
//    ////                            // Process the httpBody and yield it to the stream
//    ////                            continuation.yield(httpBody)
//    //
//    //                            // Finish the stream after processing the httpBody
//    //                            continuation.finish()
//    //
//    //                        default:
//    //                            throw Errors.invalidResponseType
//    //                        }
//    //
//    //                    case .undocumented(statusCode: _, _):
//    //                        throw Errors.undocumentedResponse
//    //                    }
//    //                } catch {
//    //                    // Handle any errors
//    //                    continuation.finish(throwing: error)
//    //                }
//    //            }
//    //        }
//    //    }
//    //}
//}
