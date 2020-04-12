//
//  ContentView.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 15/03/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {

    @ObservedObject private var viewModel: ContentViewModel

    init() {
        self.viewModel = ContentViewModel(worker: APIWorker())
    }

    var body: some View {
        ZStack {
            KFImage(URL(string: viewModel.photo?.urls.regular ?? ""))
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .blur(radius: 1)
                .frame(maxWidth: UIScreen.main.bounds.width,
                       maxHeight: UIScreen.main.bounds.height)
                .animation(.easeIn(duration: 1.0))
                .transition(.opacity)
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: UIScreen.main.bounds.width,
                       maxHeight: UIScreen.main.bounds.height)
            VStack {
                Text(self.viewModel.joke?.joke ?? "")
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(20)
                    .contentShape(Rectangle())
                    .gesture(TapGesture().onEnded({ _ in
                        self.viewModel.fetchRandomJoke()
                        self.viewModel.fetchBackgroundPhoto()
                    }))
            }
            .animation(.easeIn(duration: 1.0))
            .transition(.opacity)
        }
        .edgesIgnoringSafeArea(.all)

        .onAppear {
            self.viewModel.fetchRandomJoke()
            self.viewModel.fetchBackgroundPhoto()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
