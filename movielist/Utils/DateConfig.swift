//
//  DateConfig.swift
//  movielist
//
//  Created by Igor Pino de Souza on 07/05/21.
//

import Foundation


class DateConfig {
    
    
    func dateFormat(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFormatted = dateFormatter.date(from: date )
        let datePrint = DateFormatter()
        datePrint.dateFormat = "dd.MM.yyyy"
        
        return datePrint.string(from: dateFormatted!)
    }
    
}
