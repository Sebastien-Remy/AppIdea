//
//  AppIdeaListRow.swift
//  AppIdea
//
//  Created by Sebastien REMY on 05/08/2023.
//

import SwiftUI

struct AppIdeaListRow: View {
    @Environment(\.modelContext) private var modelContext
    var idea: AppIdea
    private var  d = Label("Delete", systemImage: "trash")
    var body: some View {
        NavigationLink(value: idea) {
            VStack(alignment: .leading){
                Text(idea.name)
                Text(idea.detailedDescription)
                    .textScale(.secondary)
                    .foregroundStyle(.secondary)
            }
        }
        .swipeActions {
            Button(role: .destructive,
                   action: { modelContext.delete(idea) },
                   label: { Label("Delete", systemImage: "trash") }
            )
        }
    }
}


