//
//  APIWorker.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 15/03/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation
import Alamofire

class APIWorker {

    private var clientID: String {
        guard let clientID = self.infoForKey("Unsplash Client ID") else {
            fatalError("Error: Missing Unsplash API Client ID")
        }
        return clientID
    }

    func fetchJoke(completion: @escaping (Swift.Result<Joke, AFError>) -> Void) {
        let url = "https://sv443.net/jokeapi/v2/joke/Dark?type=single"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: Joke.self) { response in
                completion(response.result)
        }
    }

    func fetchRandomPhotos(completion: @escaping (Swift.Result<Photo, AFError>) -> Void) {
        let url = "https://api.unsplash.com/photos/random/?client_id=\(clientID)"
        AF.request(url, method: .get)
        .validate()
            .responseDecodable(of: Photo.self, queue: .main) { response in
                completion(response.result)
        }
    }

    private func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}
