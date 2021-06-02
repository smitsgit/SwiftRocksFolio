//
//  ContentView.swift
//  SwiftRocksFolio
//
//  Created by Smital on 01/06/21.
//  Copyright © 2021 IoSmit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Project.entity(), sortDescriptors: []) var projects: FetchedResults<Project>
    var body: some View {
        VStack {
            List {
                ForEach(projects, id: \.self) { item in
                    Text(item.title ?? "Unknown")
                }
            }

            Button("Tap me") {
                for i in 1...5 {
                    let project = Project(context: self.moc)
                    project.title = "Project \(i)"
                    project.items = []
                    project.creationDate = Date()
                    project.closed = Bool.random()
                }

                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
