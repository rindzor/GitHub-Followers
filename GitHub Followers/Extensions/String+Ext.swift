//
//  String+Ext.swift
//  GitHub Followers
//
//  Created by  mac on 12.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import Foundation

extension String {
    
    func converteToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.converteToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
