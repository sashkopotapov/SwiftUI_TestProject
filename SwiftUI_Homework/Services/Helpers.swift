//
//  Helpers.swift
//  SwiftUI_Homework
//
//  Created by Mac on 24.03.2020.
//  Copyright © 2020 opotapov. All rights reserved.
//

import Foundation

class Helpers {
    static func getCurrentDate() -> String {
        let now = Date()
        let formatterDate = DateFormatter()
        let formatterTime = DateFormatter()
        
        formatterDate.dateStyle = .medium
        formatterTime.timeStyle = .short
        
        let dateString = formatterDate.string(from: now)
        let timeString = formatterTime.string(from: now)
        return dateString + " " + timeString
    }
}
