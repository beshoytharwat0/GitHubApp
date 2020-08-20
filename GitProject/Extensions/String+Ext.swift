//
//  String+Ext.swift
//  GitProject
//
//  Created by Mac on 7/2/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.locale     = NSLocale.init(localeIdentifier:"en_US_POSIX") as Locale
        return dateFormatter.date(from: self)
    }
    
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else {return "N/A"}
        
        return date.convertToMonthYearFormat()
    }
    
}
