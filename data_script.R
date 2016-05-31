library(dplyr)
library(tidyr)
library(RODBC)

db=odbcConnectAccess2007("Age9010.accdb")

age_place=sqlFetch(db, "Age9010")%>%
  mutate(place=stringr::str_sub(GISJOIN, -5, -1))

single=readxl::read_excel("Largest Industries by Share.xlsx", skip=1)

write.csv(age_place, "age_place.csv", row.names = FALSE)
write.csv(single, "single.csv", row.names = FALSE)


