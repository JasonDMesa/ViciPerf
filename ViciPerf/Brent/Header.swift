//
//  Header.swift
//  ViciPerf
//
//  Merged by Brent Lin on 4/16/24.
//

import SwiftUI
struct HeaderView: View {
    var body: some View {
        HStack{
            Image("VICILOGO")
                .resizable()
                .scaledToFit()
                .frame(height: 95)
            
        }
        .frame(width: 400, height: 100 )
        .background(Color.black)
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}



