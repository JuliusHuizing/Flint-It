//
//  PreconditionsView.swift.swift
//  Flint-It
//
//  Created by Songyu Ren on 2024/1/22.
//

import SwiftUI
import Foundation

// Define your data structures here
struct Condition: Identifiable, Codable {
    var id = UUID()
    let condition: String
}

struct NestedCondition: Codable {
    let not: Condition
}

struct Preconditions: Codable {
    let and: [NestedCondition]
    let or: [Condition]
    let not: NestedCondition
}

// Define your view
struct PreconditionsView: View {
    var preconditions: Preconditions

    var body: some View {
        VStack(alignment: .leading) {
            Text("AND Conditions (All must be met):").bold()
            ForEach(preconditions.and, id: \.not.condition) { nestedCondition in
                Text("- \(nestedCondition.not.condition)")
            }

            Text("OR Conditions (Any one is sufficient):").bold().padding(.top)
            ForEach(preconditions.or, id: \.condition) { condition in
                Text("- \(condition.condition)")
            }

            Text("NOT Condition:").bold().padding(.top)
            Text("- \(preconditions.not.not.condition)")
        }
    }
}
