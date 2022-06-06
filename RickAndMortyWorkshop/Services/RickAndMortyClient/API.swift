// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CharactersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Characters($page: Int!) {
      characters(page: $page) {
        __typename
        info {
          __typename
          count
          pages
          next
          prev
        }
        results {
          __typename
          id
          name
          status
          type
          gender
          species
          image
          origin {
            __typename
            id
            name
            type
            dimension
          }
          location {
            __typename
            id
            name
            type
            dimension
          }
        }
      }
    }
    """

  public let operationName: String = "Characters"

  public let operationIdentifier: String? = "caeae9bfc0cc8a4fe2a99e6c2cd60359348fc2e1d5513c933e86e9ad845bec93"

  public var page: Int

  public init(page: Int) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", arguments: ["page": GraphQLVariable("page")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .scalar(Int.self)),
            GraphQLField("pages", type: .scalar(Int.self)),
            GraphQLField("next", type: .scalar(Int.self)),
            GraphQLField("prev", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int? = nil, pages: Int? = nil, next: Int? = nil, prev: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "count": count, "pages": pages, "next": next, "prev": prev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The length of the response.
        public var count: Int? {
          get {
            return resultMap["count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        /// The amount of pages.
        public var pages: Int? {
          get {
            return resultMap["pages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pages")
          }
        }

        /// Number of the next page (if it exists)
        public var next: Int? {
          get {
            return resultMap["next"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }

        /// Number of the previous page (if it exists)
        public var prev: Int? {
          get {
            return resultMap["prev"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "prev")
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("origin", type: .object(Origin.selections)),
            GraphQLField("location", type: .object(Location.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, type: String? = nil, gender: String? = nil, species: String? = nil, image: String? = nil, origin: Origin? = nil, location: Location? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "type": type, "gender": gender, "species": species, "image": image, "origin": origin.flatMap { (value: Origin) -> ResultMap in value.resultMap }, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// The type or subspecies of the character.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// The species of the character.
        public var species: String? {
          get {
            return resultMap["species"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "species")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// The character's origin location
        public var origin: Origin? {
          get {
            return (resultMap["origin"] as? ResultMap).flatMap { Origin(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "origin")
          }
        }

        /// The character's last known location
        public var location: Location? {
          get {
            return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "location")
          }
        }

        public struct Origin: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("dimension", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, type: String? = nil, dimension: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "type": type, "dimension": dimension])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the location.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the location.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The type of the location.
          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// The dimension in which the location is located.
          public var dimension: String? {
            get {
              return resultMap["dimension"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "dimension")
            }
          }
        }

        public struct Location: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("dimension", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, type: String? = nil, dimension: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "type": type, "dimension": dimension])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the location.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the location.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The type of the location.
          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// The dimension in which the location is located.
          public var dimension: String? {
            get {
              return resultMap["dimension"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "dimension")
            }
          }
        }
      }
    }
  }
}

public final class EpisodesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Episodes($page: Int!) {
      episodes(page: $page) {
        __typename
        info {
          __typename
          count
          pages
          next
          prev
        }
        results {
          __typename
          id
          name
          air_date
          episode
          characters {
            __typename
            id
            name
            status
            type
            gender
            species
            image
          }
        }
      }
    }
    """

  public let operationName: String = "Episodes"

  public let operationIdentifier: String? = "41cab74d74fc1e129092d65a78460e0aa3daf890b94505cbe63f38dc7cc25145"

  public var page: Int

  public init(page: Int) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodes", arguments: ["page": GraphQLVariable("page")], type: .object(Episode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episodes: Episode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episodes": episodes.flatMap { (value: Episode) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all episodes
    public var episodes: Episode? {
      get {
        return (resultMap["episodes"] as? ResultMap).flatMap { Episode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "episodes")
      }
    }

    public struct Episode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episodes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Episodes", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .scalar(Int.self)),
            GraphQLField("pages", type: .scalar(Int.self)),
            GraphQLField("next", type: .scalar(Int.self)),
            GraphQLField("prev", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int? = nil, pages: Int? = nil, next: Int? = nil, prev: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "count": count, "pages": pages, "next": next, "prev": prev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The length of the response.
        public var count: Int? {
          get {
            return resultMap["count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        /// The amount of pages.
        public var pages: Int? {
          get {
            return resultMap["pages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pages")
          }
        }

        /// Number of the next page (if it exists)
        public var next: Int? {
          get {
            return resultMap["next"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }

        /// Number of the previous page (if it exists)
        public var prev: Int? {
          get {
            return resultMap["prev"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "prev")
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Episode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("air_date", type: .scalar(String.self)),
            GraphQLField("episode", type: .scalar(String.self)),
            GraphQLField("characters", type: .nonNull(.list(.object(Character.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, airDate: String? = nil, episode: String? = nil, characters: [Character?]) {
          self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name, "air_date": airDate, "episode": episode, "characters": characters.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the episode.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the episode.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The air date of the episode.
        public var airDate: String? {
          get {
            return resultMap["air_date"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "air_date")
          }
        }

        /// The code of the episode.
        public var episode: String? {
          get {
            return resultMap["episode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "episode")
          }
        }

        /// List of characters who have been seen in the episode.
        public var characters: [Character?] {
          get {
            return (resultMap["characters"] as! [ResultMap?]).map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }, forKey: "characters")
          }
        }

        public struct Character: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Character"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("status", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("gender", type: .scalar(String.self)),
              GraphQLField("species", type: .scalar(String.self)),
              GraphQLField("image", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, type: String? = nil, gender: String? = nil, species: String? = nil, image: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "type": type, "gender": gender, "species": species, "image": image])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the character.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the character.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The status of the character ('Alive', 'Dead' or 'unknown').
          public var status: String? {
            get {
              return resultMap["status"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// The type or subspecies of the character.
          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          public var gender: String? {
            get {
              return resultMap["gender"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gender")
            }
          }

          /// The species of the character.
          public var species: String? {
            get {
              return resultMap["species"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "species")
            }
          }

          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? {
            get {
              return resultMap["image"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }
        }
      }
    }
  }
}

public final class LocationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Locations($page: Int!) {
      locations(page: $page) {
        __typename
        info {
          __typename
          count
          pages
          next
          prev
        }
        results {
          __typename
          id
          name
          type
          dimension
          residents {
            __typename
            id
            name
            status
            type
            gender
            species
            image
          }
        }
      }
    }
    """

  public let operationName: String = "Locations"

  public let operationIdentifier: String? = "9b878dd3e9fea64e8ceca9f6a9bc5634da277e25f3824070a74448c31108f790"

  public var page: Int

  public init(page: Int) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("locations", arguments: ["page": GraphQLVariable("page")], type: .object(Location.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(locations: Location? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "locations": locations.flatMap { (value: Location) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all locations
    public var locations: Location? {
      get {
        return (resultMap["locations"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "locations")
      }
    }

    public struct Location: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Locations"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Locations", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .scalar(Int.self)),
            GraphQLField("pages", type: .scalar(Int.self)),
            GraphQLField("next", type: .scalar(Int.self)),
            GraphQLField("prev", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int? = nil, pages: Int? = nil, next: Int? = nil, prev: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "count": count, "pages": pages, "next": next, "prev": prev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The length of the response.
        public var count: Int? {
          get {
            return resultMap["count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        /// The amount of pages.
        public var pages: Int? {
          get {
            return resultMap["pages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pages")
          }
        }

        /// Number of the next page (if it exists)
        public var next: Int? {
          get {
            return resultMap["next"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }

        /// Number of the previous page (if it exists)
        public var prev: Int? {
          get {
            return resultMap["prev"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "prev")
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("dimension", type: .scalar(String.self)),
            GraphQLField("residents", type: .nonNull(.list(.object(Resident.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, type: String? = nil, dimension: String? = nil, residents: [Resident?]) {
          self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "type": type, "dimension": dimension, "residents": residents.map { (value: Resident?) -> ResultMap? in value.flatMap { (value: Resident) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the location.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the location.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The type of the location.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The dimension in which the location is located.
        public var dimension: String? {
          get {
            return resultMap["dimension"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "dimension")
          }
        }

        /// List of characters who have been last seen in the location.
        public var residents: [Resident?] {
          get {
            return (resultMap["residents"] as! [ResultMap?]).map { (value: ResultMap?) -> Resident? in value.flatMap { (value: ResultMap) -> Resident in Resident(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Resident?) -> ResultMap? in value.flatMap { (value: Resident) -> ResultMap in value.resultMap } }, forKey: "residents")
          }
        }

        public struct Resident: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Character"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("status", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("gender", type: .scalar(String.self)),
              GraphQLField("species", type: .scalar(String.self)),
              GraphQLField("image", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, type: String? = nil, gender: String? = nil, species: String? = nil, image: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "type": type, "gender": gender, "species": species, "image": image])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the character.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the character.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The status of the character ('Alive', 'Dead' or 'unknown').
          public var status: String? {
            get {
              return resultMap["status"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// The type or subspecies of the character.
          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          public var gender: String? {
            get {
              return resultMap["gender"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gender")
            }
          }

          /// The species of the character.
          public var species: String? {
            get {
              return resultMap["species"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "species")
            }
          }

          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? {
            get {
              return resultMap["image"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }
        }
      }
    }
  }
}
