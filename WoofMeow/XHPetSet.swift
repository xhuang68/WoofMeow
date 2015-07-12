//
//  XHPetSet.swift
//  WoofMeow
//
//  Created by Henry Huang on 7/8/15.
//  Copyright (c) 2015 XiaoHuang. All rights reserved.
//

import UIKit

class XHPetSet: NSObject {
    
    var petSetName: String
    
    init(petSetName: String) {
        self.petSetName = petSetName
    }
    
    func petSet() -> Array<XHPet>{
        switch self.petSetName {
            case "Dog":
                    var petSet = [XHPet]()
                    for i in 0...11 {
                        let petName: String = "Dog\(i)"
                        let petImage:String = "Dog\(i)"
                        let petSound: String = "Dog\(i)"
                        let pet = XHPet(petName: petName, petImage: petImage, petSound: petSound)
                        petSet.append(pet)
                    }
                    return petSet
            
            case "Cat":
                var petSet = [XHPet]()
                for i in 0...11 {
                    let petName: String = "Cat\(i)"
                    let petImage:String = "Cat\(i)"
                    let petSound: String = "Cat\(i)"
                    let pet = XHPet(petName: petName, petImage: petImage, petSound: petSound)
                    petSet.append(pet)
                    }
                    return petSet
            
            default:
                var petSet = [XHPet]()
                for i in 0...11 {
                    let petName: String = "placeholder"
                    let petImage:String = "placeholder"
                    let petSound: String = "placeholder"
                    let pet = XHPet(petName: petName, petImage: petImage, petSound: petSound)
                    petSet.append(pet)
                }
                return petSet
        }
    }
}
