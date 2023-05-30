//
//  SystemLogger.swift
//  LogsDemo
//
//  Created by Abdallah on 30/05/2023.
//

import Foundation

final class SystemLogger: Logging{
    
    func logMessage(_ message: @autoclosure () -> String,
                    logLevel: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line : UInt) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        let readableMessage = "[\(logLevel.rawValue)] [\(timestamp)] \(file) - \(function) - \(line) - \(message()) "
        print(readableMessage)
    }
    
}

