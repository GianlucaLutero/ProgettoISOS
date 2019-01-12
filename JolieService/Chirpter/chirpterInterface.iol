type ChirpterRequest: void{
  .authKey: string
  .chirpID: string
  .msg: string
}

type ChirpterResponse: void{
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
    RequestResponse: publish(ChirpterRequest)(ChirpterResponse)
	RequestResponse: createChirpStream(ChirpterRequest)(ChirpterResponse)
    RequestResponse: getChirpList(ChirpterListRequest)(ChirpterResponse)
}
