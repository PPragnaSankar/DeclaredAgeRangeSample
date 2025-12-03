//
//  ContentView.swift
//  Child-P
//
//  Created by Audumbar.Phadte on 21/07/25.
//

import SwiftUI
import DeclaredAgeRange

struct ContentView: View {
    @State var advancedFeaturesEnabled = false
    @Environment(\.requestAgeRange) var requestAgeRange

    var body: some View {
        VStack {
            Text("App running on parent device...")
                .font(.title)
                .padding()
                
                
            Button("Advanced Features") {
                // Feature available only for certain age range
            }
            .bold()
            .disabled(!advancedFeaturesEnabled)
        }
        .task {
            await requestAgeRangeHelper()
        }
    }

    func requestAgeRangeHelper() async {
        do {
            let ageRangeResponse = try await requestAgeRange(ageGates: 18)
            switch ageRangeResponse {
            case let .sharing(range):
                if let lowerBound = range.lowerBound, lowerBound >= 18 {
                    advancedFeaturesEnabled = true
                    // Adult
                } else {
                    advancedFeaturesEnabled = false
                    // Teen
                }
            case .declinedSharing:
                // Handle declined sharing
                print("declinedSharing")
                break
            @unknown default:
                print("Unknown case \(ageRangeResponse)")
            }
        } catch (let error){
            print(error)
            // Handle error (invalid request or age range service not available)
        }
    }
}
