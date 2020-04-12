//
//  ContentViewModel.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 15/03/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var joke: Joke?

    @Published var photo: Photo?

    let worker: APIWorker

    init(worker: APIWorker) {
        self.worker = APIWorker()
    }

    func fetchRandomJoke() {
        worker.fetchJoke { result in
            switch result {
            case .success(let joke):
                self.joke = joke
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func fetchBackgroundPhoto() {
        worker.fetchRandomPhotos { result in
            switch result {
            case .success(let photo):
                self.photo = photo
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
