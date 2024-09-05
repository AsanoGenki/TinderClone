//
//  ListView.swift
//  TinderClone
//
//  Created by Genki on 9/5/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Cards
            cards
            // Actions
            actions
        }
        .background(.black, in: RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 6)
    }
}

#Preview {
    ListView()
}

extension ListView {
    private var cards: some View {
        ZStack {
            ForEach(0..<5) { _ in
                CardView()
            }
        }
    }
    private var actions: some View {
        HStack(spacing: 68) {
            Button {
                print("ボタンがタップされました")
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 60, height: 60)
                    }
            }
            Button {
                print("ボタンがタップされました")
            } label: {
                Image(systemName: "arrow.counterclockwise")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.yellow)
                    .background {
                        Circle()
                            .stroke(.yellow, lineWidth: 1)
                            .frame(width: 50, height: 50)
                    }
            }
            Button {
                print("ボタンがタップされました")
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.mint)
                    .background {
                        Circle()
                            .stroke(.mint, lineWidth: 1)
                            .frame(width: 60, height: 60)
                    }
            }
        }
        .foregroundColor(.white)
        .frame(height: 100)
    }
}
