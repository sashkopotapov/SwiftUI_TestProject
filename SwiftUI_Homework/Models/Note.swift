//
//  Note.swift
//  SwiftUI_Homework
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//
import Foundation

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var text: String
    var isFavourite: Bool
    var isDeleted: Bool
    var dueDate: Date?
    var createdAt: String
    var type: String
}
