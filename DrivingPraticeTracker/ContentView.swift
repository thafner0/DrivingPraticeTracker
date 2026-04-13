//
//  ContentView.swift
//  DrivingPraticeTracker
//
//  Created by Trevor Hafner on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Dashboard", systemImage: "house.and.flag.fill") {
                NavigationStack {
                    Dashboard()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
