//
//  DataMiner.swift
//  TemplateMethod-wongbing
//
//  Created by 이원빈 on 2022/11/09.
//

protocol DataMiner {
    func mine()
    
    func openFile()
    func extractData()
    func parseData()
    func analyzeData()
    func sendReport()
    func closeFile()
}

extension DataMiner {
    func mine() { // 프로토콜 extention은 변경을 막을 수 없다. final func 를 사용해야 템플릿 변경을 막을 수 있다. 즉, 상속을 이용해야 한다.
        openFile()
        extractData()
        parseData()
        analyzeData()
        sendReport()
        closeFile()
    }
    func analyzeData() {
        print("데이터를 분석합니다.")
    }
    func sendReport() {
        print("보고서를 보냅니다.")
    }
}

class PDFDataMiner: DataMiner {
    func openFile() {
        print("PDF 파일을 엽니다")
    }
    
    func extractData() {
        print("PDF 파일을 추출합니다")
    }
    
    func parseData() {
        print("PDF 파일을 파싱합니다")
    }
    
    func closeFile() {
        print("PDF 파일을 닫습니다")
    }
}

class CSVDataMiner: DataMiner {
    func openFile() {
        print("CSV 파일을 엽니다")
    }
    
    func extractData() {
        print("CSV 파일을 추출합니다")
    }
    
    func parseData() {
        print("CSV 파일을 파싱합니다")
    }
    
    func closeFile() {
        print("CSV 파일을 닫습니다")
    }
}

class DocDataMiner: DataMiner {
    func openFile() {
        print("Doc 파일을 엽니다")
    }
    
    func extractData() {
        print("Doc 파일을 추출합니다")
    }
    
    func parseData() {
        print("Doc 파일을 파싱합니다")
    }
    
    func closeFile() {
        print("Doc 파일을 닫습니다")
    }
}
