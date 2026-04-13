//
//  DashboardProgressCell.swift
//  DrivingPraticeTracker
//
//  Created by Trevor Hafner on 4/13/26.
//

import SwiftUI

struct DashboardProgressCell: View {
    @Binding var username: String
    @Binding var goalTime: Double
    @Binding var accruedTime: Double
    
    init(username: Binding<String>, goalTime: Binding<Double>, accruedTime: Binding<Double>) {
        self._username = username
        self._goalTime = goalTime
        self._accruedTime = accruedTime
    }
    
    private var completedDurationFormat = Duration.UnitsFormatStyle(allowedUnits: [.hours, .minutes], width: .wide)
    private var boundsDurationFormat = Duration.UnitsFormatStyle(allowedUnits: [.hours, .minutes], width: .narrow)
    
    var body: some View {
        VStack {
            Text("You're off to a good start this week \(username), keep up the good work!")
            
            Spacer()
            
            Gauge(value: accruedTime, in: 0...goalTime) {
                Text("Total Hours")
            } currentValueLabel: {
                Text(Duration.seconds(accruedTime), format: completedDurationFormat)
            } minimumValueLabel: {
                Text(Duration.seconds(0), format: boundsDurationFormat)
            } maximumValueLabel: {
                Text(Duration.seconds(goalTime), format: boundsDurationFormat)
            }
        }
    }
}

#Preview {
    List {
        DashboardProgressCell(username: .constant("Trevor"), goalTime: .constant(50 * 3600), accruedTime: .constant(Double.random(in: 0...50) * 3600))
    }
}
