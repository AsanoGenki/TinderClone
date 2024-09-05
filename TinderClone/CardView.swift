//
//  CardView.swift
//  TinderClone
//
//  Created by Genki on 9/5/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            Color.black
            // Image
            imageLayer
            // Gradient
            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
            // Infomation
            infomationLayer
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CardView()
}

extension CardView {
    private var imageLayer: some View {
        Image("user01")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100)
    }
    private var infomationLayer: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("ももか")
                    .font(.largeTitle.bold())
                Text("21")
                    .font(.title2)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.title2)
            }
            Text("よろしくお願いします")
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
