//
//  Date+monthName.swift
//  
//
//  Created by Breno Aquino on 08/02/22.
//

import Foundation

public extension Date {
    static func monthName(month: Int) -> String {
        let formatter = DateFormatter(pattern: "MMMM")
        formatter.locale = Locale.preferred
        return formatter.monthSymbols[month - 1]
    }
}
