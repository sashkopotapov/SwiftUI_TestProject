//
//  FavouritesListView.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//

import SwiftUI

struct FavouritesListView: View {
    @ObservedObject var dataManager: DataManager
    
    @State private var shouldShowSheet = false
        
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.favouriteNotes) { note in
                    NoteRowView(note: note)
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
            .navigationBarTitle("Favourite Notes")
        }
        .padding()
    }
    
    func delete(for offset: IndexSet) {
        dataManager.favouriteNotes.remove(atOffsets: offset)
    }
    
    func move(from offset: IndexSet, to index: Int) {
        dataManager.favouriteNotes.move(fromOffsets: offset, toOffset: index)
    }
}

