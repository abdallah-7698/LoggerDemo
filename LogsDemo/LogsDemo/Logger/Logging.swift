//
//  Logging.swift
//  LogsDemo
//
//  Created by Abdallah on 30/05/2023.
//

import Foundation

protocol Logging{
    func logMessage(_ message: () -> String,
                    logLevel: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line: UInt
    )
}
