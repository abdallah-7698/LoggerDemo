
import Foundation

struct Logger{
    
    private static var systemLogger = SystemLogger()
    private static var shipBookLogger = ShipBookLogger()
    
    private static let logger: [Logging] = {
        
        // If you are in unitTest file it will not work
        class  NoOpLogger: Logging{
            func logMessage(_ message: () -> String, logLevel: LogLevel, file: StaticString, function: StaticString, line: UInt) {
                // NoOP!
            }
        }
        
        if NSClassFromString("XCTst") != nil{
            return [NoOpLogger()]
        }
        return [systemLogger, shipBookLogger]//MARK: - Variables
    }()
    
    // MARK:  Warning
    
    static func logWarn(_ message: @autoclosure () -> String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        logger.forEach {
            $0.logMessage(message,
                              logLevel: .warn,
                              file: file,
                              function: function,
                              line: line)
        }
    }
    
    // MARK:  Error
    
    static func logError(_ message: @autoclosure () -> String,
                         file: StaticString = #fileID,
                         function: StaticString = #function,
                         line: UInt = #line) {
//        assertionFailure(message())
        logger.forEach {
            $0.logMessage(message,
                          logLevel: .error,
                              file: file,
                              function: function,
                              line: line)
        }
    }
    
    // MARK:  Info
    
    static func logInfo(_ message: @autoclosure () -> String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        logger.forEach {
            $0.logMessage(message,
                              logLevel: .info,
                              file: file,
                              function: function,
                              line: line)
        }
    }

    // MARK:  Debug
    
    static func logDebug(_ message: @autoclosure () -> String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        logger.forEach {
            $0.logMessage(message,
                              logLevel: .debug,
                              file: file,
                              function: function,
                              line: line)
        }
    }
    
    // MARK:  Verbose
    
    static func logVerbose(_ message: @autoclosure () -> String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        logger.forEach {
            $0.logMessage(message,
                              logLevel: .verbose,
                              file: file,
                              function: function,
                              line: line)
        }
    }

}
