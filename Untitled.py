#!/usr/bin/env python
# coding: utf-8

# In[9]:


import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns


# In[10]:


data=pd.read_csv(r"C:\Users\abhis\Downloads\Zomato data .csv")


# In[11]:


data.head()


# In[12]:


data.describe()


# In[14]:


data.dtypes


# In[ ]:


# First converting datatype of rate from object to  flot value and removing denominator


# In[18]:


def HandleRate(value):
    value=str(value).split('/')
    value=value[0]
    return float(value)

data['rate']=data['rate'].apply(HandleRate)



# In[19]:


data.head()


# In[20]:


data.info()


# In[ ]:


# no null value is there


# In[ ]:


#Type of restaurant


# In[23]:


sns.countplot(x=data['listed_in(type)'])
plt.xlabel("Type of Restaurant")


# In[ ]:


# the majority of the taurants fallinto dining category


# In[ ]:


#Dining restaurants preferred by a larger number of people


# In[26]:


grouped_data=data.groupby('listed_in(type)')['votes'].sum()
result=pd.DataFrame({'votes': grouped_data})
plt.plot(result,c="green",marker="o")
plt.xlabel('Type of Restaurant',c="red",size=20)
plt.ylabel("votes",c="red",size=20)


# In[ ]:


#The majority of restaurants received ratings


# In[27]:


plt.hist(data['rate'],bins=5)
plt.title('Ratings Distribution')
plt.show()


# In[29]:


#conclusion: The majority of restaurants received ratings ranging from 3.5 to 4.


# In[30]:


#The majority of couples prefer restaurants with an approximate cost of 300 rupees.


# In[31]:


couple_data=data['approx_cost(for two people)']
sns.countplot(x=couple_data)


# In[ ]:


#whether online orders receive higher ratings than offline orders


# In[32]:


plt.figure(figsize=(6,6))
sns.boxplot(x='online_order', y='rate',data=data)


# In[ ]:


#conclusion: offline orders received lower ratings in comparison to online orders,which obtained excellent ratings.


# In[33]:


pivot_table=data.pivot_table(index='listed_in(type)',columns='online_order',aggfunc='size',fill_value=0)
sns.heatmap(pivot_table,annot=True,cmap="YlGnBu",fmt='d')

plt.title('Heatmap')
plt.xlabel("online order")
plt.ylabel("Listed In(Type)")
plt.show()


# In[ ]:




