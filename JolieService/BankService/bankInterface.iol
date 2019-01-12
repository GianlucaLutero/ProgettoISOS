type BankRequest: void {
	.authKey: string
	.amount: int
	.receiver: string
}

type BankResponse: void {
	.response: string
}

type AccountResponse: void {
	.response: string
}

type TransactionData: void {
	.from : string
	.amount : int
	.time : string
}

type BankUser: void {
	.name: string
	.password: string
	.authKey: string
	.credit: int
	.tListLength : int
	.transactionList : TransactionData
}

type AccountRequest: void{
	.authKey: string
}

interface BankInterface {
	RequestResponse: payment(BankRequest)(BankResponse)
    RequestResponse: checkAccount(AccountRequest)(AccountResponse)
}
