-- checking if every thing is working properly
SELECT * FROM users;

SELECT * FROM accounts;

select * from transactions;

-- Historical Running Balance
SELECT 
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    -- The core logic: Add if deposit, subtract if withdrawal
    SUM(CASE 
            WHEN transaction_type = 'Deposit' THEN amount 
            ELSE -amount 
        END) 
    OVER (
        PARTITION BY account_id 
        ORDER BY transaction_date
    ) AS running_balance
FROM transactions;

--  Identifying Top Spending Categories 
WITH CategorySpend AS (
   SELECT 
      account_id,
      merchant_category,
      SUM(amount) as total_spent
FROM transactions
WHERE transaction_type ='Withdrawal'
GROUP BY account_id ,merchant_category)

SELECT 
    account_id,
    merchant_category,
    total_spent,
    DENSE_RANK() OVER(PARTITION BY account_id ORDER BY total_spent ASC) as expense_rank
FROM CategorySpend;


-- Fraud Detection
SELECT 
    transaction_id,
    account_id,
    transaction_date,
    amount,
    -- Get the time of the PREVIOUS transaction for that account
    LAG(transaction_date) OVER(PARTITION BY account_id ORDER BY transaction_date) as last_tx_time,
    -- Calculate difference between current and last transaction
    transaction_date - LAG(transaction_date) OVER(PARTITION BY account_id ORDER BY transaction_date) as time_diff
FROM transactions
WHERE transaction_type = 'Withdrawal'
AND amount > 100;

-- Rolling 3-Day Moving Average
SELECT 
    account_id,
    transaction_date::DATE,
    amount,
     AVG(amount) OVER (
        PARTITION BY account_id 
        ORDER BY transaction_date::DATE 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3day_avg
FROM transactions
WHERE transaction_type = 'Withdrawal'
ORDER BY account_id, transaction_date;

-- Identifying "First-Time" Behavior
SELECT DISTINCT
    account_id,
    FIRST_VALUE(merchant_category) OVER(
        PARTITION BY account_id ORDER BY transaction_date
    ) as first_purchase_ever,
    NTH_VALUE(merchant_category, 2) OVER(
        PARTITION BY account_id ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as second_purchase_ever
FROM transactions
WHERE transaction_type = 'Withdrawal';

-- The "Portfolio View"
CREATE VIEW portfolio_transaction_analytics AS
SELECT 
    t.*,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) 
        OVER(PARTITION BY account_id ORDER BY transaction_date) as balance_snapshot,
    COUNT(*) OVER(PARTITION BY account_id, merchant_category) as category_frequency,
    RANK() OVER(PARTITION BY account_id ORDER BY amount DESC) as transaction_size_rank
FROM transactions t;

