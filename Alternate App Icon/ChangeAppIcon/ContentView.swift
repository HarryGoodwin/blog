//
//  ContentView.swift
//  ChangeAppIcon
//
//  Created by Harry Goodwin on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    private let application = UIApplication.shared
    
    var body: some View {
        if application.supportsAlternateIcons {
            Button("Change app icon") {
                Task {
                    do {
                        try await application.setAlternateIconName(alternateIconNameToSet)
                    } catch {
                        print("error: \(error)")
                    }
                }
            }
        } else {
            Text("Alternate icons not supported")
        }
    }
    
    private var alternateIconNameToSet: String? {
        if application.alternateIconName == nil {
            return "AlternativeAppIcon1"
        } else {
            return nil
        }
    }
}

#Preview {
    ContentView()
}
