# Bibliotheken & Konfiguration
library(readr)
library(tidyr)
library(ggplot2)
library(lubridate)
base_url <- "https://raw.githubusercontent.com/ganslats/TMF-School-2021-Block-7/master/Rohdaten/john-snow/"


# Zeitverlauf Infektionen & Todesfälle laden
snow.dates.raw <- read_csv(paste(base_url, "snow.dates.csv", sep=""), 
                           col_names = c("index", "date", "attacks", "deaths"),
                           col_types = cols("i", col_date(format = "%Y-%m-%d"), "i", "i"),
                           skip = 1)

# Datentabelle Zeitverlauf anzeigen
View(snow.dates.raw)

# Zeitverlauf plotten
snow.dates.long <- snow.dates.raw %>% pivot_longer(!c(index, date), names_to="variable", values_to="n")
plot <- ggplot() +
  geom_area(data = snow.dates.long, aes(x=date, y=n, fill=variable), alpha=0.5, position="identity") 
plot

# Gesamtanzahl von Ereignissen hinzufügen & im Plot ergänzen
snow.dates.raw$total_events <- snow.dates.raw$attacks + snow.dates.raw$deaths
plot <- plot + geom_line(data = snow.dates.raw, aes(x=date, y=total_events))
plot
