type TwiceRequest: void {
	.value: int
}

type TwiceResponse: void{
	.twice: int
}

interface TwiceInterface {
	RequestResponse: twice( TwiceRequest )( TwiceResponse )
}
