import SwiftUI
import OpenAPIURLSession
struct BooleanSetView: View {
    @State var booleanSet: Components.Schemas.BooleanSet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let condition = booleanSet.condition {
                TextField("Condition", text: $booleanSet.condition.toUnwrapped(defaultValue: ""))
                    .background(.red.opacity(0))
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.secondary)
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
extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
