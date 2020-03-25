//
//  AddNewNote.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//

import SwiftUI

struct AddNewNoteView: View {
    
    let dataManager: DataManager
    
    @State var title        = ""
    @State var isFavourite  = false
    @State var selectedType = 0
    @State var text         = ""
    @State var dueDate      = Date()
    @State var createdAt    = ""

    var types = ["To do", "Later", "Reminder", "Event"]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    let note = Note(
                        title: self.title,
                        text: self.text,
                        isFavourite: self.isFavourite,
                        isDeleted: false,
                        dueDate: self.dueDate,
                        createdAt: self.createdAt,
                        type: self.types[self.selectedType]
                    )

                    self.dataManager.addNew(note)

                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .foregroundColor(Color.green)
                }
                .disabled(title.isEmpty && text.isEmpty)
            }
            
            TextField("Enter title here", text: $title)
            Toggle(isOn: $isFavourite) { Text("Favourite") }
            Picker(selection: $selectedType, label: Text("Pick\nnote\ntype")) {
               ForEach(0 ..< types.count) {
                    Text(self.types[$0])
               }
            }
            
            HStack {
                Text("Note type: ")
                    .font(.headline)
                Text("\(types[selectedType])")
                Spacer()
            }
            
            HStack {
                Text("Created at: ")
                    .font(.headline)
                Text("\(Helpers.getCurrentDate())")
               Spacer()
            }
            
            if selectedType == 0 {
                DatePicker(selection: $dueDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select\na date")
                }

                HStack {
                    Text("Due date: ")
                        .font(.headline)
                    Text("\(dueDate, formatter: dateFormatter)")
                    Spacer()
                }
            }
            
            TextView(text: $text)
        }
        .padding()
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct AddNewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView(dataManager: DataManager())
    }
}
