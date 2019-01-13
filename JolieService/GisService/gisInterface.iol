
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
  .location:string
}

type GisNearRequest: void{
  .place:string
  .placeList:string
}

type GisPlaceResponse: void{
  .location:string
}

interface GisInterface {
    RequestResponse: getPlace(GisPlaceRequest)(GisPlaceResponse)
    RequestResponse: getNearestPlace(GisNearRequest)(GisNearResponse)
}
