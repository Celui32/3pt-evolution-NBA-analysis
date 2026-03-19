# NBA 3-Point Evolution Analysis

This project explores how the use of the three-point shot in the NBA has evolved since its introduction during the season 1979-80. 
Using SQL for analysis and Tableau for visualization, the project examines changes in league strategy, player behavior, and positional roles over time.

## Contents
- [Project Overview](#project-overview)
- [Key Questions](#key-questions)
- [Tools Used](#tools-used)
- [Project Workflow](#project-workflow)
- [Key Insights](#key-insights)

## Project Overview

The three-point shot has become one of the most important elements of modern NBA offense. 
This project analyzes historical NBA data to understand how three-point shooting has evolved across teams, players, and positions.

The analysis focuses on identifying key trends in shooting volume, efficiency, and player roles.

## Key Questions

- How has the use of the three-point shot evolved since its introduction in 1979?
- Has three-point efficiency improved as attempts increased?
- How many players attempt high volumes of three-point shots per game?
- How have different player positions adapted to the modern three-point game?

## Tools Used

- **SQL** – Data cleaning and analysis ![SQL](https://img.shields.io/badge/SQL-FCC624?style=flat&logo=MySQL&logoColor=white)
- **Tableau** – Data visualization ![Tableau](https://img.shields.io/badge/Tableau-E97627?style=flat&logo=Tableau&logoColor=white)
- **GitHub** – Project documentation and version control ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

## Project Workflow

1. Raw NBA statistics were collected and stored in a database.
2. SQL queries were used to clean and prepare the data. 📄 [View the Data Curation Report](reports/2_Data_Curation.pdf)
3. Exploratory data analysis was performed to identify trends in three-point shooting. 📄 [View the EDA Report](reports/3_EDA.pdf)
4. Visualizations were created in Tableau to highlight key insights.
5. Results were compiled into an EDA report.
6. Datafolio was created as a project summary.
7. Dashboard was created and published in Tableau.
8. The final report was compiled with all insights and conclusions.

## Project Reports

- 📄 [Project Description & Scope](reports/1_Description_Scope.pdf) 
- 📄 [Data Curation Report](reports/2_Data_Curation.pdf)  
- 📄 [Exploratory Data Analysis (EDA) Report](reports/3_EDA.pdf)

## Key Insights

- The rate of three-point attempts has increased dramatically since the mid-2010s.
  <p align="center">
  <img src="images/EDA_charts/1_3PRate_vs_Efficiency.png" width="700">
  </p>
- Despite the increase in attempts, league-wide three-point efficiency has remained relatively stable.
  <p align="center">
  <img src="images/EDA_charts/2_Teams_Efficiency_vs_3PRate.png" width="700">
  </p>
- The number of high-volume three-point shooters has grown significantly in recent seasons.
  <p align="center">
  <img src="images/EDA_charts/3_Count_Players_HighVolume_Shooting.png" width="700">
  </p>
- Power forwards and centers have increasingly incorporated three-point shooting into their games.
  <p align="center">
  <img src="images/EDA_charts/5_3PRate_by_positions.png" width="45%">
  <img src="images/EDA_charts/6_PF_C_evolution.png" width="45%">
  </p>
  *Figure: Three-point rate evolution by positions and PF/C comparison.*
