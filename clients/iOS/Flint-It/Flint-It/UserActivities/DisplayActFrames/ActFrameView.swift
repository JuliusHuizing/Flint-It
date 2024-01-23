import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession
import ActivityIndicatorView

struct ActFrameView: View {
    @Binding var frame: Components.Schemas.ActFrame?
    @Binding var computingActFrame: Bool 
    var body: some View {
        if computingActFrame {
            VStack {
                Spacer()
                ActivityIndicatorView(isVisible: $computingActFrame, type: .opacityDots(count: 3, inset: 4))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Text("Constructing Act Frame")
                    .font(.headline.bold())
                Spacer()
            }
        } else {
            if let frame {
                SwiftUI.List {
                    Section("Actor") {
                        Text(frame.Actor)
                    }
                    Section("Action") {
                        Text(frame.Action)
                    }
                    Section("Object") {
                        Text(frame.Recipient)
                    }
                    Section("Recipient") {
                        Text(frame.Recipient)
                    }
                    Section("Preconditions") {
                        //                    PreconditionsView(conditions: frame.Preconditions)
                    }
                    Section("Creating Post-Conditions") {
                        ForEach(frame.Creating_postcondition, id: \.self) { postcondition in
                            Text(postcondition)
                        }
                    }
                    Section("Terminating Post-Conditions") {
                        ForEach(frame.Terminating_postcondition, id: \.self) { postcondition in
                            Text(postcondition)
                        }
                    }
                    Section("Reference to Sources") {
                        ForEach(frame.References_to_sources, id: \.self) { reference in
                            Text(reference)
                        }
                    }
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(width: 100, height: 100)
                    }
                }
            } else {
                VStack {
                    Spacer()
                    ContentUnavailableView("No Act Frame yet.", systemImage: "scribble.variable", description: Text("Copy paste a source to the left and press the analyze button to get started."))
                    Spacer()
                    InputFieldView(text: .constant(""), onSubmit: {_ in})
                        .opacity(0)
                    
                }
            }
        }
    }
       
        
    }



