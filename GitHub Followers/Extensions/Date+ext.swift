//
//  Date+ext.swift
//  GitHub Followers
//
//  Created by  mac on 12.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM yyyy"
        
        return dateFormater.string(from: self)
    }
}
