library(rvest)
library(tidyverse)
library(tidytext)
library(qdapRegex)


get_text <- function(url) {
  url %>%
    read_html() %>%
    html_nodes("p") %>% 
    html_text()
}

sbc <- "http://www.sbcannualmeeting.net/sbc18/resolution?ID=2284"


results <- sapply(sbc, get_text)

dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)

r1 <- bind_rows(dfs) %>% as.tibble() %>% 
  rename(text = X..i..)

r1$text <- gsub("\r?\n|\r", " ", r1$text)

filter(r1, !is.na(text) | text != " ")

r1[r1==""] <- NA

r1 <- na.omit(r1)

r1$text <- trimws(r1$text, which = c("left"))
options(tibble.print_max = 10)

r1 <- r1 %>% mutate(id = seq(1:211))

r_1 <- r1 %>% filter(id >1 & id <= 14) %>% mutate(subject = "On the Dignity and Worth of Women")
r_2 <- r1 %>% filter(id >= 15 & id <= 35) %>% mutate(subject = "On Abuse")
r_3 <- r1 %>% filter(id >= 36 & id <= 45)  %>% mutate(subject = "On the Holiness and Integrity of Ministry Leaders")
r_4 <- r1 %>% filter(id >= 46 & id <= 57) %>% mutate(subject = "On Renoucning the Curse of Ham Doctrine")
r_5 <- r1 %>% filter(id >= 58 & id <= 73) %>% mutate(subject = "On Immigration")
r_6 <- r1 %>% filter(id >= 74 & id <= 89) %>% mutate(subject = "On Reaffirming the Full Dignity of Every Human Being")
r_7 <- r1 %>% filter(id <= 90 & id <= 98) %>% mutate(subject = "On Christlike Commnication and the Use of Social Media")
r_8 <- r1 %>% filter(id >= 99 & id <= 112) %>% mutate(subject = "On Gun Violence and Mass Shootings")
r_9 <- r1 %>% filter(id >= 113 & id <= 133) %>% mutate(subject = "On Opiod Abuse and Addiction")
r_10 <- r1 %>% filter(id >= 134 & id <= 145) %>% mutate(subject = "On Prayer and Support for Arab Christians")
r_11 <- r1 %>% filter(id >= 146 & id <= 158) %>% mutate(subject = "On the 50th Anniversary of Southern Baptist Disaster Relief")
r_12 <- r1 %>% filter(id >= 159 & id <= 173) %>% mutate(subject = "On the 50th Anniversary of Guidestone Finanical Resources")
r_13 <- r1 %>% filter(id >= 174 & id <= 185)  %>% mutate(subject = "On Centennial Anniversary of New Orleans Baptist Theological Seminary")
r_14 <- r1 %>% filter(id >= 186 & id <= 192) %>% mutate(subject = "On Commemorating the Life and Ministry of Billy Graham")
r_15 <- r1 %>% filter(id >= 194 & id <= 205) %>% mutate(subject = "On Affirmation of Foundational and Compassionate Commitments in Several Submitted Resolutions")
r_16 <- r1 %>% filter(id >= 206 & id <= 211) %>% mutate(subject = "On Appreciation")

sbc_2018 <- bind_rows(r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8, r_9, r_10, r_11, r_12, r_13, r_14, r_15, r_16)

sbc_2018$text <- rm_url(sbc_2018$text, pattern=pastex("@rm_twitter_url", "@rm_url"))

sbc_2018$text <- gsub("Permalink URL:", "", sbc_2018$text)

tidy <- sbc_2018 %>% unnest_tokens(word, text)

tidy <- tidy %>% 
  filter(!word %in% stop_words$word)

tidy$word <- gsub('[[:digit:]]+', 'NA', tidy$word)

tidy <- tidy %>% filter(word != "NA")

cloud <- tidy %>%
  count(word, sort = TRUE)

wordcloud2(cloud)

facet <- tidy %>% 
  group_by(subject) %>% 
  count(word, sort = TRUE) %>%
  top_n(3) %>% 
  arrange(subject)


write_csv(sbc_2018, "sbc2018.csv")
