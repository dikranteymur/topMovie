//
//  Extension+String.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import Foundation

extension String {
    
    var toDateString: String {
        let firstDateFormatter = DateFormatter()
        let lastDateFormatter = DateFormatter()
        firstDateFormatter.dateFormat = "yyyy-mm-dd"
        lastDateFormatter.dateFormat = "dd.mm.yyyy"
        if let date = firstDateFormatter.date(from: self) {
            return lastDateFormatter.string(from: date)
        }
        return self
    }
}
