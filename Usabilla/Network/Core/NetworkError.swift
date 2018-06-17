//
//  NetworkError.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

public enum NetworkError {
    case parseError(Error)
    case serverError(code: Int, data: Data?)
    case urlSessionError(Error)
}

extension NetworkError: Error { }

extension NetworkError: CustomNSError {
    public static let errorDomain = "com.usabilla"
    
    public var errorCode: Int {
        switch self {
        case .parseError:
            return 1
        case .serverError:
            return 2
        case .urlSessionError:
            return 3
        }
    }
    
    #if !swift(>=3.1)
    public var errorUserInfo: [String: Any] {
        var userInfo: [String: Any] = [:]
        userInfo[NSLocalizedDescriptionKey] = errorDescription
        return userInfo
    }
    #endif
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .serverError(code, data):
            return message(forStatus: code, data: data)
            
        case let .parseError(error),
             let .urlSessionError(error):
            return message(forError: error)
        }
    }
        
        private func message(forError error: Error) -> String {
            return "\(error)"
        }

    private func message(forStatus code: Int, data: Data?) -> String {
        switch code {
        case 300...399:
            return "Multiple choices: \(code)"
        case 400...499:
            if let data = data {
                let json = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                if let error = json?.errors.first?.title {
                    return error
                } else  {
                    return "Bad request: \(code), \(String(data: data, encoding: .utf8) ?? "")"
                }
            } else {
                return "Bad request: \(code)"
            }
        case 500...599:
            return "Server error: \(code)"
        default:
            return "Unknown error: \(code)"
        }
    }
}

struct ErrorResponse: Codable {
    let errors: [ErrorData]
}

struct ErrorData: Codable {
    let id: Int
    let code: Int
    let title: String
}
