//
//  ContentView.swift
//  AppIdea
//
//  Created by Sebastien REMY on 05/08/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var ideas: [AppIdea]
    @State private var showDialog: Bool  = false
    @State private var newName = ""
    @State private var newDescription = ""
    
    var body: some View {
        NavigationStack {
            List(ideas) { idea in
                NavigationLink(value: idea) {
                    VStack(alignment: .leading){
                        Text(idea.name)
                        Text(idea.detailedDescription)
                            .textScale(.secondary)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("App ideas")
            .navigationDestination(for: AppIdea.self) {
                EditAppIdeaView(idea: $0)
            }
            .toolbar {
                Button("Add") {
                    showDialog.toggle()
                }
            }
            .sheet(isPresented: $showDialog) {
                NavigationStack {
                    Form {
                        TextField("Name",
                                  text: $newName)
                        TextField("Description",
                                  text: $newDescription,
                                  axis: .vertical)
                    }
                    .navigationTitle("New Idea")
                  
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button("Dismiss") {
                                showDialog.toggle()
                            }
                            Button("Save") {
                                let idea = AppIdea(name: newName,
                                                   detailedDescription: newDescription)
                                modelContext.insert(idea)
                                showDialog.toggle()
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [AppIdea.self, AppFeature.self], inMemory: true)
}
