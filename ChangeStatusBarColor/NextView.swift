//
//  NextView.swift
//  ChangeStatusBarColor
//
//  Created by 山崎宏哉 on 2023/05/01.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Status Bar Color Test\n Color: White")
                    .font(.title)
                    .padding(.bottom, 20)
            }
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
