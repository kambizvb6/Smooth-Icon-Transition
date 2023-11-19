//
//  ContentView.swift
//  Smooth Icon Transition
//
//  Created by Kambiz on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotation = false
    @State private var isHidden = false
    var body: some View {
        VStack(spacing: 15){
            Line()
                .rotationEffect(.degrees(isRotation ? 48 : 0), anchor: .leading)
            Line()
                .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing : .leading)
                .opacity(isHidden ? 0 : 1)
            Line()
                .rotationEffect(.degrees(isRotation ? -48 : 0), anchor: .leading)
        }
        .onTapGesture {
            withAnimation (.interpolatingSpring(stiffness: 800, damping: 20)) {
                isRotation.toggle()
                isHidden.toggle()
            }
        }
    }
    
    @ViewBuilder
    func Line() -> some View {
        Rectangle()
            .frame(width: 65, height: 10)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .foregroundStyle(.black)
    }
}

#Preview {
    ContentView()
}
