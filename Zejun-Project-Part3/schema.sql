CREATE TABLE Customer (
    C_Name VARCHAR(255) not null,
    Gender CHAR(1) not null,
    DOB DATE not null,
    SSN VARCHAR(11) PRIMARY KEY not null,
    C_address VARCHAR(255) not null,
    Language VARCHAR(50),
    Account_name VARCHAR(255)
);

CREATE TABLE Account (
    Account_name VARCHAR(255) PRIMARY KEY not null,
    A_address VARCHAR(255) not null,
    Companycode VARCHAR(50) not null,
    num_member INT
);

CREATE TABLE AccountMember (
    Account_name VARCHAR(255) not null,
    SSN VARCHAR(11) not null,
    Start_date DATE not null
);

CREATE TABLE Claims (
    Claim_num INT PRIMARY KEY not null,
    Claim_date DATE not null,
    Settle_date DATE not null,
    SSN VARCHAR(11) not null,
    Claim_detail TEXT
);

CREATE TABLE Invoice (
    SSN VARCHAR(11) not null,
    Invoice_num INT PRIMARY KEY not null,
    Paid_date DATE not null,
    Invoice_detail TEXT
);

CREATE TABLE BAccount (
    BAccount_name VARCHAR(255) PRIMARY KEY not null,
    B_address VARCHAR(255)
);

CREATE TABLE Account_BillingAccount (
    Account_name VARCHAR(255) not null,
    BAccount_name VARCHAR(255) not null,
    Relationship_type VARCHAR(50) not null
);

CREATE TABLE Account_Admin (
    Admin_name VARCHAR(255) PRIMARY KEY not null,
    Admin_address VARCHAR(255) not null,
    Admin_phone VARCHAR(20) not null,
    Admin_organization VARCHAR(255) not null
);

CREATE TABLE Acct_AcctAdmin (
    Admin_name VARCHAR(255) not null,
    Account_name VARCHAR(255) not null,
    Admin_type VARCHAR(50) not null
);

CREATE TABLE ManagerContract (
    Contract_num INT PRIMARY KEY not null,
    ActivityStatus VARCHAR(50) not null,
    BillingMethod VARCHAR(50) not null,
    Associate_SSN VARCHAR(11) not null,
    Account_name VARCHAR(255) not null,
    ProductID INT not null
);

CREATE TABLE ContractBenefit (
    Contract_num INT not null,
    Benefit_name VARCHAR(255) not null,
    PRIMARY KEY (Benefit_name)
);

CREATE TABLE ContractPremium (
    PremiumCode VARCHAR(50) PRIMARY KEY not null,
    Benefit_name VARCHAR(255) not null,
    Associate_Commissions DECIMAL(10,2),
    Production_Credit DECIMAL(10,2)
);

CREATE TABLE Associate (
    Associate_name VARCHAR(255) not null,
    Associate_DOB DATE not null,
    Associate_tenuredate DATE not null,
    Associate_SSN VARCHAR(11) PRIMARY KEY not null
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY not null,
    Lineofbusiness VARCHAR(255) not null,
    P_Description TEXT,
    P_seriesname VARCHAR(255)
);

CREATE TABLE Sell (
    ProductID INT not null,
    Associate_SSN VARCHAR(11) not null,
    Sold_time DATETIME not null
);

ALTER TABLE Customer ADD FOREIGN KEY (Account_name) REFERENCES Account (Account_name);

ALTER TABLE AccountMember ADD FOREIGN KEY (Account_name) REFERENCES Account (Account_name);
ALTER TABLE AccountMember ADD FOREIGN KEY (SSN) REFERENCES Customer (SSN);

ALTER TABLE Claims ADD FOREIGN KEY (SSN) REFERENCES Customer (SSN);

ALTER TABLE Invoice ADD FOREIGN KEY (SSN) REFERENCES Customer (SSN);

ALTER TABLE Account_BillingAccount ADD FOREIGN KEY (Account_name) REFERENCES Account (Account_name);
ALTER TABLE Account_BillingAccount ADD FOREIGN KEY (BAccount_name) REFERENCES BAccount (BAccount_name);

ALTER TABLE Acct_AcctAdmin ADD FOREIGN KEY (Admin_name) REFERENCES Account_Admin (Admin_name);
ALTER TABLE Acct_AcctAdmin ADD FOREIGN KEY (Account_name) REFERENCES Account (Account_name);

ALTER TABLE ManagerContract ADD FOREIGN KEY (Account_name) REFERENCES Account (Account_name);
ALTER TABLE ManagerContract ADD FOREIGN KEY (Associate_SSN) REFERENCES Associate (Associate_SSN);

ALTER TABLE ContractBenefit ADD FOREIGN KEY (Contract_num) REFERENCES ManagerContract (Contract_num);

ALTER TABLE ContractPremium ADD FOREIGN KEY (Benefit_name) REFERENCES ContractBenefit (Benefit_name);

ALTER TABLE Sell ADD FOREIGN KEY (Associate_SSN) REFERENCES Associate (Associate_SSN);

# Create index
CREATE INDEX CusIndex
ON Customer (SSN, C_Name);

CREATE INDEX AccIndex
ON Account (Account_name, Companycode);

CREATE INDEX ContractIndex
ON ManagerContract (Contract_num);

CREATE INDEX AssIndex
ON Associate (Associate_SSN, Associate_name);