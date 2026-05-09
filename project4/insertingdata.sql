-- delete pre existing same name table 
DROP TABLE IF EXISTS users accounts transactions;

-- creating the user table 
CREATE TABLE users(
  user_id SERIAL PRIMARY KEY ,
  name TEXT NOT NULL,
  country TEXT ,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Accounts: Tracking different currency buckets for users
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    account_type TEXT CHECK (account_type IN ('Savings', 'Checking', 'Crypto')),
    currency TEXT DEFAULT 'USD'
);

-- 3. Transactions: The "Heavy Lifter" for Window Functions
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    transaction_type TEXT CHECK (transaction_type IN ('Deposit', 'Withdrawal', 'Transfer')),
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    merchant_category TEXT -- e.g., 'Groceries', 'Tech', 'Dining'
);
