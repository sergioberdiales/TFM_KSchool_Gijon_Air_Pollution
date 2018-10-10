
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