//
//  NetworkManager.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Moya
import Alamofire

class NetworkManager {
    
    private var internetRequest: InternetRequestable
    
    required init(internetRequest: InternetRequestable) {
        self.internetRequest = internetRequest
    }
    
    private let provider: MoyaProvider<EndPoint> = {
        let plugins: [PluginType]
        
        #if DEBUG
        plugins = [NetworkLoggerPlugin(verbose: false, cURL: true)]
        #else
        plugins = []
        #endif
        
        return MoyaProvider<EndPoint>(plugins:plugins)
    }()
    
    func getProfile(completion: @escaping Profile.Completion) {
        request(endpoint: .getProfile,
                transformResponseToModel: {
                    (response: Profile.Response) in response.profile },
                completion: completion)
    }
    
    func getApps(nextPage: String?, append: Bool, completion: @escaping App.Completion) {
        request(endpoint: .getApps(nextPage),
                transformResponseToModel: {
                    (response: App.Response) in response.apps },
                completion: completion)
    }
    
    func getBuilds(for slug: String, nextPage: String?, append: Bool, completion: @escaping Build.Completion) {
        request(endpoint: .getBuilds(slug, nextPage),
                transformResponseToModel: {
                    (response: Build.Response) in response.builds },
                completion: completion)
    }

}

extension NetworkManager {
    private func request<Response: Codable, Model: Codable>(
        endpoint: EndPoint,
        transformResponseToModel: @escaping (Response) -> Model,
        completion: @escaping (Result<Model>) -> Void) {
        
        internetRequest.request {
            self.provider.request(endpoint) { result in
                switch result {
                case .success(let response):
                    do {
                        let response: Response = try self.decode(
                            data: response.data,
                            dateDecodingStrategy: endpoint.dateDecodingStrategy,
                            keyDecodingStrategy: endpoint.keyDecodingStrategy)
                        let model = transformResponseToModel(response)
                        completion(.success(model))
                    } catch {
                        debugPrint(error)
                        
                        if response.statusCode == 429 {
                            let apiError = ApiError(error: nil, message: Localized.Error.tryAgain, code: nil)
                            completion(.failure(apiError))
                            return
                        }
                        
                        let apiError = ApiError(error: nil, message: Localized.Error.unknownDescription, code: nil)
                        completion(.failure(apiError))
                    }
                case .failure(let error):
                    let apiError = ApiError(error: error)
                    completion(.failure(apiError))
                }
            }
        }
    }
    
    private func decode<Model: Codable>(
        data:Data,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) throws -> Model {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
        if let dateDecodingStrategy = dateDecodingStrategy {
            jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
        }
        return try jsonDecoder.decode(Model.self, from: data)
    }
    
}
