//
//  TabView.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var dataManager: DataManager
    
    var body: some View {
        TabView {
            NotesListView(dataManager: dataManager)
          .tabItem {
             Image(systemName: "list.dash")
             Text("Notes")
           }
            FavouritesListView(dataManager: dataManager)
          .tabItem {
             Image(systemName: "star.fill")
             Text("Favourites")
           }
            DeletedListView(dataManager: dataManager)
            .tabItem {
               Image(systemName: "folder.fill.badge.minus")
               Text("Deleted")
             }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(dataManager: DataManager())
    }
}

//struct NotesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesListView(dataManager: DataManager())
//    }
//}
//
//struct FavouritesLisView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesListView(dataManager: DataManager())
//    }
//}
//
//struct AddNewNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewNoteView(dataManager: DataManager())
//    }
//}
