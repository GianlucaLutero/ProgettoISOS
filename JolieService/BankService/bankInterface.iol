type BankRequest: void {
	.user: string
	.password: string
	.authKey: string
	.amount: int
	.receiver: string
}

type BankResponse: void {
	.response: string
}

type TransactionData: void {
	.from : string
	.amount : int
}

type BankUser: void {
	.name: string
	.password: string 
	.credit: int
	.tListLength : int
	.transactionList : TransactionData
}

interface BankInterface {
	RequestResponse: payment(BankRequest)(BankResponse)
}
