df = read.csv(file.choose())
df
setwd('C:/Users/Sukhm/Downloads/tableau')
path = getwd()

na.omit(df)Quote()
df = subset(df, select = -c(Published.Airline, Published.Airline.IATA.Code))
summary(df)

library(dplyr)

#popularity 
airlinePassenger = df %>%
  select(index, Operating.Airline, Passenger.Count)

write.csv(airlinePassenger, paste(path, 'airlinePassenger.csv'))

#regionwise comparison
geoAirline = df %>%
  select(index, GEO.Region, Operating.Airline)

write.csv(geoAirline, paste(path, 'geoairline.csv'))

#Domestic vs International flight count
summaryAirline = df%>%
  select(index, GEO.Summary, Operating.Airline)

write.csv(summaryAirline, paste(path, 'summaryairline.csv'))

#international vs domestic passenger comparison
passengerCnt = df%>%
  select(index, GEO.Summary, Passenger.Count)
write.csv(passengerCnt, paste(path, 'passengercnt.csv'))

#passenger count per country
geoPassenger = df %>%
  select(index, GEO.Region, Passenger.Count)
write.csv(geoPassenger, paste(path, 'geopassenger.csv'))

#yearly comparison of operating airlines
yearPassenger = df%>%
  select(index, Year, Passenger.Count)
write.csv(yearPassenger, paste(path, 'yearpassenger.csv'))
