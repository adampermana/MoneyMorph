//
//  CustomIndicatorView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

struct CustomIndicatorView: View {
    var totalPages: Int
    var currentPage: Int
    var activeTint: Color = .black
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) { page in
                Circle()
                    .fill(currentPage == page ? activeTint : Color.gray)
                    .frame(width: 4, height: 4)
            }
        }
    }
}

struct CustomIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomIndicatorView(totalPages: 3, currentPage: 1)
    }
}
