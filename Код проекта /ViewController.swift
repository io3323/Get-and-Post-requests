//
//  ViewController.swift
//  GetAndPostTest
//
//  Created by Игорь Островский on 05.03.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func PostTapped(_ sender: UIButton) {
        guard let url = URL(string: "http://194.58.120.149/auth/registrations") else {return}
        let parameters = ["username":"igorr","password":"11112222","groupNumber":"G20-2"]
        
        var request = URLRequest(url: url)
    
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard  let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request){(data ,response , error) in
            if let response = response {
                print(response)
            }
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }catch{
                print(error)
            }
        }.resume()
                
    }
   
}
