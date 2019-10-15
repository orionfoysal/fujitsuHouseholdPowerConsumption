library('prophet')

df <- read.csv('/Users/foysal/Fujitsu/assignment/Smartmeter/prophet_input.csv')

#df <- read.csv('prophet_granular_input.csv')

m <- prophet(df, yearly.seasonality = TRUE, daily.seasonality = TRUE)

future <- make_future_dataframe(m, periods = 365)
tail(future)

forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

plot(m, forecast)


prophet_plot_components(m, forecast)
