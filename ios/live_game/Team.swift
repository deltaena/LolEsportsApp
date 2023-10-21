// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let team = try? JSONDecoder().decode(Team.self, from: jsonData)

import Foundation

// MARK: - Team
struct Team: Equatable, Hashable {
    var name, code: String
    var image: String
    var result: Result?
    var record: Record?
    
    init(json: Dictionary<String, Any?>){
        self.name = json["name"] as! String
        self.code = json["code"] as! String
        self.image = json["image"] as! String
        
        self.result = Result(json: json["result"] as! Dictionary<String, Any>)
        
        self.record = Record(json: json["record"] as! Dictionary<String, Any>)
        
    }
}

// MARK: - Record
struct Record: Equatable, Hashable {
    let wins, losses: Int
    
    init(json: Dictionary<String, Any?>){
        self.wins = json["wins"] as! Int
        self.losses = json["losses"] as! Int
    }
}

// MARK: - Result
struct Result: Equatable, Hashable {
    let outcome: String
    let gameWins: Int

    init(json: Dictionary<String, Any?>){
        self.outcome = json["outcome"] as! String
        self.gameWins = json["gameWins"] as! Int
    }
}
