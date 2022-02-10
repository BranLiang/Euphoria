//
//  ContentView.swift
//  Euphoria
//
//  Created by Bran on 2022/2/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            Task {
                try! await Manager.createManager()
            }
        } label: {
            Text("Create VPN")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
