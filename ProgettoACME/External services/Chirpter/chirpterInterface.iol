type ChirpterRequest: void{
  .authKey: string
  .chirpID: string
  .msg: string
}

type ChirpterStreamRequest: void{
  .authKey: string
  .chirpID: string
  .msg: string
}

type ChirpterPublishResponse: void{
  .response: string
}

type ChirpterListResponse: void{
  .response: string
}
type ChirpterCreateResponse: void{
  .response: string
}
type ChirpterListRequest: void{
  .authKey:string
}

type Chirp: void{
  .time: string
  .msg: string
}

type ChirpStream: void{
  .chirpStreamId: string
  .chirp: Chirp
}

type ChirpterUser: void{
  .name: string
  .password: string
  .authKey: string
  .chirpStream: Chirp
}

interface ChirpterInterface{
    RequestResponse: publish(ChirpterRequest)(ChirpterPublishResponse)
	  RequestResponse: createChirpStream(ChirpterStreamRequest)(ChirpterCreateResponse)
    RequestResponse: getChirpList(ChirpterListRequest)(ChirpterListResponse)
}
