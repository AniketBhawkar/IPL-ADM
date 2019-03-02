library(dplyr)
match <-  read.csv("F:/Masters/Semester 2/Advanced Data Mining/IPL/raghu543-ipl-data-till-2017/Match.csv")
#Team1
match$Team1[is.na(match$Team1)] = 0
match$Team1 = ifelse(match$Team1=="Delhi Daredevils", 1, ifelse(match$Team1=="Chennai Super Kings", 3, ifelse(match$Team1=="Deccan Chargers", 8, ifelse(match$Team1=="Gujarat Lions", 13, ifelse(match$Team1=="Kings XI Punjab", 4,ifelse(match$Team1=="Kochi Tuskers Kerala",9,ifelse(match$Team1=="Kolkata Knight Riders", 1,ifelse(match$Team1=="Mumbai Indians",7,ifelse(match$Team1=="Pune Warriors",10,ifelse(match$Team1=="Rajasthan Royals",5,ifelse(match$Team1=="Rising Pune Supergiants",12,ifelse(match$Team1=="Royal Challengers Bangalore",2,ifelse(match$Team1=="Sunrisers Hyderabad ",11, 0)))))))))))))
#Team2
match$Team2[is.na(match$Team2)] = 0
match$Team2 = ifelse(match$Team2=="Delhi Daredevils", 1, ifelse(match$Team2=="Chennai Super Kings", 3, ifelse(match$Team2=="Deccan Chargers", 8, ifelse(match$Team2=="Gujarat Lions", 13, ifelse(match$Team2=="Kings XI Punjab", 4,ifelse(match$Team2=="Kochi Tuskers Kerala",9,ifelse(match$Team2=="Kolkata Knight Riders", 1,ifelse(match$Team2=="Mumbai Indians",7,ifelse(match$Team2=="Pune Warriors",10,ifelse(match$Team2=="Rajasthan Royals",5,ifelse(match$Team2=="Rising Pune Supergiants",12,ifelse(match$Team2=="Royal Challengers Bangalore",2,ifelse(match$Team2=="Sunrisers Hyderabad ",11, 0)))))))))))))
#remove match_date
match <- match[,-5]
#Toss_Winner
match$Toss_Winner[is.na(match$Toss_Winner)] = 0
match$Toss_Winner = ifelse(match$Toss_Winner=="Delhi Daredevils", 1, ifelse(match$Toss_Winner=="Chennai Super Kings", 3, ifelse(match$Toss_Winner=="Deccan Chargers", 8, ifelse(match$Toss_Winner=="Gujarat Lions", 13, ifelse(match$Toss_Winner=="Kings XI Punjab", 4,ifelse(match$Toss_Winner=="Kochi Tuskers Kerala",9,ifelse(match$Toss_Winner=="Kolkata Knight Riders", 1,ifelse(match$Toss_Winner=="Mumbai Indians",7,ifelse(match$Toss_Winner=="Pune Warriors",10,ifelse(match$Toss_Winner=="Rajasthan Royals",5,ifelse(match$Toss_Winner=="Rising Pune Supergiants",12,ifelse(match$Toss_Winner=="Royal Challengers Bangalore",2,ifelse(match$Toss_Winner=="Sunrisers Hyderabad ",11, 0)))))))))))))
table(match$Toss_Winner)
#match_winner
match$match_winner[is.na(match$match_Winner)] = 0
match$match_winner = ifelse(match$match_winner=="Delhi Daredevils", 1, ifelse(match$match_winner=="Chennai Super Kings", 3, ifelse(match$match_winner=="Deccan Chargers", 8, ifelse(match$match_winner=="Gujarat Lions", 13, ifelse(match$match_winner=="Kings XI Punjab", 4,ifelse(match$match_winner=="Kochi Tuskers Kerala",9,ifelse(match$match_winner=="Kolkata Knight Riders", 1,ifelse(match$match_winner=="Mumbai Indians",7,ifelse(match$match_winner=="Pune Warriors",10,ifelse(match$match_winner=="Rajasthan Royals",5,ifelse(match$match_winner=="Rising Pune Supergiants",12,ifelse(match$match_winner=="Royal Challengers Bangalore",2,ifelse(match$match_winner=="Sunrisers Hyderabad ",11, 0)))))))))))))
table(match$match_winner)

#ManOfMatch
df <- read.csv("F:/Masters/Semester 2/Advanced Data Mining/IPL/raghu543-ipl-data-till-2017/Player.csv")
df$ManOfMach = df$Player_Name
df <- df[,c(-1,-3,-4,-5,-6,-7)]
match= match %>%
  left_join(df, by=c("ManOfMach"))
match <- match[,-14]

#remove country ID
match <- match[,-15]