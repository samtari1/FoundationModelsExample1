//
//  ContentView.swift
//  FoundationModelsExample1
//
//  Created by Quanpeng Yang on 3/5/26.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @State private var response = ""

    var body: some View {
        VStack {
            Button("Send") {
                let prompt = "Write a paragraph describing a unicorn"
                let session = LanguageModelSession()
                
                if !session.isResponding {
                    Task {
                        do {
                            let answer = try await session.respond(to: prompt)
                            response = answer.content
                        } catch {
                            response = "Error accessing the model: \(error)"
                        }
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text(response)
                .font(.system(size: 18))
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
