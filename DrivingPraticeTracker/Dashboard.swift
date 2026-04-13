//
//  Dashboard.swift
//  DrivingPraticeTracker
//
//  Created by Trevor Hafner on 4/13/26.
//

import SwiftUI

struct Dashboard: View {
    @State var username = "Trevor"
    
    var body: some View {
        List {
            // custom view
            
            Button("Record Session", systemImage: "stopwatch.fill") {
                // open sheet with stopwatch recording view
            }
            
            Button("Switch User", systemImage: "person.fill.and.arrow.left.and.arrow.right.outward") {
                // pop up menu or sheet to select new user
            }
        }
        .navigationTitle("\(username)'s Dashboard")
    }
}

#Preview {
    NavigationStack {
        Dashboard()
    }
}
