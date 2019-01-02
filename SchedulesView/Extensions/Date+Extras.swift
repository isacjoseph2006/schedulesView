//
//  Date+Extras.swift
//  SchedulesView
//
//  Created by Isac Joseph on 30/12/18.
//  Copyright © 2018 Isac Joseph. All rights reserved.
//

import Foundation

extension Date
{
    func dateString() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func monthString() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        let dateString = formatter.string(from: self)
        return dateString
    }
}
