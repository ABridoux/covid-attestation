//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

infix operator !!

/// Force unwrap an optional when required, with a relevant error message if the optional is `nil`
/// - Parameters:
///   - optional: The optional to unwrap
///   - errorMessage: An error message
/// - Returns: The unwrapped optional
func !!<T>(optional: T?, errorMessage: @autoclosure () -> String) -> T {
    if let unwrapped = optional {
        return unwrapped
    }
    fatalError(errorMessage())
}
