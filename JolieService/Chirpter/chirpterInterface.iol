type ChirpterRequest: void{
  .authKey: string
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

type ChirpterUser: void{
  .name: string
  .password: string
  .authKey: string
  .chirpList: Chirp
}

interface ChirpterInterface{
    RequestResponse: publish(ChirpterRequest)(ChirpterResponse)
    RequestResponse: getChirpList(ChirpterListRequest)(ChirpterResponse)
}
