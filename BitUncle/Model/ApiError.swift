//
//  ApiError.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Moya
import Alamofire

struct ApiError {
    
    let error: Error?
    let message: String?
    let code: String?
    
    var localizedDescription: String {
        return message ?? error?.localizedDescription ?? "ERROR"
    }
    
    init(error: Error?, message: String?, code: String?) {
        self.error = error
        self.message = message
        self.code = code
    }
    
    init(dataResponse: DataResponse<Data>) {
        if dataResponse.response?.statusCode == 429 {
            self.init(error: dataResponse.error, message: Localized.Error.tryAgain, code: nil)
        } else if
            let response = dataResponse.data {
            self.init(data: response, error: dataResponse.error)
        } else {
            self.init(error: dataResponse.error, message: Localized.Error.unknownDescription, code: nil)
        }
    }
    
    init(error: MoyaError) {
        if error.response?.statusCode == 429 {
            self.init(error: error, message: Localized.Error.tryAgain, code: nil)
        } else if let response = error.response {
            self.init(data: response.data, error: error)
        } else {
            self.init(error: error, message: Localized.Error.unknownDescription, code: nil)
        }
    }
    
    init(data: Data?, error: Error?) {
        var errorCode: String? = nil
        var errorMessage: String? = nil
        if let data = data, let errorJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            errorCode = errorJson?["error"] as? String
            errorMessage = errorJson?["message"] as? String
        }
        self.init(error: error, message: errorMessage, code: errorCode)
    }
}
