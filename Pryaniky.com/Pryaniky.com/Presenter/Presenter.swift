//
//  Presenter.swift
//  Pryaniky.com
//
//  Created by Vladislav Fefelov on 28.09.2020.
//

import Foundation
import SwiftyJSON

class Presenter {
    
    func getJSON(url: URL) -> JSON {
        let jsonData = try! Data(contentsOf: url)
        return JSON(jsonData)
    }
    
    func decodeJSON(json: JSON, indexPath: IndexPath) -> (String,String,[Int:String]) {
        //Определяем имя у выбранной строки
        let selectedName = json["view"][Int(indexPath.row)].string!
        
        //Определяем порядок у имени
        var id = Int()
        
        for i in 0..<(json["data"].count) {
            if json["data",i,"name"].string == selectedName {
                id = i
            }
        }
        
        //JSON to Dictionary
        var dict = [Int:String]()
        let variants = json["data",id,"data","variants"]
        for i in 0..<(variants.count) {
            dict.updateValue(json["data",id,"data","variants",i,"text"].string!, forKey: json["data",id,"data","variants",i,"id"].int!)
        }
        
        let url = json["data",id,"data","url"].string ?? ""
        let text = json["data",id,"data","text"].string ?? ""
        
        return (url, text, dict)
    }
    
}

