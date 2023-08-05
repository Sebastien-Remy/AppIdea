//
//  AppFeature.swift
//  AppIdea
//
//  Created by Sebastien REMY on 05/08/2023.
//

import Foundation
import SwiftData

@Model
class AppFeature {
    @Attribute(.unique) var detailedDescription: String
    var creationDate: Date
    
    init(detailedDescription: String) {
        self.detailedDescription = detailedDescription
        self.creationDate = .now
    }
}
