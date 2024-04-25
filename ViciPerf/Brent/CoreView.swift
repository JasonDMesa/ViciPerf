//
//  CoreView.swift
//  ViciPerf
//
//  Created by Brent Lin on 4/16/24.
//

import SwiftUI
struct CoreView: View {
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
struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
#Preview {
    CoreView()
}




