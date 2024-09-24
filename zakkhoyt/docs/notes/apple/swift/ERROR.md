

# Defining Error Types

```swift
/// Use this pattern to give detailed error information based on ephemeral data.
enum Error: Error {
    case failedToRemoveChannel(message: String)
}

/// Use this if you want to populate `error.localizedDescription`.
enum Error: LocalizedError {
    case failedCaseA
    case failedCaseB
          
    /// This is the `String` that will be returned on `error.localizedDescription`.
    ///
    /// A localized message describing what error occurred.
    var errorDescription: String? {
        switch self {
        case .failedCaseA: return "Failed cause reason A"
        case .failedCaseB: return "Failed cause reason B"
        }
    }

    /// A localized message describing the reason for the failure.
    var failureReason: String? {
        switch self {
        case .failedCaseA: return "failureReason A"
        case .failedCaseB: return "failureReason B"
        }
    }

    /// A localized message describing how one might recover from the failure.
    var recoverySuggestion: String? {
        switch self {
        case .failedCaseA: return "recoverySuggestion A"
        case .failedCaseB: return "recoverySuggestion A"
        }
    }

    /// A localized message providing "help" text if the user requests help.
    var helpAnchor: String? {
        switch self {
        case .failedCaseA: return "helpAnchor for the user for case A"
        case .failedCaseB: return "helpAnchor for the user for case B"
        }
    }
}
```
# Catching Error Types
```swift
do {
    try synth.removeChannel(channel)
} catch WaveSynthesizer.Error.failedToRemoveChannel(let message) {
    assertionFailure(message)
} catch let error as LocalizedError {
    print("error.localizedDescription: \(error.localizedDescription)")
    print("error.errorDescription: \(error.errorDescription ?? "<n/d>")")
    print("error.failureReason: \(error.failureReason ?? "<n/d>")")
    print("error.recoverySuggestion: \(error.recoverySuggestion ?? "<n/d>")")
    print("error.helpAnchor: \(error.helpAnchor ?? "<n/d>")")
} catch {
    print("error.localizedDescription: \(error.localizedDescription)")
//                print("error.errorDescription: \(error.errorDescription)")
    assertionFailure(error.localizedDescription)
}
```