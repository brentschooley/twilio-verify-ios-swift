//
//  VerifyAPI.swift
//  Phone Verification
//
//  Created by Brent Schooley on 3/19/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import Foundation

struct VerifyAPI {
    static func sendVerificationCode(_ countryCode: String,
                                     _ phoneNumber: String) {
        let parameters = [
            "via": "sms",
            "country_code": countryCode,
            "phone_number": phoneNumber
        ]
        
        RequestHelper.createRequest("start", parameters) {
            json in
            return .success(DataResult(data: json))
        }
    }
}
