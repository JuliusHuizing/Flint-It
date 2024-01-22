import Foundation
import SwiftUI

struct CircleButton: View {
    @State private var tapped = Bool()
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 105, height: 105)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 7, y: 7)
                Image(systemName: "swift")
                    .foregroundColor(.black)
                    .font(.system(size: 50, weight: .semibold))
            }
            .scaleEffect(tapped ? 0.95 : 1)
            .onTapGesture {
                tapped.toggle()
                counter += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    tapped = false
                }
            }
            Text("Tapped \(counter) times")
                .foregroundColor(.black)
                .font(.title2)
                .offset(y: 30)
        }
    }
}
