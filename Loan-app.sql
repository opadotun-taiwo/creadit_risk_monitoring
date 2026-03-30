select * from loandb.financial_loan;

SELECT COUNT(id) AS Total_Applications FROM loandb.financial_loan
WHERE MONTH(issue_date) = 11;

--Safely modifying date column and casting to Date

SET SQL_SAFE_UPDATES = 0;

UPDATE loandb.financial_loan
SET issue_date = DATE_FORMAT(STR_TO_DATE(issue_date, '%d-%m-%Y'), '%Y-%m-%d')
WHERE id > 0;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE loandb.financial_loan 
MODIFY COLUMN issue_date DATE;


-- creating a table to map States

CREATE TABLE loandb.state_mapping (
    state_code CHAR(2) PRIMARY KEY,
    state_name VARCHAR(50) NOT NULL
);


INSERT INTO loandb.state_mapping (state_code, state_name) VALUES 
('AL', 'Alabama'), ('AK', 'Alaska'), ('AZ', 'Arizona'), ('AR', 'Arkansas'), 
('CA', 'California'), ('CO', 'Colorado'), ('CT', 'Connecticut'), ('DE', 'Delaware'), 
('FL', 'Florida'), ('GA', 'Georgia'), ('HI', 'Hawaii'), ('ID', 'Idaho'), 
('IL', 'Illinois'), ('IN', 'Indiana'), ('IA', 'Iowa'), ('KS', 'Kansas'), 
('KY', 'Kentucky'), ('LA', 'Louisiana'), ('ME', 'Maine'), ('MD', 'Maryland'), 
('MA', 'Massachusetts'), ('MI', 'Michigan'), ('MN', 'Minnesota'), ('MS', 'Mississippi'), 
('MO', 'Missouri'), ('MT', 'Montana'), ('NE', 'Nebraska'), ('NV', 'Nevada'), 
('NH', 'New Hampshire'), ('NJ', 'New Jersey'), ('NM', 'New Mexico'), ('NY', 'New York'), 
('NC', 'North Carolina'), ('ND', 'North Dakota'), ('OH', 'Ohio'), ('OK', 'Oklahoma'), 
('OR', 'Oregon'), ('PA', 'Pennsylvania'), ('RI', 'Rhode Island'), ('SC', 'South Carolina'), 
('SD', 'South Dakota'), ('TN', 'Tennessee'), ('TX', 'Texas'), ('UT', 'Utah'), 
('VT', 'Vermont'), ('VA', 'Virginia'), ('WA', 'Washington'), ('WV', 'West Virginia'), 
('WI', 'Wisconsin'), ('WY', 'Wyoming');

select * from loandb.state_mapping;

-- Creating a view for automation

create or replace view loandb.state_loan_summary as
	select
		s.state_name as State,
        count(f.id) as Total_loan_application,
        SUM(f.loan_amount) AS Total_Funded_Amount,
		SUM(f.total_payment) AS Total_Amount_Received,
        SUM(f.total_payment) - SUM(f.loan_amount) AS Net_profit
	from loandb.financial_loan f
    join loandb.state_mapping s on f.address_state = s.state_code
    group by s.state_name
    order by s.state_name;


