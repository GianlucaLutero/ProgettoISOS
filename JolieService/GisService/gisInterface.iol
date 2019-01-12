
type Place: void{
    .name: string
    .location: string
    .x: double
    .y: double
}

type GisPlaceRequest: void{
  .name: string
}

type GisNearResponse: void{
  .location:Place
}

type GisNearRequest: void{
  .place:Place
  .placeList:Place
}

type GisPlaceResponse: void{
  .location:string
}

interface GisInterface {
    RequestResponse: getPlace(GisPlaceRequest)(GisPlaceResponse)
    RequestResponse: getNearestPlace(GisNearRequest)(GisNearResponse)
}
