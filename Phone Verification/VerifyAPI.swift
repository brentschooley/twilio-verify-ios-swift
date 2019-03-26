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
    
    static func validateVerificationCode(_ countryCode: String,
                                         _ phoneNumber: String,
                                         _ code: String,
                                         completionHandler: @escaping (CheckResult) -> Void) {
        let parameters = [
            "via": "sms",
            "country_code": countryCode,
            "phone_number": phoneNumber,
            "verification_code": code
        ]
        
        RequestHelper.createRequest("check", parameters) {
            jsonData in
            
            let decoder = JSONDecoder()
            do {
                let checked = try decoder.decode(CheckResult.self, from: jsonData)
                DispatchQueue.main.async {
                    completionHandler(checked)
                }
                return VerifyResult.success(checked)
            } catch {
                return VerifyResult.failure(VerifyError.err("failed to deserialize"))
            }
        }
    }
}
