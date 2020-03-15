//
//  ContentView.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 15/03/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var viewModel: ContentViewModel

    init() {
        self.viewModel = ContentViewModel(worker: APIWorker())
    }

    var body: some View {
        Text(viewModel.joke?.joke ?? "")
            .onAppear {
                self.viewModel.fetchRandomJoke()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
