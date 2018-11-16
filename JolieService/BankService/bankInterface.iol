type BankRequest: void {
	.user: string
	.password: string
	.amount: int
	.receiver: string
}

type BankResponse: void {
	.response: string
}

type BankUser: void {
	.name: string
	.password: string 
	.credit: int
}

interface BankInterface {
	RequestResponse: payment(BankRequest)(BankResponse)
}
