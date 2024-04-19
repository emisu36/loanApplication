# Loan Application Analysis

## Overview
This paper aims to analyze factors influencing loan approval decisions based on financial data. We utilize statistical techniques such as logistic regression to identify how variables like income and loan amount impact the likelihood of a loan being approved. This analysis helps in understanding lending behaviors and could aid financial institutions in refining their loan assessment processes.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from the open data source of Yelp.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `loan` contains the files necessary to build the shiny app. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, ChatGPT 3.5. Parts of brainstorming and debugging was done with the help of ChatGPT 3.5 and the chat history is available in inputs/llms/usage.txt.
