//
//  PageIntro.swift
//  MoneyMorph
//
//  Created by Adam Permana on 24/06/23.
//

import SwiftUI

// Create Page Intro Model
struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssetImage: "GlobePNG", title: "Welcome to \nMoneyMorph", subTitle: ""),
    .init(introAssetImage: "ExchangeePNG", title: "Exchange With \nMoneyMorph", subTitle: "Thank you for chosing MoneyMorph"),
    .init(introAssetImage: "LockedPNG", title: "LOGIN", subTitle: "", displaysAction: true),

    ]
