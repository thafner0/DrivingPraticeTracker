//
//  Dashboard.swift
//  DrivingPraticeTracker
//
//  Created by Trevor Hafner on 4/13/26.
//

import SwiftUI

struct Dashboard: View {
    @State var username = "Trevor"
    @State var goalTime: Double = 50 * 3600
    @State var accruedTime: Double = 36 * 3600
    
    var body: some View {
        List {
            Section {
                DashboardProgressCell(username: $username, goalTime: $goalTime, accruedTime: $accruedTime)
            }
            
            Section {
                Button("Record Session", systemImage: "stopwatch.fill") {
                    // open sheet with stopwatch recording view
                }
            }
            
            Section {
                Button("Switch User", systemImage: "person.fill.and.arrow.left.and.arrow.right.outward") {
                    // pop up menu or sheet to select new user
                }
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
