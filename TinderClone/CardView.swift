//
//  CardView.swift
//  TinderClone
//
//  Created by Genki on 9/5/24.
//

import SwiftUI

struct CardView: View {
    @State private var offset: CGSize = .zero
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
            // LIKE and NOPE
            LikeAndNope
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(offset)
        .gesture(
            gesture
        )
        .scaleEffect(scale)
        .rotationEffect(.degrees(angle))
    }
}

#Preview {
    ListView()
}

// MARK: -UI
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
    private var LikeAndNope: some View {
        HStack {
            // LIKE
            Text("LIKE")
                .tracking(4)
                .foregroundColor(.green)
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.green, lineWidth: 5)
                )
                .rotationEffect(Angle(degrees: -15))
                .offset(x: 16, y: 30)
                .opacity(opacity)
            Spacer()
            // NOPE
            Text("NOPE")
                .tracking(4)
                .foregroundColor(.red)
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 5)
                )
                .rotationEffect(Angle(degrees: 15))
                .offset(x: -16, y: 36)
                .opacity(-opacity)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

// MARK: -Action
extension CardView {
    private var screenWidth: CGFloat {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return 0.0 }
        return window.screen.bounds.width
    }
    private var scale: CGFloat {
        print(1.0 - (abs(offset.width) / screenWidth))
        return max(1.0 - (abs(offset.width) / screenWidth), 0.75)
    }
    private var angle: Double {
        return (offset.width / screenWidth) * 10.0
    }
    private var opacity: Double {
        return (offset.width / screenWidth) * 4.0
    }
    private var gesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let width = value.translation.width
                let height = value.translation.height
                let limitedHeight = height > 0 ? min(height, 100) : max(height, -100)
                offset = CGSize(width: width, height: limitedHeight)
            }
            .onEnded { value in
                let width = value.translation.width
                let height = value.translation.height
                
                if (abs(width) > (screenWidth / 4)) {
                    offset = CGSize(width: width > 0 ? screenWidth * 1.5 : -screenWidth * 1.5, height: height)
                } else {
                    withAnimation(.smooth) {
                        offset = .zero
                    }
                }
            }
    }
}
