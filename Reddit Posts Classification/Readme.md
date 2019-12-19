# Problem Statement
----------------------------------
- A firm ABC Consultancy services offers various consultancy services. As part of marketing strategy, the firm wants to 
    - build a model that reads the posts of category - 'Anger' and 'Meditation' from reddit
    - able to classify the category to whichg the post belongs
    - Using the prediction can offer Anger Management or Meditaion Session services as part of marketing/ consultancy services
    - For this we need to build and train the model so that model can correctly classify the posts and enable the firm to run business model

# Executive Summary
-----------------------------------
- Webscrape reddit to collect posts for category - Anger, Meditation
- Make a dataset of combined posts
- Label categories as 
    - Anger - 1
    - Meditation - 0
- From this dataset, randomly select 100 posts which will be used to test predictions on various model that will be used for modeling
- Save (on the disk as csv files) the big dataset for train/test purpose during modeling and sliced dataset as final test on model
- Read both dataset on do cleaning
    - do train/test split
    - consider only words by using regex
    - lower case the characters in posts
    - apply lemmatization
    - clean the posts
- Use CountVectorizer using stopwords(including 'Anger' and 'Meditation' and synonym words to these categories) to remove these words from features
    - get the features list
    - do this for train,test, final test datas set
- Train model on the vectorizer 
- For predictions
    - check for train/test score, final test score
    - accuracy of validation set and final test set
- Compare and recommend the best model based on comparison

## Comparison and Recommendation
------------------------------------------------
- I have fit 4 models on reddit posts with two categories - Anger and Meditaion labeled as 1 and 0
    - Lasso Logistic Regression model
    - Ridge Logistic Regression model
    - Multinomial Naive Bayes model
    - Random Forest model
- From metrics it can be seen that MultiNomialNB and Ridge Logistic Regression have good validation and accuracy score with final Test accuracy of 0.84
- Need more posts to train the model so that model can give good test accuracy and can be used for best predictions
- From metrics MultiNomialNB can be considered as best fit

## Special Notes
----------------------
- Please install textblob using pip install -U textblob
- There are two Jupyter Notebook files
- File 'code_scrape_reddit.ipynb' is to webscrape data for two categories, save on disk, generate wordcloud
- File 'code_cleaning_modeling_prediction.ipynb' is to do clean data, use lemmatization etc. and do modeling and comparison