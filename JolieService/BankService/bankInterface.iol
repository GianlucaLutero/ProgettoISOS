type BankRequest: void {
	.user: string
	.password: string
	.amount: int
	.receiver: string
}

type BankResponse: void {
	.response: string
}

interface BankInterface {
	RequestResponse: payment(BankRequest)(BankResponse)
}
