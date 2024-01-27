//
//  ColorPicker.swift
//  swift test
//
//  Created by karen sun on 2024/1/26.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        let alpha = Double(1.0)

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
