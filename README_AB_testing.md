# AB testing
### In this case study we test which promotion was the most effective. The data set looks like this: 
![plot](https://github.com/pavlinakrmelova/dvd_rental/blob/master/png/ab-testing-describe.PNG)

#### We will run basic funkcions to see the mean, standart deviation and count of promotions
```python
means = df.groupby('Promotion').mean()['SalesInThousands']
stds = df.groupby('Promotion').std()['SalesInThousands']
ns = df.groupby('Promotion').count()['SalesInThousands']
```
####
![plot2](https://github.com/pavlinakrmelova/dvd_rental/blob/master/png/ab-testing-promotion.PNG)

```python
t, p = stats.ttest_ind(df.loc[df['Promotion'] == 1, 'SalesInThousands'].values,
                       df.loc[df['Promotion'] == 2, 'SalesInThousands'].values, 
                       equal_var=False)
print('t-value = ' +str(t))
print('p-value = ' +str(p))

t-value = 6.42752867090748
p-value = 4.2903687179871785e-10

```
#### Here we get values from t-test. We are comparing promotion 1 and 2. P-value is smaller than 5%, so we can say that there is difference between groups. But we can say promotion 1 outperforms promotion 2 in statisticaly significant way. Let's look on the 1st and 3rd promotion.


```python
t, p = stats.ttest_ind(df.loc[df['Promotion'] == 1, 'SalesInThousands'].values, 
                       df.loc[df['Promotion'] == 3, 'SalesInThousands'].values, 
                       equal_var=False)
print("t-value = " +str(t))
print("p-value = " +str(p))

t-value = 1.5560224307758634
p-value = 0.12059147742229478
```
#### P-value is high, we can't reject null hypothesis. It meands these is not a statistical difference between the two groups.