# revenue by stores

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

dvdrental={"store_id":[1,2,1,2,2,1,1,1,2,2,1,2,2,1,1,2,2,1,1,2],
          "inventory_id":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], 
          "movie_cost": [5,6,4,8,2,4,6,7,12,9,3,4,7,8,9,11,2,10,9,8],
          "rental_id": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,21],
          "amount":[7,8,10,12,13,11,9,7,10,11,12,13,11,14,9,8,10,11,12,10], 
          "customer_id": [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]}

# manualy made dict just to demonstrate

dvd = pd.DataFrame.from_dict(dvdrental)

dvd.grp = dvd.groupby('store_id')['amount'].sum().reset_index()
revenue_by_stores = sns.barplot(x='store_id', y='amount', data= dvd.grp)

# revenue per client

