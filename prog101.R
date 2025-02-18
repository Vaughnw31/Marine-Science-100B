##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)
?kefj
# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
# KEFJ stands for Kenai Fjords
# How was temperature monitored?
# HOBO V2 temperature loggers were used to record temperatures at the sites.

# What's the difference between absolute temperature and temperature anomaly?
# Absolute temperature is the temperature as recorded by the sensor, and
# temperature anomaly is the difference form long term mean temperature


# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there?
6
# How long are they?
1295038
length(kefj_temperature)
# What do they represent?
# temeprature, site name, date and time of recording, tide level, exposure to
# air/water, season of year
# Link to sketch

aialik_datetime <- kefj_datetime[kefj_site == "Aialik"]
common_interval <- aialik_datetime[2:length(aialik_datetime)]-aialik_datetime[1:(length(aialik_datetime)-1)]
table(common_interval)
 common interval is 30 mins


# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?
which.max(kefj_temperature)
hottest_day <- 158962
kefj_temperature[c(hottest_day)]
kefj_site[c(hottest_day)]
hottest <- kefj_datetime[c(hottest_day)]
max=36.092 in Aialik 2018-07-03 13:00:00 -08
which.min(kefj_temperature)
coldest_day <- 63809
kefj_temperature[c(coldest_day)]
kefj_site[c(coldest_day)]
kefj_datetime[c(coldest_day)]
min=-11.613 in Aialik 2013-01-27 21:00:00 -08
# Link to sketch

# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# Repeat for the coldest day
coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2013-01-27 00:00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59:59", tz = "Etc/GMT+8")
coldday_idx <- kefj_site == coldest_site &
  kefj_datetime >= coldday_start &
  kefj_datetime <= coldday_end
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)
# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?
 #temperature is consistent when the logger is in water, and is only exposed to
#these extreme temperatures when exposed to air. The coldest temperature is
#unsurprisingly recorded at night, in the winter, when exposed to the air, while
# the warmest temperature was recorded during the day, in the summer, exposed to
#air.
# How did Traiger et al. define extreme temperature exposure?
exposure to extreme warm (≥25°C) and cold (≤−4°C) air temperatures
# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.
kefj_exposure(hottest_day(c[kefj_temperature>25]))
extreme_hot_temp <- (kefj_temperature)[hotday_start] > 25

kefj_temperature

extreme_time_hot <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end


extreme_temp_hot <- kefj_temperature[extreme_time_hot] >= 25
extreme_temp_exp <- (extreme_temp_hot == "TRUE") / 2
sum(extreme_temp_exp)

extreme_temp_exposure <- ()
# equals 3.5 so 3.5 hours exposed to temps above 25 degrees

# Compare your answer to the visualization you made. Does it look right to you?
yes
# Repeat this process for extreme cold exposure on the coldest day.
extreme_time_cold <- kefj_site == coldest_site &
  kefj_datetime >= coldday_start &
  kefj_datetime <= coldday_end


extreme_temp_cold <- kefj_temperature[extreme_time_cold] <= -4

extreme_temp_exp_cold <- (extreme_temp_cold == "TRUE") / 2
extreme_temp_exp_cold
sum(extreme_temp_exp_cold)
# 4 hours of extreme cold exposure
# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
