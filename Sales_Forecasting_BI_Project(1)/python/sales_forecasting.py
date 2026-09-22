import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.arima.model import ARIMA

df = pd.read_csv("../data/sales_data.csv")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
df = df.drop_duplicates().dropna()

monthly = df.set_index("Order_Date").resample("MS")["Sales"].sum()

# EDA
plt.figure(figsize=(12,5))
monthly.plot()
plt.title("Monthly Sales Trend")
plt.xlabel("Date")
plt.ylabel("Sales")
plt.tight_layout()
plt.savefig("../screenshots/monthly_sales.png")
plt.show()

# Forecast
model = ARIMA(monthly, order=(1,1,1))
fit = model.fit()
steps = 6
forecast_obj = fit.get_forecast(steps=steps)
forecast = forecast_obj.predicted_mean
ci = forecast_obj.conf_int()

result = pd.DataFrame({
    "Date": forecast.index,
    "Forecast_Sales": forecast.values,
    "Lower_Bound": ci.iloc[:,0].values,
    "Upper_Bound": ci.iloc[:,1].values
})
result.to_csv("../data/forecast_results.csv", index=False)
print(result)
