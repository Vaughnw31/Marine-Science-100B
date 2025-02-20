# What do the following expressions do?
temp_F <- temp_C * 9/5 - 32
rect_area <- rect_length * rect_width
# Convert temp in celsius to temp in fahrenheit and get a rectangles area by
# multiplying base and height

# Fill in the question marks to complete these expressions
triangle_area <- 1/2 * base * height
cylinder_volume <- pi * cylinder_radius^2 * cylinder_height

  # What are the errors in these expressions?
  speed_m_s <- distance_m * time_s
  # Speed is distance/time
acceleration m s2 <- speed_m_s / time_s
# acceleration_m_s^2
force_N < mass + acceleration_m_s2
 # Improper arrow should be <-, multiply not add

# The energy density of market squid is 4850 joules per gram[1]. If a 225 kg
# Risso's dolphin needs 5 million joules of energy per day[2] and a typical
# market squid is 35 g[1], then how many squid does a Risso's dolphin need to
# eat each day? Solve the above word problem in R. Consider how many variables
# you need to create, what to name them to make the code readable, and how to
# combine them into expressions.
energy_per_squid_j <- 4850 * 35
dolphin_daily_energy_j <- 5000000
dolphin_diet <- dolphin_daily_energy_j / energy_per_squid_j
dolphin_diet = 29.45508
# [1] Price et al. 2024 https://doi.org/10.3389/fmars.2023.1345525
# [2] Barlow et al. 2008 https://doi.org/10.3354/meps07695



