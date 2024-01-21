//
//  ActFrame.swift
//  Flint-It
//
//  Created by Julius Huizing on 19/01/2024.
//

import Foundation
import Foundation

// MARK: - MainResponse
struct MainResponse: Codable {
    let action, actor, object, recipient: String
    let preconditions: [Precondition]
    let creatingPostcondition, terminatingPostcondition, referencesToSources: [String]

    enum CodingKeys: String, CodingKey {
        case action = "Action"
        case actor = "Actor"
        case object = "Object"
        case recipient = "Recipient"
        case preconditions = "Preconditions"
        case creatingPostcondition = "Creating_postcondition"
        case terminatingPostcondition = "Terminating_postcondition"
        case referencesToSources = "References_to_sources"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let condition: String
}

// MARK: - NotCondition
struct NotCondition: Codable {
    let not: ConditionUnion

    enum CodingKeys: String, CodingKey {
        case not = "NOT"
    }
}

// MARK: - ConditionUnion
enum ConditionUnion: Codable {
    case condition(Condition)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Condition.self) {
            self = .condition(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ConditionUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ConditionUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .condition(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - AndConditions
struct AndConditions: Codable {
    let and: [ConditionUnion]

    enum CodingKeys: String, CodingKey {
        case and = "AND"
    }
}

// MARK: - OrConditions
struct OrConditions: Codable {
    let or: [ConditionUnion]

    enum CodingKeys: String, CodingKey {
        case or = "OR"
    }
}

// MARK: - NotConditions
struct NotConditions: Codable {
    let not: [ConditionUnion]

    enum CodingKeys: String, CodingKey {
        case not = "NOT"
    }
}

// MARK: - Precondition
enum Precondition: Codable {
    case andConditions(AndConditions)
    case orConditions(OrConditions)
    case notConditions(NotConditions)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(AndConditions.self) {
            self = .andConditions(x)
            return
        }
        if let x = try? container.decode(OrConditions.self) {
            self = .orConditions(x)
            return
        }
        if let x = try? container.decode(NotConditions.self) {
            self = .notConditions(x)
            return
        }
        throw DecodingError.typeMismatch(Precondition.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Precondition"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .andConditions(let x):
            try container.encode(x)
        case .orConditions(let x):
            try container.encode(x)
        case .notConditions(let x):
            try container.encode(x)
        }
    }
}


// MARK: - MOCK

//extension MainResponse {
//    static func createMock() -> MainResponse {
//        // Preconditions
//        let condition1 = Condition(condition: "regular residence permit is granted from the day on which the alien has demonstrated that he meets all conditions")
//        let notCondition1 = NotCondition(not: .string("residence permit granted earlier than from the day on which the application was received"))
//        let notCondition2 = NotCondition(not: .string("alien has a travel ban or has been signaled for the purpose of refusing entry"))
//        let notCondition3 = NotCondition(not: .string("alien has pronouncement of undesirability"))
//        let andConditions = AndConditions(and: [.condition(condition1), .condition(notCondition2), .condition(notCondition3)])
//        let precondition = Precondition.andConditions(andConditions)
//
//        // Creating postcondition
//        let creatingPostcondition = [
//            "decision to grant an application to provide a temporary regular residence permit",
//            "granting a temporary regular residence permit under restrictions",
//            "determine the period of validity of the regular residence permit",
//            "provide the alien with a document proving lawful residence"
//        ]
//
//        // Terminating postcondition
//        let terminatingPostcondition = ["application to provide a temporary regular residence permit"]
//
//        // References to sources
//        let referencesToSources = ["Art. 14 (1) Aliens Act, main clause and under (a)"]
//
//        return MainResponse(
//            action: "grant",
//            actor: "Minister of Justice and Security",
//            object: "application to provide a temporary regular residence permit",
//            recipient: "alien",
//            preconditions: [precondition],
//            creatingPostcondition: creatingPostcondition,
//            terminatingPostcondition: terminatingPostcondition,
//            referencesToSources: referencesToSources
//        )
//    }
//}
//
