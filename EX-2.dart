class BankAccount {
    
    final String _accountName;
    final int _accountID;
    double _balance;

    BankAccount(this._accountID , this._accountName, this._balance);

    String get accountName => _accountName;
    int get accountID => _accountID;
    double get balance => _balance;

    void curentBalance() =>
    print("Current Balance: ${_balance}");

    void withdraw(double amount){
      if (_balance - amount < 0) {
        throw Exception("You cannot with draw!");
    }
    _balance -= amount;
}
  void credit(double amount)=> _balance += amount;

}

class Bank {
    final String name ;
    List<BankAccount> accounts =[];
    Bank(this.name);

    BankAccount createAccount(int accountID , String accountOwner){
      if(accounts.any((account) =>account.accountID == accountID)) {
        throw Exception("Account have ID: $accountID already exists!");
      }
      BankAccount newAccount = BankAccount(accountID, accountOwner, 0);
      accounts.add(newAccount);
      return newAccount;
    }
}
 
void main() {

  Bank myBank = Bank( "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
