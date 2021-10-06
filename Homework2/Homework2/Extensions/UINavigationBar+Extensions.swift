//
//  UINavigationBar+Extensions.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

extension UINavigationBar {
    func setupShadow() {
        layer.masksToBounds = false
        layer.shadowColor = Appearance.NavigationBar.shadowColor
        layer.shadowOffset = Appearance.NavigationBar.shadowOffset
        layer.shadowRadius = .zero
        layer.shadowOpacity = Appearance.NavigationBar.shadowOpacity
    }
}
