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
        VStack {
            Text(viewModel.joke?.joke ?? "")
                .font(.system(size: 32, weight: .medium, design: .rounded))
                .padding(20)
        }
        .contentShape(Rectangle())
        .gesture(TapGesture().onEnded({ _ in
            self.viewModel.fetchRandomJoke()
        }))
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
