//
//  DataStructures.swift
//  Phone Verification
//
//  Created by Brent Schooley on 3/19/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import Foundation

enum VerifyError: Error {
    case invalidUrl
    case err(String)
}

protocol WithMessage {
    var message: String { get }
}

enum VerifyResult {
    case success(WithMessage)
    case failure(Error)
}

class DataResult: WithMessage {
    let data: Data
    let message: String
    
    init(data: Data) {
        self.data = data
        self.message = String(describing: data)
    }
}

struct CheckResult: Codable, WithMessage {
    let success: Bool
    let message: String
}




















