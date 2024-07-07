//
//  ShowCaseList.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct ShowCaseCell: View {
    @EnvironmentObject var store: Store<RootState>
    let viewModel: ShowCaseList.ViewModel

    var body: some View {
        print(store)
        return VStack {
            VStack{
                Text(viewModel.title)
            }
        }
        .padding()
    }
}

#Preview {
    ShowCaseList()
}
