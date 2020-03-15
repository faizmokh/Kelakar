//
//  Joke.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 15/03/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

// MARK: - Address
struct Joke: Codable {
    let category, type, joke: String
    let flags: Flags
    let id: Int
    let error: Bool
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist, sexist: Bool
}
