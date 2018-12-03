//
//  ViewController.swift
//  apiFinalUnitApp
//
//  Created by JOSE GUADARRAMA on 11/15/18.
//  Copyright © 2018 JOSE GUADARRAMA. All rights reserved.
//

import UIKit

struct PlanetInfo: Decodable {
    let copyright: String
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageContainer: UIImageView!
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
//        parse()
        
//        let imageURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo")!
//        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
//            if error == nil{
//                let loadedimage = UIImage(data: data!)
//                //                self.imageContainer.image = loadedimage
//            }
//        }
//        task.resume()
    }
    
    @IBAction func planetInfoWhenTapped(_ sender: Any) {
        parse()
    }
    
    func parse() {
        //eventually have this function return an image.
        let jsonURLString = "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
        guard let url = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                let planetInfo = try JSONDecoder().decode(PlanetInfo.self, from: data)
                let explanation = planetInfo.explanation
                print(planetInfo.title)
                print(planetInfo.url)
            } catch let jsonErr {
                print("error serializing JSON", jsonErr)
            }
        }
        .resume()
    }
    
    //    func parse(number: Int) {
    //        let jsonUrlString = "https://swapi.co/api/people/\(number)/"
    //        guard let url = URL(string: jsonUrlString) else { return }
    //        URLSession.shared.dataTask(with: url) { (data, response, err) in
    //            guard let data = data else { return }
    //            do {
    //                let people = try JSONDecoder().decode(People.self, from: data)
    //                let character = people.name
    //                let height = people.height
    //                let mass = people.mass
    //                let gender = people.gender
    //                let hairColor = people.hair_color
    //                let eyeColor = people.eye_color
    //                self.displayInfo(characterName: character, characterHeight: height, characterWeight: weight, characterGender: gender, characterHair: hairColor, characterEyeColor: eyeColor)
    //                print("name: \(character)\nheight: \(height)\nweight: \(weight)")
    //            } catch let jsonErr {
    //                print("Error serializing json:", jsonErr)
    //            }
    //            }.resume()
    //    }
    
}

