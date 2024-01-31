import SwiftUI
import OpenAPIURLSession
struct BooleanSetView: View {
    let booleanSet: Components.Schemas.BooleanSet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let condition = booleanSet.condition {
                Text(condition)
            }
            if let andConditions = booleanSet.and {
                Text("AND")
                    .bold()
                ForEach(andConditions, id: \.self) { condition in
                    BooleanSetView(booleanSet: condition)
                        .padding(.leading, 20)
                }
            }
            if let orConditions = booleanSet.or {
                Text("OR")
                    .bold()
                ForEach(orConditions, id: \.self) { condition in
                    BooleanSetView(booleanSet: condition)
                        .padding(.leading, 20)
                }
            }
            if let notCondition = booleanSet.not {
                Text("NOT")
                    .bold()
                BooleanSetView(booleanSet: notCondition)
                    .padding(.leading, 20)
            }
        }
    }
}
