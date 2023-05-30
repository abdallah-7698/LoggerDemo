
import ShipBookSDK
import Foundation

struct ShipBookLogger: Logging {
        
    init() {

        ShipBook.start(appId: "64765942840da72197080ced",
                       appKey: "b4605c3b3e4b62db6ceb13ef91fc6368")
    }
    
    func logMessage(_ message: @autoclosure () -> String,
                    logLevel: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line : UInt) {
        switch logLevel {
        case .verbose:
            Log.v(message(), function: function.description, file: file.description, line: Int(line))
        case .debug:
            Log.d(message(), function: function.description, file: file.description, line: Int(line))
        case .info:
            Log.i(message(), function: function.description, file: file.description, line: Int(line))
        case .warn:
            Log.w(message(), function: function.description, file: file.description, line: Int(line))
        case .error:
            Log.e(message(), function: function.description, file: file.description, line: Int(line))
        }
    }
    
}
