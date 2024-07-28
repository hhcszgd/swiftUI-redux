//
//  ShowCaseList.swift
//  Redux
//
//  Created by hhcszgd on 2024/7/22.
//

import SwiftUI

struct TestSheet: View {
    @State var isPresented: Bool = false

    var body: some View {
        return VStack {
            VStack{
                Button("click me") {
                    isPresented = !isPresented
                }.sheet(isPresented: $isPresented) {
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                    Text("hello world")
                }
            }
        }
        .padding()
    }
}
