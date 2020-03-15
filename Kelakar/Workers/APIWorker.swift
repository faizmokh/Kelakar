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
    func fetchJoke(completion: @escaping (Swift.Result<Joke, AFError>) -> Void) {
        let url = "https://sv443.net/jokeapi/v2/joke/Dark?type=single"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: Joke.self) { response in
                completion(response.result)
        }
    }
}
