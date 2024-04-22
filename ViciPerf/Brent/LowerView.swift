//
//  LowerView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 4/16/24.
//

import SwiftUI
struct LowerView: View {
    var body: some View {
        NavigationView {
            VStack (spacing: 0){
                HeaderView()
                ZStack{
                    Color(.darkGray)
                        .ignoresSafeArea()
                    VStack (spacing: 10){ //align the buttons vertically
                       
                    }
            }
            }
        }
                           }
                           }
struct LowerView_Previews: PreviewProvider {
    static var previews: some View {
        LowerView()
    }
}
#Preview {
    LowerView()
}

