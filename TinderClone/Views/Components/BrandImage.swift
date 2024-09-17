//
//  BrandImage.swift
//  TinderClone
//
//  Created by Genki on 9/8/24.
//

import SwiftUI

enum BrandImageSize: CGFloat {
    case large = 120
    case small = 32
}

struct BrandImage: View {
    let size: BrandImageSize
    var body: some View {
        Image(systemName: "flame.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundColor(.red)
            .frame(width: size.rawValue, height: size.rawValue)
            .padding(.vertical, 32)
    }
}

#Preview {
    BrandImage(size: .large)
}
