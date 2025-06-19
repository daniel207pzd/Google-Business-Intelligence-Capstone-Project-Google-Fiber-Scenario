Google Business Intelligence Capstone Project: Google Fiber Scenario
================
Daniel Poe
2025-06-17

- [Introduction](#introduction)
  - [Characters](#characters)
    - [Stakeholders and Team Members](#stakeholders-and-team-members)
  - [Business Task](#business-task)
  - [Stakeholder Questions](#stakeholder-questions)
  - [Relevant Business Intelligence
    Documents](#relevant-business-intelligence-documents)
  - [About the Dataset](#about-the-dataset)
- [Preparing the Data for
  Dashboarding](#preparing-the-data-for-dashboarding)
  - [Combining the Datasets with Google
    BigQuery](#combining-the-datasets-with-google-bigquery)
  - [Data Cleaning with Python](#data-cleaning-with-python)
- [Low-Fidelity Mockup of the
  Dashboard](#low-fidelity-mockup-of-the-dashboard)
- [Making the Tableau Dashboard](#making-the-tableau-dashboard)
  - [Analysis and Observations](#analysis-and-observations)
    - [First Call Resolution (FCR)](#first-call-resolution-fcr)
    - [Market City](#market-city)
    - [Problem Types](#problem-types)
  - [Executive Summary](#executive-summary)
- [Key Findings and Recommendations](#key-findings-and-recommendations)

This is a capstone project that I have completed as part of the [Google
Business Intelligence Professional
Certificate](https://www.coursera.org/professional-certificates/google-business-intelligence).
The Google Business Intelligence Certificate programme builds on the
foundations of the [Google Data Analytics
Certificate](https://www.coursera.org/professional-certificates/google-data-analytics)
and helps enhance technical skills, including BigQuery, Tableau, and
SQL. Course participants can learn the following:

- Explore the roles of business intelligence (BI) professionals within
  an organization
- Practice data modeling and extract, transform, load (ETL) processes
  that meet organizational goals
- Design data visualizations that answer business questions
- Create dashboards that effectively communicate data insights to
  stakeholders

## Introduction

![](GF_Logo_RGB_x4.png)

I am interviewing for a job with Google Fiber (also known as GFiber),
which provides people and businesses with fibre optic internet. As part
of the interview process, the Fiber customer service team has asked me
to design a dashboard using fictional data. The position I am
interviewing for is in the customer call centre, where GFiber uses
business intelligence to monitor and improve customer satisfaction. To
provide the interviewers with both BI value and organisational data
maturity, I will use my knowledge of the BI stages: Capture, Analyse,
and Monitor.

The team needs to understand how often customers phone customer support
again after their first inquiry; this will help leaders understand
whether the team is able to answer customer questions the first time.
Further, leaders want to explore trends in repeat calls to identify why
customers are having to call more than once, as well as how to improve
the overall customer experience. I will create a dashboard to reveal
insights about repeat callers.

The team’s ultimate goal is to reduce call volume by increasing customer
satisfaction and improving operational optimisation. My dashboard should
demonstrate an understanding of this goal and provide stakeholders with
insights about repeat caller volumes in different markets and the types
of problems they represent.

### Characters

#### Stakeholders and Team Members

- Stakeholders
  - Emma Santiago, Hiring Manager
  - Keith Portone, Project Manager
  - Minna Rah, Lead BI Analyst
- Team Members
  - Ian Ortega, BI Analyst
  - Sylvie Essa, BI Analyst

My primary contacts are Emma and Keith.

### Business Task

To create a dashboard to reveal insights about repeat callers in three
different market cities.

### Stakeholder Questions

- How often does the customer service team receive repeat calls from
  customers?
- What problem types generate the most repeat calls?
- Which market city’s customer service team receives the most repeat
  calls?

### Relevant Business Intelligence Documents

The relevant documents are as follows, which can be viewed by clicking
on the links:

- [Project Requirements
  Document](https://drive.google.com/file/d/1t4q1zzAc4FGue4C_CznAVd4E4OYBjv48/view?usp=sharing)
- [Stakeholder Requirements
  Document](https://drive.google.com/file/d/1LmOWkU6_ig7iZrzcGrQ2tCZ3BCbDCc9Y/view?usp=sharing)
- [Strategy
  Document](https://drive.google.com/file/d/1JkVbi4N3Z1o9MB5Aw8rYHyUV7eSWXDrW/view?usp=sharing)

### About the Dataset

This fictional dataset is a version of actual data the team works with.
Because of this, the data is already anonymised and approved. It
includes:

- Number of calls
- Number of repeat calls after first contact
- Call type
- Market city
- Date

In order to anonymise and fictionalise the data, the datasets the
columns market_1, market_2, and market_3 to indicate three different
city service areas the data represents.

The data also lists five problem types:

- Type_1 is account management
- Type_2 is technician troubleshooting
- Type_3 is scheduling
- Type_4 is construction
- Type_5 is internet and wifi

Additionally, the dataset records repeat calls over seven-day periods.
The initial contact date is listed as contacts_n. The other call columns
are then contacts_n_number of days since first call. For example,
contacts_n_6 indicates six days since first contact.

## Preparing the Data for Dashboarding

### Combining the Datasets with Google BigQuery

Having received the datasets from Google Fiber, I made use of Google
BigQuery to survey the datasets.

    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_1` LIMIT 10;

<div class="knitsql-table">

| date_created | contacts_n | contacts_n_1 | contacts_n_2 | contacts_n_3 | contacts_n_4 | contacts_n_5 | contacts_n_6 | contacts_n_7 | new_type | new_market |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|:---|:---|
| 2022-02-04 | 199 | 21 | 6 | 11 | 7 | 14 | 5 | 6 | type_5 | market_1 |
| 2022-01-30 | 19 | 2 | 0 | 2 | 1 | 0 | 0 | 0 | type_1 | market_1 |
| 2022-02-14 | 29 | 0 | 2 | 2 | 0 | 1 | 0 | 1 | type_1 | market_1 |
| 2022-01-16 | 120 | 6 | 6 | 5 | 4 | 7 | 4 | NA | type_2 | market_1 |
| 2022-02-03 | 182 | 27 | 13 | NA | 14 | 4 | 3 | 2 | type_5 | market_1 |
| 2022-03-08 | 3 | NA | NA | NA | NA | NA | NA | 1 | type_4 | market_1 |
| 2022-03-05 | 2 | 1 | NA | 1 | NA | NA | NA | NA | type_4 | market_1 |
| 2022-02-01 | 262 | 14 | 8 | 7 | 3 | 2 | 3 | 8 | type_2 | market_1 |
| 2022-01-04 | 15 | 2 | 3 | 1 | NA | NA | 1 | 2 | type_3 | market_1 |
| 2022-02-10 | 258 | 11 | 10 | 4 | 7 | 7 | 7 | 5 | type_2 | market_1 |

Displaying records 1 - 10

</div>

    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_2` LIMIT 10;

<div class="knitsql-table">

| date_created | contacts_n | contacts_n_1 | contacts_n_2 | contacts_n_3 | contacts_n_4 | contacts_n_5 | contacts_n_6 | contacts_n_7 | new_type | new_market |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|:---|:---|
| 2022-03-16 | NA | NA | NA | NA | NA | 1 | NA | NA | type_4 | market_2 |
| 2022-02-01 | 28 | 1 | NA | 1 | NA | NA | 2 | NA | type_2 | market_2 |
| 2022-01-05 | 11 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | type_1 | market_2 |
| 2022-03-30 | 38 | 3 | 2 | NA | NA | NA | NA | 1 | type_5 | market_2 |
| 2022-01-24 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | type_1 | market_2 |
| 2022-02-27 | NA | NA | NA | NA | NA | NA | NA | NA | type_4 | market_2 |
| 2022-03-28 | 29 | NA | 2 | NA | 1 | NA | NA | 1 | type_2 | market_2 |
| 2022-01-10 | NA | NA | NA | NA | NA | NA | NA | NA | type_4 | market_2 |
| 2022-01-03 | 5 | NA | NA | NA | NA | NA | NA | NA | type_3 | market_2 |
| 2022-02-23 | 29 | NA | 1 | NA | 1 | NA | NA | NA | type_2 | market_2 |

Displaying records 1 - 10

</div>

    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_3` LIMIT 10;

<div class="knitsql-table">

| date_created | contacts_n | contacts_n_1 | contacts_n_2 | contacts_n_3 | contacts_n_4 | contacts_n_5 | contacts_n_6 | contacts_n_7 | new_type | new_market |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|:---|:---|
| 2022-02-17 | 9 | 3 | 1 | NA | 2 | 2 | NA | 2 | type_3 | market_3 |
| 2022-01-04 | 8 | 3 | 3 | NA | NA | NA | NA | 1 | type_3 | market_3 |
| 2022-03-16 | 27 | 3 | 2 | 2 | NA | NA | NA | 1 | type_2 | market_3 |
| 2022-01-23 | 9 | NA | NA | NA | NA | NA | 1 | 1 | type_2 | market_3 |
| 2022-02-06 | 2 | NA | NA | NA | NA | NA | NA | NA | type_4 | market_3 |
| 2022-03-16 | NA | NA | NA | NA | NA | NA | NA | NA | type_4 | market_3 |
| 2022-03-13 | 8 | 3 | 5 | NA | 2 | NA | NA | NA | type_3 | market_3 |
| 2022-02-09 | 27 | 1 | 2 | NA | 3 | 1 | NA | NA | type_2 | market_3 |
| 2022-03-30 | 33 | 2 | 2 | 1 | 1 | NA | NA | NA | type_2 | market_3 |
| 2022-02-11 | 18 | 5 | 10 | 4 | 5 | 5 | 5 | 3 | type_1 | market_3 |

Displaying records 1 - 10

</div>

Since all the datasets have the same column names, I made use of the
`UNION ALL` statement to combine all of the datasets together into one
table.

    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_1`
    UNION ALL
    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_2`
    UNION ALL
    SELECT * FROM `mimetic-retina-458409-c3.google_fiber_market_data.market_3`
    LIMIT 10;

<div class="knitsql-table">

| date_created | contacts_n | contacts_n_1 | contacts_n_2 | contacts_n_3 | contacts_n_4 | contacts_n_5 | contacts_n_6 | contacts_n_7 | new_type | new_market |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|:---|:---|
| 2022-02-04 | 199 | 21 | 6 | 11 | 7 | 14 | 5 | 6 | type_5 | market_1 |
| 2022-01-30 | 19 | 2 | 0 | 2 | 1 | 0 | 0 | 0 | type_1 | market_1 |
| 2022-02-14 | 29 | 0 | 2 | 2 | 0 | 1 | 0 | 1 | type_1 | market_1 |
| 2022-01-16 | 120 | 6 | 6 | 5 | 4 | 7 | 4 | NA | type_2 | market_1 |
| 2022-02-03 | 182 | 27 | 13 | NA | 14 | 4 | 3 | 2 | type_5 | market_1 |
| 2022-03-08 | 3 | NA | NA | NA | NA | NA | NA | 1 | type_4 | market_1 |
| 2022-03-05 | 2 | 1 | NA | 1 | NA | NA | NA | NA | type_4 | market_1 |
| 2022-02-01 | 262 | 14 | 8 | 7 | 3 | 2 | 3 | 8 | type_2 | market_1 |
| 2022-01-04 | 15 | 2 | 3 | 1 | NA | NA | 1 | 2 | type_3 | market_1 |
| 2022-02-10 | 258 | 11 | 10 | 4 | 7 | 7 | 7 | 5 | type_2 | market_1 |

Displaying records 1 - 10

</div>

I then named and exported the combined dataset as a CSV file named
google_fiber_market_data.csv. The dataset is now ready for cleaning
before proceeding with any form of visualisation.

### Data Cleaning with Python

At the time of writing, I have been going through the [Google Advanced
Data Analytics Professional
Certificate](https://www.coursera.org/professional-certificates/google-advanced-data-analytics)
programme, where I have been learning new skills on Python. I decided to
make use of the new skills I have learnt so far to prepare the data for
visualisation in Tableau. I will make use of the pandas library for data
cleaning.

``` python
import pandas as pd
```

``` python
# Importing the dataset from Google BigQuery
google_fiber_data=pd.read_csv('google_fiber_market_data.csv')
google_fiber_data.head()
```

    ##   date_created  contacts_n  contacts_n_1  ...  contacts_n_7  new_type  new_market
    ## 0   2022-02-03        58.0          20.0  ...           1.0    type_5    market_3
    ## 1   2022-02-22       227.0          69.0  ...           1.0    type_5    market_3
    ## 2   2022-03-04       181.0          44.0  ...           6.0    type_5    market_3
    ## 3   2022-02-14       373.0          63.0  ...           1.0    type_5    market_3
    ## 4   2022-02-15       158.0          17.0  ...           4.0    type_5    market_3
    ## 
    ## [5 rows x 11 columns]

``` python
# Obtaining the shape of the dataset
google_fiber_data.shape
```

    ## (1350, 11)

There are 1,350 rows and 11 columns in the combined dataset.

``` python
# Obtaining the data types of each column
google_fiber_data.dtypes
```

    ## date_created     object
    ## contacts_n      float64
    ## contacts_n_1    float64
    ## contacts_n_2    float64
    ## contacts_n_3    float64
    ## contacts_n_4    float64
    ## contacts_n_5    float64
    ## contacts_n_6    float64
    ## contacts_n_7    float64
    ## new_type         object
    ## new_market       object
    ## dtype: object

The date_created datatype is not correct. I will have to change the
datatype from `object` to `datetime` by using the `pd.to_datetime`
function.

``` python
# Changing the data type of 'date_created' to datetime
google_fiber_data["date_created"]=pd.to_datetime(google_fiber_data["date_created"])
google_fiber_data.head()
```

    ##   date_created  contacts_n  contacts_n_1  ...  contacts_n_7  new_type  new_market
    ## 0   2022-02-03        58.0          20.0  ...           1.0    type_5    market_3
    ## 1   2022-02-22       227.0          69.0  ...           1.0    type_5    market_3
    ## 2   2022-03-04       181.0          44.0  ...           6.0    type_5    market_3
    ## 3   2022-02-14       373.0          63.0  ...           1.0    type_5    market_3
    ## 4   2022-02-15       158.0          17.0  ...           4.0    type_5    market_3
    ## 
    ## [5 rows x 11 columns]

``` python
# Confirming the data type change
google_fiber_data.dtypes
```

    ## date_created    datetime64[ns]
    ## contacts_n             float64
    ## contacts_n_1           float64
    ## contacts_n_2           float64
    ## contacts_n_3           float64
    ## contacts_n_4           float64
    ## contacts_n_5           float64
    ## contacts_n_6           float64
    ## contacts_n_7           float64
    ## new_type                object
    ## new_market              object
    ## dtype: object

Now I will check the number of null values in the dataset by using the
`.isna()` and `.sum()` functions.

``` python
# Checking for null values in the dataset
google_fiber_data.isna().sum()
```

    ## date_created      0
    ## contacts_n      182
    ## contacts_n_1    458
    ## contacts_n_2    529
    ## contacts_n_3    572
    ## contacts_n_4    611
    ## contacts_n_5    631
    ## contacts_n_6    634
    ## contacts_n_7    617
    ## new_type          0
    ## new_market        0
    ## dtype: int64

In this scenario, I will replace null values with 0 by using the
`.fillna()` function.

``` python
# Replace NaN values with 0
google_fiber_data.fillna(value=0, inplace=True)
google_fiber_data
```

    ##      date_created  contacts_n  contacts_n_1  ...  contacts_n_7  new_type  new_market
    ## 0      2022-02-03        58.0          20.0  ...           1.0    type_5    market_3
    ## 1      2022-02-22       227.0          69.0  ...           1.0    type_5    market_3
    ## 2      2022-03-04       181.0          44.0  ...           6.0    type_5    market_3
    ## 3      2022-02-14       373.0          63.0  ...           1.0    type_5    market_3
    ## 4      2022-02-15       158.0          17.0  ...           4.0    type_5    market_3
    ## ...           ...         ...           ...  ...           ...       ...         ...
    ## 1345   2022-01-23         1.0           0.0  ...           0.0    type_4    market_1
    ## 1346   2022-01-10         1.0           0.0  ...           0.0    type_4    market_1
    ## 1347   2022-03-29         3.0           0.0  ...           0.0    type_4    market_1
    ## 1348   2022-02-16         3.0           0.0  ...           0.0    type_4    market_1
    ## 1349   2022-01-02       141.0          17.0  ...           4.0    type_5    market_1
    ## 
    ## [1350 rows x 11 columns]

``` python
# Verifying that there are no more null values
google_fiber_data.isna().sum()
```

    ## date_created    0
    ## contacts_n      0
    ## contacts_n_1    0
    ## contacts_n_2    0
    ## contacts_n_3    0
    ## contacts_n_4    0
    ## contacts_n_5    0
    ## contacts_n_6    0
    ## contacts_n_7    0
    ## new_type        0
    ## new_market      0
    ## dtype: int64

The original dataset had the number of calls columns as the integer
datatype, but after importing the .csv file, the datatype was found to
be float, as observed earlier. I will need to convert the datatype to
integer by using the `.astype(int)` function.

``` python
# Changing the data type of contacts columns to integer
google_fiber_data["contacts_n"]=google_fiber_data["contacts_n"].astype(int)
google_fiber_data["contacts_n_1"]=google_fiber_data["contacts_n_1"].astype(int)
google_fiber_data["contacts_n_2"]=google_fiber_data["contacts_n_2"].astype(int)
google_fiber_data["contacts_n_3"]=google_fiber_data["contacts_n_3"].astype(int)
google_fiber_data["contacts_n_4"]=google_fiber_data["contacts_n_4"].astype(int)
google_fiber_data["contacts_n_5"]=google_fiber_data["contacts_n_5"].astype(int)
google_fiber_data["contacts_n_6"]=google_fiber_data["contacts_n_6"].astype(int)
google_fiber_data["contacts_n_7"]=google_fiber_data["contacts_n_7"].astype(int)

google_fiber_data.head()
```

    ##   date_created  contacts_n  contacts_n_1  ...  contacts_n_7  new_type  new_market
    ## 0   2022-02-03          58            20  ...             1    type_5    market_3
    ## 1   2022-02-22         227            69  ...             1    type_5    market_3
    ## 2   2022-03-04         181            44  ...             6    type_5    market_3
    ## 3   2022-02-14         373            63  ...             1    type_5    market_3
    ## 4   2022-02-15         158            17  ...             4    type_5    market_3
    ## 
    ## [5 rows x 11 columns]

``` python
# Confirming the data type change
google_fiber_data.dtypes
```

    ## date_created    datetime64[ns]
    ## contacts_n               int64
    ## contacts_n_1             int64
    ## contacts_n_2             int64
    ## contacts_n_3             int64
    ## contacts_n_4             int64
    ## contacts_n_5             int64
    ## contacts_n_6             int64
    ## contacts_n_7             int64
    ## new_type                object
    ## new_market              object
    ## dtype: object

Now that all the datatypes are correct, I will replace the problem types
in the new_type column with the corresponding details. I will use the
`.replace()` function for this step. The problem types are as follows:

- Type 1 is account management
- Type 2 is technician troubleshooting
- Type 3 is scheduling
- Type 4 is construction
- Type 5 is internet and Wi-Fi

``` python
# Replacing problem types with the exact type names
google_fiber_data=google_fiber_data.replace({"new_type":{"type_1":"account_management",
                                       "type_2":"technician_troubleshooting",
                                       "type_3":"scheduling",
                                       "type_4":"construction",
                                       "type_5":"internet_and_wifi"}})
google_fiber_data
```

    ##      date_created  contacts_n  ...           new_type  new_market
    ## 0      2022-02-03          58  ...  internet_and_wifi    market_3
    ## 1      2022-02-22         227  ...  internet_and_wifi    market_3
    ## 2      2022-03-04         181  ...  internet_and_wifi    market_3
    ## 3      2022-02-14         373  ...  internet_and_wifi    market_3
    ## 4      2022-02-15         158  ...  internet_and_wifi    market_3
    ## ...           ...         ...  ...                ...         ...
    ## 1345   2022-01-23           1  ...       construction    market_1
    ## 1346   2022-01-10           1  ...       construction    market_1
    ## 1347   2022-03-29           3  ...       construction    market_1
    ## 1348   2022-02-16           3  ...       construction    market_1
    ## 1349   2022-01-02         141  ...  internet_and_wifi    market_1
    ## 
    ## [1350 rows x 11 columns]

Given that the column contacts_n indicate the first, while the columns
contacts_n_1, contacts_n_2 etc. onwards indicate the number of days
since the first contact, I renamed the columns for greater clarity using
the `.rename()` function.

``` python
#Rename columns for clarity
google_fiber_data=google_fiber_data.rename(columns={
    "contacts_n":"call_day_1",
    "contacts_n_1":"call_day_2",
    "contacts_n_2":"call_day_3",
    "contacts_n_3":"call_day_4",
    "contacts_n_4":"call_day_5",
    "contacts_n_5":"call_day_6",
    "contacts_n_6":"call_day_7",
    "contacts_n_7":"call_day_8",
    "new_type":"problem_type",
    "new_market":"market_area"})
google_fiber_data.head()
```

    ##   date_created  call_day_1  ...       problem_type  market_area
    ## 0   2022-02-03          58  ...  internet_and_wifi     market_3
    ## 1   2022-02-22         227  ...  internet_and_wifi     market_3
    ## 2   2022-03-04         181  ...  internet_and_wifi     market_3
    ## 3   2022-02-14         373  ...  internet_and_wifi     market_3
    ## 4   2022-02-15         158  ...  internet_and_wifi     market_3
    ## 
    ## [5 rows x 11 columns]

Now that the dataset has been cleaned and formatted, it is now ready to
be used in Tableau for creating the dashboard. I exported the dataset as
google_fiber_market_data_final.csv using the `.to_csv()` function.

``` python
# Exporting the cleaned dataset to a new CSV file
google_fiber_data.to_csv('google_fiber_market_data_final.csv', index=False)
```

``` python
# Reading the new CSV file to confirm the export
pd.read_csv('google_fiber_market_data_final.csv')
```

    ##      date_created  call_day_1  ...       problem_type  market_area
    ## 0      2022-02-03          58  ...  internet_and_wifi     market_3
    ## 1      2022-02-22         227  ...  internet_and_wifi     market_3
    ## 2      2022-03-04         181  ...  internet_and_wifi     market_3
    ## 3      2022-02-14         373  ...  internet_and_wifi     market_3
    ## 4      2022-02-15         158  ...  internet_and_wifi     market_3
    ## ...           ...         ...  ...                ...          ...
    ## 1345   2022-01-23           1  ...       construction     market_1
    ## 1346   2022-01-10           1  ...       construction     market_1
    ## 1347   2022-03-29           3  ...       construction     market_1
    ## 1348   2022-02-16           3  ...       construction     market_1
    ## 1349   2022-01-02         141  ...  internet_and_wifi     market_1
    ## 
    ## [1350 rows x 11 columns]

Now that we have cleaned and prepared the data, we can now proceed to
create the dashboard on Tableau.

## Low-Fidelity Mockup of the Dashboard

![](Dashboard%20Low%20Fidelity%20Mockup.png)

## Making the Tableau Dashboard

I uploaded the final dataset into Tableau and created calculated fields
on Tableau for the total number of repeat calls and the total number of
calls.

![](Repeat%20Calls%20Calculated%20Field.png)
![](Total%20Number%20of%20Calls%20Calculated%20Field.png)

I also created a calculated field called First Call Resolution (FCR).
FCR is defined by [SQM
Group](https://www.sqmgroup.com/resources/library/blog/fcr-metric-operating-philosophy)
as a metric or key performance indicator (KPI) that measures a call
centre’s performance for resolving customer interactions on the first
call or contact, eliminating the need for follow-up contacts. FCR
measures the percentage of calls resolved on the first contact without
requiring follow-up.

![](First%20Call%20Resolution%20Calculated%20Field.png)

The interactive Tableau dashboard can be found
[here](https://public.tableau.com/app/profile/daniel.poe/viz/GoogleBusinessIntelligenceCapstoneProjectGoogleFiberScenario/GoogleFiberDashboard).
I have included filters by year, quarter, month, and week, as requested
by the stakeholders. I have also included additional helpful filters by
weekday, market city, and problem type. The FCR metric/KPI, first calls,
and repeated calls will be automatically updated.

![Google Fiber Dashboard](https://github.com/user-attachments/assets/0c5c0325-d367-426c-beba-4862724819b0)

### Analysis and Observations

#### First Call Resolution (FCR)

As mentioned earlier, FCR is a metric or KPI that measures a call
centre’s performance for resolving customer interactions on the first
call or contact, eliminating the need for follow-up contacts. FCR
measures the percentage of calls resolved on the first contact without
requiring follow-up.

According to [SQM
Group](https://www.sqmgroup.com/resources/library/blog/call-center-fcr-benchmark-2024-results-by-industry),
although FCR benchmarks vary across different industries, the typical
industry standard for a good FCR is rate is **70-79%**. This indicates
efficient processes, quality agent training, and effective
problem-solving strategies that resolve most issues on the first call. A
world-class FCR rate would be **above 80%**, which is difficult to
achieve, but will bring significant rewards in terms of customer
satisfaction, loyalty, and reduced operational costs.

The following is the FCR table for each market and problem type.
![](FCR%20by%20Market%20Area%20and%20Problem%20Type.png)
**Observations**: Based on the three-month data provided by GFiber, the
FCR is around 76.24%, initially indicating that the GFiber call centres
are performing well overall. However, looking at individual problem
types and market cities, there are different insights that could be
drawn:

- Market City 1 overall has a good FCR rating of 78.2%.
  - There seems to be a little bit of problems handling scheduling
    problems, although its FCR rate is not far from the minimum good
    rate of 70%.
  - Other problem types are being handled well, with the handling of
    technician troubleshooting issues achieving world-class FCR rates.
- Market City 2 has the best overall FCR rating, achieving a world-class
  FCR rating of 84.8%.
  - All problem types are being handled well, with even three problem
    types attaining world-class FCR ratings.
- Out of all the three market cities, Market City 3 has the lowest
  overall FCR rating of 69.1%, although very close to the minimum good
  FCR rating of 70%.
  - This is especially caused by the very poor performance on account
    management, which has a 33.6% FCR rating. This seems to indicate bad
    handling of account management problems by the call centre.
  - Scheduling problems had a FCR rating of around 56.9%, indicating
    that such issues were not handled as poorly as accounting management
    issues, but is still unsatisfactory by industry standards.

#### Market City

![Total Calls by Market Area](https://github.com/user-attachments/assets/6952e69f-124b-464c-b1fa-5a01ddeef843)
**Observations**: Market City 1 received the greatest number of calls within the quarter, followed by Market Cities 3 and 2.

![Repeat Caller Trends by Market](https://github.com/user-attachments/assets/b2e1bbee-feb3-4316-898c-31acbd3ed58e)
**Observations**: Throughout the quarter, the greatest number of repeat calls came from Market City 1. Market City 3 has consistently received the least number of repeat calls.

#### Problem Types

![Market and Problem Types for Repeat Calls](https://github.com/user-attachments/assets/d1a3806d-bddd-4765-8141-69f4a05a9e3f)
**Observations**: Across the three market cities in the quarter, the two
most significant issues repeat callers called about were regarding
internet and Wi-Fi, and technician troubleshooting.

### Executive Summary

The executive summary for this capstone project can be found
[here](https://drive.google.com/file/d/1QNfKfTkCjCSAiUu6a97PBvifzYKxFznU/view?usp=sharing).

## Key Findings and Recommendations

The key findings of this project are as follows:

- Market city 2 has the best overall FCR rate, while market city 3 has
  the lowest overall FCR rate.
- Market city 1 received the greatest number of repeat calls.
- Most repeat calls were made regarding internet and Wi-Fi, and
  technician troubleshooting problems.
- Market city 1 has an FCR rate below industry standards for scheduling
  problems.
- Market city 3 has FCR rates below industry standards for accounting
  and scheduling problems.

Based on these key findings, I would like to make the following
recommendations:

- Provide more training and support for handling technician
  troubleshooting and internet and WiFi problems.
- Allocate more resources and staff to market_1 to address the higher
  volume of repeat calls.
- Training should be provided to staff in market_3 to better equip them
  to handle account management and scheduling problems.
- Provide additional support to market_1 for staff to handle scheduling
  problems better.
