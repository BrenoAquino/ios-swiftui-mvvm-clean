//
//  OperationsAPIs.swift
//  
//
//  Created by Breno Aquino on 20/01/22.
//

import Foundation
import Domain

enum OperationsAPIs {
    case addOperation(params: CreateOperationParams)
}

extension OperationsAPIs: APIs {
    var baseURL: String {
        return "https://tqcbp1qk03.execute-api.us-east-1.amazonaws.com/dev"
    }
    
    var path: String {
        switch self {
        case .addOperation:
            return "cash-management/operations"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .addOperation:
            return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .addOperation(let params):
            return try? JSONEncoder().encode(params)
        }
    }
}