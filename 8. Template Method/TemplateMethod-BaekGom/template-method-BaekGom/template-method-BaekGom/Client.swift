//
//  Client.swift
//  template-method-BaekGom
//
//  Created by Baek on 2022/11/09.
//

import Foundation

enum FileType {
    case pdf
    case word
    case excel
}

class Client {
    static func dataMining(fileType: FileType) {
        switch fileType {
        case .pdf:
            PDFFileDataMining().dataMining()
        case .word:
            WordFileDataMining().dataMining()
        case .excel:
            ExcelFileDataMining().dataMining()
        }
    }
}
