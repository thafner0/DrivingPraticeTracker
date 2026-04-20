//
//  Learner.swift
//  DrivingPraticeTracker
//
//  Created by Trevor Hafner on 4/20/26.
//

import Foundation
import Playgrounds

class Learner: Identifiable, Codable {
    var id = UUID() // remove when SwiftData usage is implemented
    
    var name = ""
    var drivingLicenseOrPermitNumber = ""
    var supervisorRequired = true
    var goal: Goal?
    
    enum CodingKeys: CodingKey {
        case name
        case drivingLicenseOrPermitNumber
        case supervisorRequired
        case goal
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.drivingLicenseOrPermitNumber = try container.decode(String.self, forKey: .drivingLicenseOrPermitNumber)
        self.supervisorRequired = try container.decode(Bool.self, forKey: .supervisorRequired)
        self.goal = try container.decode(Goal.self, forKey: .goal)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.drivingLicenseOrPermitNumber, forKey: .drivingLicenseOrPermitNumber)
        try container.encode(self.supervisorRequired, forKey: .supervisorRequired)
        try container.encode(self.goal, forKey: .goal)
    }
    
    init(name: String, drivingLicenseOrPermitNumber: String, supervisorRequired: Bool = true, goal: Goal?) {
        self.name = name
        self.drivingLicenseOrPermitNumber = drivingLicenseOrPermitNumber
        self.supervisorRequired = supervisorRequired
        self.goal = goal
    }
}

struct Goal: Codable {
    var minimumTimePeriodLength: DateComponents?
    var components: [Component]
    
    struct Component: Codable {
        var conditions: [Condition] = Condition.allCases
        var hours: Int?
        var distance: Measurement<UnitLength>?
        
        enum Condition: String, Codable, CaseIterable {
            case day
            case night
        }
    }
}
