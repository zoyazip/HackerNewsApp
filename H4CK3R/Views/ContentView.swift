//
//  ContentView.swift
//  H4CK3R
//
//  Created by MacBook on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("H4CK3R News")
        }
        .onAppear {
            self.networkManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Привет")
//]
