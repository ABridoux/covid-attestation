//
//  ProfileTests.swift
//  AttestationTests
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import XCTest
@testable import Attestation

protocol EmptyInitializable {
    init()
}

extension String: EmptyInitializable {}
extension Date: EmptyInitializable {}

class ProfileTests: XCTestCase {

    func testValidateNoEmptyFields() {
        testValidateEmptynessThrowsError(for: \.firstName)
        testValidateEmptynessThrowsError(for: \.lastName)
        testValidateEmptynessThrowsError(for: \.birthCity)
        testValidateEmptynessThrowsError(for: \.street)
        testValidateEmptynessThrowsError(for: \.city)
        testValidateEmptynessThrowsError(for: \.zipCode)
    }

    func testValidateZipCode() {
        let profile = Profile()
        profile.firstName = "Riri"
        profile.lastName = "Duck"
        profile.birthCity = "Duckville"
        profile.street = "street"
        profile.city = "Duckville"
        profile.zipCode = "12345"

        XCTAssertNoThrow(try profile.validate())
    }

    // MARK: Helpers

    func testValidateEmptynessThrowsError<Value: EmptyInitializable>(for keyPath: WritableKeyPath<Profile, Value>, file: StaticString = #file, line: UInt = #line) {
        var profile = Profile()
        profile[keyPath: keyPath] = Value()

        XCTAssertThrowsError(try profile.validate())
    }
}
