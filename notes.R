
# correlation matrix
# http://www.sthda.com/english/wiki/ggplot2-quick-correlation-matrix-heatmap-r-software-and-data-visualization

# year_means <- air_data_

year_pm10 <- air_data_2 %>% select(PM10, year, station_alias) %>% 
  group_by(year, station_alias) %>%
  summarise(PM10_mean = mean(PM10, na.rm = TRUE))

ggplot(year_pm10, aes(year, PM10_mean, colour = station_alias)) + 
  geom_line()

year_co <- air_data_2 %>% select(CO, year, station_alias) %>% 
  group_by(year, station_alias) %>%
  summarise(CO_mean = mean(CO, na.rm = TRUE))

ggplot(year_co, aes(year, CO_mean, colour = station_alias)) + 
  geom_line()

year_pm25 <- air_data_2 %>% select(PM25, year, station_alias) %>% 
  group_by(year, station_alias) %>%
  summarise(PM25_mean = mean(PM25, na.rm = TRUE))

ggplot(year_pm25, aes(year, PM25_mean, colour = station_alias)) + 
  geom_line()

year_o3 <- air_data_2 %>% select(O3, year, station_alias) %>% 
  group_by(year, station_alias) %>%
  summarise(O3_mean = mean(O3, na.rm = TRUE))

ggplot(year_o3, aes(year, O3_mean, colour = station_alias)) + 
  geom_line()


# recorte este codigo sobre nas:

nas <- air_data_2 %>% 
  group_by(station_alias, year(date_time_utc)) %>%
  select(everything()) %>%  
  summarise_all(funs(sum(is.na(.))))

nas_per <- air_data_2 %>% 
  group_by(station_alias, year(date_time_utc)) %>%
  select(everything()) %>%  
  summarise_all(funs(round(sum(is.na(.))/n(), 2)))


# Voy a hacer la prediccion mensual de pm10 con otro paquete de r. Pego aqui todo el codigo utilizado hasta ahora

And we plot it.
```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

plot(pm10_month_ts)

```


We remove the trend with the "diff" and plot it.
```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

plot(diff(pm10_month_ts))

```

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

acf2(pm10_month_ts)

```
```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

sarima(pm10_month_ts, 0, 0, 1)

```

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

sarima(pm10_month_ts, 1, 0, 0)

```

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

sarima(pm10_month_ts, 1, 0, 1)

```

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

sarima(pm10_month_ts, 1, 1, 1)

```
```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}

sarima(pm10_month_ts, p = 1, d = 1, q = 1, P = 0, D = 1, Q = 1, S = 12)

```

As we saw before there are two clearly different periods in the data. We are going to use now only the second period.
```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}


sarima(pm10_2nd_ts, p = 1, d = 1, q = 1, P = 0, D = 1, Q = 1, S = 12)

```

The results are significantly better.

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}


sarima(pm10_2nd_ts, p = 1, d = 1, q = 1, P = 1, D = 1, Q = 1, S = 12)

```


Predicting 12 months

```{r warning = FALSE, message= FALSE, out.width= '\\textwidth'}


sarima.for(pm10_2nd_ts, n.ahead = 12, 1, 1, 1, 1, 1, 1, 12)

```
