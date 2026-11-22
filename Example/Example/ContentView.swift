//
//  ContentView.swift
//  Example
//
//  Created by Takuto Nakamura on 2026/11/22.
//

import SwiftUI
import DeviceModel

struct ContentView: View {
    @State var deviceModel: DeviceModel?

    var body: some View {
        VStack {
            if let deviceModel {
                Text(deviceModel.rawValue)
                Text(deviceModel.name)
            } else {
                Text(verbatim: "No Match Device")
            }
        }
        .padding()
        .onAppear {
            deviceModel = DeviceModel.current()
        }
    }
}

#Preview {
    ContentView()
}
