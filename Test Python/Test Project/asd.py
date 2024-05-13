import numpy as np
np.bool = np.bool_
import theano 
import pymc3 as pm

sales = df['sales'].values.astype(float)
n = len(sales)

with pm.Model() as model:
    a = pm.Normal('a', mu=0, sd=1e-4)
    b = pm.Normal('b', mu=0, sd=1)
    phi = pm.Uniform('phi', lower=-1, upper=0.999)
    tau0 = pm.Gamma('tau0', alpha=1, beta=1e-3)
    tau = pm.Gamma('tau', alpha=1, beta=1e-3, shape=n)
    y = pm.AR('y', a=a + b * x, tau=tau, observed=sales)

    trace = pm.sample(5000, tune=2500, chains=1)