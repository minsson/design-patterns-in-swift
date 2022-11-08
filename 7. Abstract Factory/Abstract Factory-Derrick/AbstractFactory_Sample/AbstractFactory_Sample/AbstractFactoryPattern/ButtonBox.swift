//
//  ButtonBox.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

class ButtonBox {
    enum ColorTheme {
        case dark, light
    }

    private var colorTheme: ColorTheme
    private var buttonBoxFacotry: ButtonBoxFactory
    private var button: Button?
    private var view: View?

    init(colorTheme: ColorTheme) {
        self.colorTheme = colorTheme
        self.buttonBoxFacotry = colorTheme == .dark ? DarkButtonBoxFactory() : LightButtonBoxFactory()
        self.createButtonBox()
    }

    private func createButtonBox() {
        self.button = buttonBoxFacotry.createButton()
        self.view = buttonBoxFacotry.createView()
    }

    func change(colorTheme: ColorTheme) {
        self.colorTheme = colorTheme
        self.buttonBoxFacotry = colorTheme == .dark ? DarkButtonBoxFactory() : LightButtonBoxFactory()
        self.createButtonBox()
    }

    func printComponents() {
        print(self.view!)
        print(self.button!)
    }
}
