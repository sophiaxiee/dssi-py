#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import datetime
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, MinMaxScaler
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import classification_report
from joblib import dump, load
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.ensemble import RandomForestClassifier

sns.set_theme(style="ticks", palette="pastel")

def remove_outliers(df, col: str):
    q3 = np.quantile(df[col], 0.75)
    q1 = np.quantile(df[col], 0.25)
    l_lmt = q1 - 1.5 * (q3 - q1)
    u_lmt = q3 + 1.5 * (q3 - q1)
    return df[(df[col] >= l_lmt) & (df[col] <= u_lmt)].copy()
    
#Read Sample Dataset
raw_df = pd.read_csv('/Users/xiezhuoying/Desktop/NUS/DSSI/Day_2/dssi-py-main/diabetes.csv')
raw_df.head()


# In[2]:


#Check of missing values
raw_df.isnull().sum()


# In[3]:


glucose_avg = raw_df['Glucose'].mean()
blood_pressure_avg = raw_df['BloodPressure'].mean()
bmi_avg = raw_df['BMI'].mean()

raw_df['Glucose'].fillna(glucose_avg, inplace=True)
raw_df['BloodPressure'].fillna(blood_pressure_avg, inplace=True)
raw_df['BMI'].fillna(bmi_avg, inplace=True)

print(raw_df.isnull().sum())


# In[4]:


raw_df.describe(include='all')


# In[7]:


features = ['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'DiabetesPedigreeFunction', 'Age']
label = 'Outcome'


# In[8]:


X_train, X_test, y_train, y_test = train_test_split(raw_df[features], \
                                                    raw_df[label], \
                                                    test_size=0.2, \
                                                    random_state=0)
X_train.head()


# In[11]:


from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report

rf_model = RandomForestClassifier(n_estimators=100, random_state=0)  # n_estimators 是树的数量

rf_model.fit(X_train, y_train)

y_pred = rf_model.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)
print("Classification Report:")
print(classification_report(y_test, y_pred))

