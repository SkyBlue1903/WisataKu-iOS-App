//
//  ContentView.swift
//  WisataKu
//
//  Created by Erlangga Anugrah Arifin on 13/08/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var obs = observer()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



