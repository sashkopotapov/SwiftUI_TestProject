//
//  DataManager.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//

import Foundation
import Combine

class DataManager: ObservableObject {
    
    // MARK: - Properties
    @Published var regularNotes: [Note] = []
    @Published var deletedNotes: [Note] = []
    @Published var favouriteNotes: [Note] = []
    
    
    init() {
        regularNotes = [
            Note(title: "Call Nazar", text: "Text 1", isFavourite: false, isDeleted: false, createdAt: "", type: "To do"),
            Note(title: "Forget to forget", text: "Text 1", isFavourite: false, isDeleted: false, createdAt: "", type: "To do"),
            Note(title: "Message Serj", text: "Text 1", isFavourite: false, isDeleted: false, createdAt: "", type: "To do")
        ]
    }
    
    func deleteRegularNotes(at offset: IndexSet) {
        for index in offset {
            let note = regularNotes.remove(at: index)
            deletedNotes.append(note)
        }
    }
    
    func addNew(_ note: Note) {
        if note.isFavourite { favouriteNotes.append(note) }
        regularNotes.append(note)
    }
    
    func toggleIsFavourite(_ note: Note) {
        for (index, value) in regularNotes.enumerated() {
            if value.id == note.id {
                regularNotes[index].isFavourite = !regularNotes[index].isFavourite
            }
        }
    }
    
}

// MARK: - Private Methods
private extension DataManager {
   
}

