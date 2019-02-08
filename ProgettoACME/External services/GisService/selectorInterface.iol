type PlaceRequest : void {
  .list : string
}

type PlaceResponse : void {
  .place : string
}

interface SelectorInterface {
  RequestResponse: placeSelector(PlaceRequest)(string)
}
