type GisRequest: void{
  .place:string
  .placeList:string
}

type GisResponse: void{
  .location:string
}

interface GisInterface {
    RequestResponse: getPlace(GisRequest)(GisResponse)
}
