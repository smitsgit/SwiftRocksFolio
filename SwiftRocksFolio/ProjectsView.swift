//
//  ProjectsView.swift
//  SwiftRocksFolio
//
//  Created by Smital on 02/06/21.
//  Copyright © 2021 IoSmit. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    @Environment(\.managedObjectContext) var moc
    let showClosedProjects: Bool
    let projects: FetchRequest<Project>

    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects
        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
        ], predicate: NSPredicate(format: "closed = %d", showClosedProjects))
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(projects.wrappedValue, id: \.self) { project in
                    Section(header: Text(project.projectTitle)) {
                        ForEach(project.projectItems, id:\.self) { item in
                            Text(item.itemTitle)
                        }
                    }
                }
            }.navigationBarTitle(showClosedProjects ? "Closed Projects" : "Open Projects")
        }
    }
}



