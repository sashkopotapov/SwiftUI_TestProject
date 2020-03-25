//
//  NoteListView.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//
import SwiftUI

struct NoteRowView: View {
    let note: Note
    
    var body: some View {
        HStack {
           Text(note.title)
               
           Spacer()
           
           if note.isFavourite {
               Image(systemName: "star.fill").foregroundColor(Color.yellow)
           }
        }
    }
}


struct NotesListView: View {
    @ObservedObject var dataManager: DataManager
    
    @State private var shouldShowSheet = false
        
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.regularNotes) { note in
                     HStack {
                       Text(note.title)
                       
                       Spacer()
                       
                       if note.isFavourite {
                            Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        }
                    }
                }
                .onMove(perform: move(from:to:))
                .onDelete(perform: delete(for:))
            }
            .navigationBarItems(
                trailing: HStack {
                    Button(
                        action: {
                            self.shouldShowSheet.toggle()
                        },
                        label: {
                            Text("Add")
                        }
                    )
                    .sheet(isPresented: $shouldShowSheet) {
                        AddNewNoteView(dataManager: self.dataManager)
                    }
                
                    Spacer()
                        .frame(width: 25.0)
                    
                    EditButton()
                }
            )
            .navigationBarTitle("Notes")
        }
        .padding()
    }
    
    func delete(for offset: IndexSet) {
        dataManager.deleteRegularNotes(at: offset)
    }
    
    func move(from offset: IndexSet, to index: Int) {
        dataManager.regularNotes.move(fromOffsets: offset, toOffset: index)
    }
}




