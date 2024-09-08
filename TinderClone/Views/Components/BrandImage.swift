//
//  BrandImage.swift
//  TinderClone
//
//  Created by Genki on 9/8/24.
//

import SwiftUI

struct BrandImage: View {
    var body: some View {
        Image(systemName: "flame.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundColor(.red)
            .frame(width: 120, height: 120)
            .padding(.vertical, 32)
    }
}

#Preview {
    BrandImage()
}
