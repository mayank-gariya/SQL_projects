<h2>📌 Project Overview</h2>
<p>FinTrack is a high-performance SQL analytics project designed to simulate a real-world FinTech environment. The project transforms raw transactional data into actionable business intelligence using advanced PostgreSQL techniques.</p>

<h2>🛠️ Tech Stack</h2>
<ul>
    <li><strong>Database:</strong> PostgreSQL</li>
    <li><strong>Core Competencies:</strong> Window Functions, CTEs, Data Normalization, Time-Series Analysis.</li>
</ul>

<h2>🚀 Key Analytical Features</h2>

<div class="feature-box">
    <h3>1. Real-Time Balance Tracking</h3>
    <p>Implemented a <strong>Running Total</strong> using <code>SUM() OVER()</code>. This allows for a historical balance snapshot at any point in time without expensive self-joins.</p>
</div>

<div class="feature-box">
    <h3>2. Fraud & Rapid-Fire Detection</h3>
    <p>Detected security breaches where multiple large withdrawals occur in short succession using <code>LAG()</code> and <code>LEAD()</code> functions to calculate time deltas.</p>
</div>

<div class="feature-box">
    <h3>3. Month-over-Month (MoM) Growth</h3>
    <p>Constructed an executive-level growth report using CTEs to compare current monthly revenue against previous periods, calculating growth percentages.</p>
</div>

### Summary of what project now showcases:
* **Data Integrity:** Handling normalized tables (Users, Accounts, Transactions).
* **Time-Series Mastery:** Using `LAG()`, `LEAD()`, and `SUM() OVER()` for balances and fraud detection.
* **Business Intelligence:** Calculating Month-over-Month (MoM) growth and rolling averages.
* **Problem-Solving:** Explaining the "Why" behind the code (e.g., using SQL to detect activity drops or rapid-fire transactions).

👤 Contact
Mayank Gariya Email: mayankgariya482@gmail.com
"""
