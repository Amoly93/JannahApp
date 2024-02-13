//
//  Categories.swift
//  JannahApp
//
//  Created by amal badr on 29/01/2024.
//

import Foundation
import SwiftUI
struct Categories:Identifiable{
    var id:Int
    var title:String
    var image:String
    var color:Color
}
var category = [ Categories( id: 1, title: "التعلم و الإبداع", image: "1", color: Color.colorYellow),Categories( id: 2, title: "الترفيه و اللعب", image: "2", color: Color.colorMain),Categories( id: 3, title: "الرياضة و الحركة", image: "4", color: Color.colorPrimer),Categories( id: 4, title: "الحيوانات الأليفة", image: "3", color: Color.accentColor),Categories( id: 5, title: "التسويق", image: "6", color: Color.colorBlue),Categories( id: 6, title: "صالونات الأطفال", image: "5", color: Color.colorPink)]
