# UnifiedLogging

TODO

## Overview

# Log Levels

```swift
extension XCGLogger.Level {
    /// Maps `XCGLogger.Level` to `OSLogType`
    /// as directly as possible.
    var unifiedLogLevel: OSLogType {
        switch self {
        case .verbose: return .debug
        case .debug: return .debug
        case .info: return .info
        case .notice: return .info
        case .warning: return .error
        case .error: return .fault
        case .severe: return .fault
        case .alert: return .error
        case .emergency: return .fault
        case .none: return .debug
        }
    }
}

extension OSLogType {
    static var allCases: [OSLogType] {
        [
            .debug, // aka .trace
            .info, // (no aliases)
            .default, // aka .notice
            .error, // aka .warning
            .fault // aka .critical
        ]
    }
}
```

## Command Line 
* See dedicated file, [LOG.md](/Users/zakkhoyt/Documents/HatchDocs/notes/shell/LOG.md)


## References
* [Unified Logging (spike notes)](https://hatchbaby.atlassian.net/wiki/spaces/iosDevelopers/pages/994770945/Unified+Logging)
* [Transitioning to Unified Logging](https://hatchbaby.atlassian.net/wiki/spaces/iosDevelopers/pages/1021378561/Transitioning+to+Unified+Logging)
* [A great reference video](https://www.youtube.com/watch?v=BWMxIW0eNX0)
* [Github Repo](https://github.com/dataJAR/JNUC2021-UnifiedLogging)


