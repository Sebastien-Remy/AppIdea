//
//  AppIdea.swift
//  AppIdea
//
//  Created by Sebastien REMY on 05/08/2023.
//

import Foundation
import SwiftData

@Model
class AppIdea {
    @Attribute(.unique) var name: String
    var detailedDescription : String
    var creationDate: Date
    
    init(name: String, detailedDescription: String) {
        self.name = name
        self.detailedDescription = detailedDescription
        self.creationDate = .now
    }
    
    @Relationship(.cascade) var features: [AppFeature] = []
}
