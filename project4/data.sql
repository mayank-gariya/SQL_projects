-- Adding Users
INSERT INTO users (name, country) VALUES
('epsilon_ai', 'Germany'),
('zeta_trader', 'Australia'),
('theta_gamer', 'Japan'),
('lambda_ops', 'Singapore'),
('omega_fin', 'UAE');


-- Adding Accounts
INSERT INTO accounts (user_id, account_type) VALUES
(1, 'Savings'),
(1, 'Checking'),
(2, 'Checking'),
(3, 'Crypto'),
(4, 'Checking'),
(5, 'Crypto');

-- Adding Transactions
INSERT INTO transactions 
(account_id, transaction_type, amount, transaction_date, merchant_category) 
VALUES

-- User 1 Activity (Checking + Savings)
(19, 'Deposit', 2500.00, '2025-02-01 09:00:00', 'Freelance'),
(19, 'Withdrawal', 75.00, '2025-02-03 13:20:00', 'Fuel'),
(20, 'Deposit', 10000.00, '2025-02-05 10:00:00', 'Investment Return'),
(20, 'Withdrawal', 500.00, '2025-02-06 16:00:00', 'Shopping'),

-- User 2 Suspicious Pattern
(21, 'Withdrawal', 500.00, '2025-02-10 01:00:00', 'ATM'),
(21, 'Withdrawal', 520.00, '2025-02-10 01:05:00', 'ATM'),
(21, 'Withdrawal', 510.00, '2025-02-10 01:10:00', 'ATM'),
(21, 'Withdrawal', 495.00, '2025-02-10 01:15:00', 'ATM'),

-- User 3 Crypto Volatility
(22, 'Deposit', 2000.00, '2025-03-01 11:00:00', 'Crypto Transfer'),
(22, 'Withdrawal', 1500.00, '2025-03-02 12:00:00', 'NFT'),
(22, 'Deposit', 1800.00, '2025-03-03 09:00:00', 'Trading Profit'),
(22, 'Withdrawal', 1700.00, '2025-03-04 17:00:00', 'Crypto Exchange'),

-- User 4 Stable Salary + Bills
(23, 'Deposit', 4000.00, '2025-01-28 08:00:00', 'Salary'),
(23, 'Withdrawal', 1200.00, '2025-01-29 10:00:00', 'Rent'),
(23, 'Withdrawal', 150.00, '2025-01-30 19:00:00', 'Utilities'),
(23, 'Withdrawal', 90.00, '2025-02-01 20:00:00', 'Entertainment'),

-- User 5 Savings Growth
(24, 'Deposit', 7000.00, '2025-02-01 09:00:00', 'Bonus'),
(24, 'Deposit', 3000.00, '2025-02-15 09:00:00', 'Investment'),
(24, 'Withdrawal', 1000.00, '2025-02-20 12:00:00', 'Travel');