# WNV_Predictions
Featuring Vidhu Jain, Lynn Ng, Koh Pei Qing, and Daniel Chang

## 1. Introduction 
### 1.1 What is the West Nile Virus?
West Nile fever is an infection by the West Nile virus (WNV), which is typically spread by mosquitoes. Mosquitoes become infected when they feed on infected birds which carry the disease. Upon feeding on these birds, the mosquitoes become infected as well, and pass the disease on to humans when they bite. Cases of WNV generally occur during mosquito season, which starts in the summer and continues through fall.

### 1.2 Problem Statement
There are two issues we seek to address in this project:

Firstly, we aim to build a model capable of predicting the outbreak of West Nile Virus in the Chicago locale. We will not be looking at the mosquito-to-human transmission of WNV, as this is a function of complex environmental and health factors that is out of the scope of this project. Rather, we will be predicting the appearance of WNV in the mosquitos themselves (i.e. detecting the presence of WNV in mosquitos).

By predicting the appearance of WNV-infected mosquitos, our analyses should lend itself to further studies on the interaction between infected mosquitos and human/environmental variables. Furthermore, through predicting the outbreak of infected mosquitos in specific geographic regions, we would be able to support a local government's attempts to control mosquito populations via spraying efforts by pointing them towards high risk areas, whilst lowering costs associated with wide scale mosquito spraying.

Secondly, we need to be able to evaluate the feature importances of our models so as to be able to provide prescriptive advice to states afflicted by WNV. Whilst running complicated black box models may have strong predictive powers, they are less helpful in helping local governments understand what factors cause WNV and what they can do to mitigate them.

### 1.3 Modelling Approach and Strategy
The presence of WNV is a function of three things:
> 1. <b>Mosquito activity</b>: Mosquitos are more active during hot and humid periods. This increased activity leads to increased transmission of the virus between bird, mosquito, and human, as feeding frequency increases. We will, therefore, build several weather features into our model. This includes point humidity, temperature, precipation, as well as rolling averages of these factors. Length of day (i.e. period between sunrise and sundown) is also hypothesized to be a predictor of mosquito activity, due to the increased activity periods.

> 2. <b>Mosquito breeding</b>: Mosquitos breed in stagnant, standing fresh water. Their eggs can survive in stasis for more than 10 years, and will only hatch when the conditions are right. Mosquitoes begin to hatch, breed, and attack when the weather is at a consistent 50 degrees Fahrenheit (10 degrees Celsius), but mosquito eggs held at 22 and 27°C had the highest overall mean hatching count, as described in <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2705337/">this study.</a>. This also implies that prior years' mosquito populations could lead to future outbreaks, particularly when there are long periods of drought or cold weather.


> 3. <b>Presence of infected birds</b>: The number of mosquitos alone is a not an accurate predictor of WNV, as the mosquito needs to feed on an infected bird before becoming a disease vector. In the United States, WNV mosquito vectors feed preferentially on members of the Corvidae and thrush family. Among the preferred species within these families are the <a href = 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1636093'>American crow, corvids, and the American robin. </a> Areas with higher populations of these birds are hypothesized to be at greater risk of WNV, though the diverse habitats of these species means that we may not have sufficient data on hand to make deeper analyses on the interaction effect between bird and mosquito.

Our feature selection strategy combines these three elements.
Because the proportion of WNV infected mosquitos to non-infected mosquitos is fairly low, our data set is heavily imbalanced and skewed towards non-WNV carrying mosquitos (i.e. WnvPresent = 0). Two strategies will be attempted to address this: 1) The generation of synthetic samples (SMOTE), and 2) The use of models that can handle imbalanced classes (Random Forests).

A variety of models will be generated, and these models will be combined via a stacking strategy utilizing the mlxtend library - an ensemble-learning meta-classifier capable of ensembling models using different feature sets. By ensembling these models, we will be leveraging on the 'wisdom of the crowd' phenemonon to make our predictions as each model is expected to have its own strengths and weaknesses in making predictions. Ensembling should therefore cancel out the various models' weaknesses and lend to a better overall model.

For evaluating our model, we will use two metrics: AUC-ROC score, and Recall. The AUC-ROC score gives us a good idea of how well the model performances in terms of its ability to distinguish positive and the negative values, whilst the Recall score is important as it represents our model's ability to correctly predict the apperance of WNV infected mosquitos.



Project Contents:
- <a href='#Introduction'>1. Introduction</a>
    - <a href='#Introduction'>1.1 What is the West Nile Virus</a>
    - <a href='#Introduction'>1.2 Problem Statement</a>
    - <a href='#Introduction'>1.3 Modelling Strategy</a>


- <a href='#Table of Contents'>2. Table of Contents</a>


- <a href='#Data Imports'>3. Library Imports</a>


- <a href='#Data Overview'>4. Data Imports and Overview</a>
    - <a href='#Evaluating Shape'>4.1 Evaluating Shape, Missingness, and Duplicates</a>    
    - <a href='#Investigating Duplicates'>4.2 Investigating Duplicates</a>
    - <a href='#Analysis of Datasets'>4.3 Analysis of Datasets</a>
    - <a href='#Data Dictionary'>4.4. Data Dictionary</a>             
    
  
- <a href='#Model 1'>5. Feature Engineering - Model 1</a>    
    - <a href='#Model 1'>5.1 Correcting Date Time Data</a>  
    - <a href='#Grouping Mosquitos'>5.2 Grouping Mosquitos</a>  
    - <a href='#Diff Weather'>5.3 Cleaning and Evaluating Differences in Weather Stations</a>  
    - <a href='#Clean Train'>5.4 Cleaning Train Data</a>  
    - <a href='#Eval Geog'>5.5 Evaluating Geography</a>  
    - <a href='#Dummy Var'>5.6 Dummying Variables</a>      
    
    
- <a href='#Model 2'>6. Feature Engineering - Model 2</a>
    - <a href='#clean weather 2'>6.1 Dummying Variables</a>   
    - <a href='#clean train 2'>6.2 Cleaning Train and Test Data</a>   
    - <a href='#clean spray 2'>6.3 Cleaning Spray Data</a>   
 
 - <a href='#Model 2'>7. Baseline Model, and Generalized Additive Models</a>
 - <a href='#clean weather 2'>8. CART Models</a>   
 - <a href='#clean train 2'>9. Unsupervised Clustering with XGBoost</a>   
 
 - <a href='#clean spray 2'>10. Conclusions</a>   
  
Overall findings were that the GAM performed the best AUC/ROC wise, with a Kaggle Score of 0.8, but the CART models tend to perform better in terms of recall.
