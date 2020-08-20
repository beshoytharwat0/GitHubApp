//
//  Date+Ext.swift
//  GitProject
//
//  Created by Mac on 7/2/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat () -> String{
     let dateformatter = DateFormatter()
    dateformatter.dateFormat  = "MMM yyyy"
        
        return dateformatter.string(from: self)
    }
    
    
}
