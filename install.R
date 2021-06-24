packages <- c("leaflet", "ggmap", "readr", "tidyr", "ggplot2", "dplyr", "DBI", "RSQLite", "stringr", "icd.data", "lubridate", "zoo", "forcats", "grid", "gtable", "readr", "dplyr", "tidyr", "leaflet", "tidygeocoder", "sf", "ggmap")
install.packages(setdiff(packages, rownames(installed.packages())))
