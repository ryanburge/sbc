first50$text <- gsub("\t", " ", first50$text)

first50$text <- gsub("Whereas", " Whereas", first50$text)
first50$text <- gsub("andWhereas", "and Whereas", first50$text)


tidy <- first50 %>% unnest_tokens(word, text)

tidy <- tidy %>% 
  filter(!word %in% stop_words$word)

count <- tidy %>% group_by(year) %>% 
  count(word, sort = TRUE)

font_add_google("Oswald", "Oswald", regular.wt = 400)
font_add_google("Scope One", "Scope One")
font_add_google("Shrikhand", "ss")


showtext_auto()


tidy %>% 
  filter(word == "alcohol" | word == "homosexuality" | word == "abortion" | word == "pornography") %>% 
  mutate(word = recode(word, "'alcohol'= '  Alcohol    '; 'abortion' = '  Abortion      '; 'homosexuality' = '  Homosexuality     '; 'pornography' = '  Pornography'")) %>% 
  mutate(label = "SBC") %>% 
  ggplot(., aes(x=year, y = label)) +
  geom_density_ridges(aes(fill = factor(word)), size = .1, scale = 15.8, alpha = .8) +
  scale_fill_nord(palette = "victory_bonds") +
  labs(title = "SBC Resolution Subject Trends", caption = "Data from SBC Resolutions (1968-2018)") +
  theme_minimal(base_family = "Oswald", base_size = 25) + 
  theme(legend.position="bottom") + theme(legend.title=element_blank()) +  theme(legend.margin=margin(t=-1.25, r=0, b=0, l=0, unit="cm")) +
  labs(x = "", y = "Trend of Appearances") +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())
  
ggsave(file="D://yp_scrapes/sbc_ridges.png", type = "cairo-png", width = 4, height = 2.5)


count2 %>% 
  mutate(label = "SBC") %>% 
  ggplot(., aes(x=year, y = label, height = n)) +
  geom_ridgeline(stat = "identity") +
  scale_fill_nord(palette = "lumina") +
  labs(title = "SBC Resolution Word Count") +
  theme_minimal(base_family = "Oswald", base_size = 25) + 
  theme(legend.position="bottom") + theme(legend.title=element_blank()) +  theme(legend.margin=margin(t=-1.25, r=0, b=0, l=0, unit="cm")) +
  labs(x = "") 




ggsave(file="D://yp_scrapes/sbc_ridges.png", type = "cairo-png", width = 4, height = 2)



