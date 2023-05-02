//
//  FirstTabView.swift
//  ChangeStatusBarColor
//
//  Created by 山崎宏哉 on 2023/05/02.
//

import SwiftUI

struct FirstTabView: View {
    @Binding var viewThemeColor: ThemeColor
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Status Bar Color Test\n Color: Black")
                        .font(.title)
                        .padding(.bottom, 20)
                    NavigationLink(destination: NextView()) {
                        Text("Next View Link")
                    }
                }
            }
            .onAppear {
                print("contentView onAppear")
            }
            .onDisappear {
                print("contentView onDisappear")
            }
            .lightModeStatusFontColor()
        }
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView(viewThemeColor: .constant(.light))
    }
}
