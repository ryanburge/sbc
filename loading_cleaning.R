library(socsci)
library(car)
library(nord)
library(ggridges)
library(haven)


mip <- read_dta("D://sbc/MIPD/aggregate.dta")

labs <- mip %>%
  map(~attributes(.)) %>%
  map_chr("label", .default = NA)

mip$year <- format(as.Date(mip$fw_start, format="%Y-%m-%d"),"%Y")


sbc1 <- read_csv("D://sbc/sbc1845to1895.csv") %>% select(-X1)
sbc2 <- read_csv("D://sbc/sbc1896to1967.csv") %>% select(-X1)
sbc3 <- read_csv("D://sbc/sbc_1968_2018.csv")

all_res <- bind_rows(sbc1, sbc2, sbc3)


all_res$text <- gsub("\t", " ", all_res$text)

all_res$text <- gsub("Whereas", " Whereas", all_res$text)
all_res$text <- gsub("andWhereas", "and Whereas", all_res$text)

all_res$ID <- seq.int(nrow(all_res))

all_res <- all_res %>% 
  mutate(year = paste(year, ID, sep = "_"))


tidy <- all_res %>% unnest_tokens(word, text)

tidy <- tidy %>% 
  filter(!word %in% stop_words$word)

count <- tidy %>% group_by(year) %>% 
  count(word, sort = TRUE)

font_add_google("Oswald", "Oswald", regular.wt = 400)
font_add_google("Scope One", "Scope One")
font_add_google("Shrikhand", "ss")


showtext_auto()


tidy %>% 
  filter(word == "alcohol" | word == "homosexuality" | word == "abortion" | word == "pornography" | word == "drugs") %>% 
  mutate(word = recode(word, "'alcohol'= '  Alcohol    '; 'abortion' = '  Abortion      '; 'homosexuality' = '  Homosexuality     '; 'pornography' = '  Pornography'; 'drugs' = '    Drugs   '")) %>% 
  mutate(label = "SBC") %>% 
  ggplot(., aes(x=year, y = label)) +
  geom_density_ridges(aes(fill = factor(word)), size = .1, scale = 15.8, alpha = .8) +
  scale_fill_paletteer_d(ghibli, PonyoMedium) +
  labs(title = "SBC Resolution Subject Trends", caption = "Data from SBC Resolutions (1845-2018)") +
  theme_minimal(base_family = "Oswald", base_size = 25) + 
  theme(legend.position="bottom") + theme(legend.title=element_blank()) +  theme(legend.margin=margin(t=-1.25, r=0, b=0, l=0, unit="cm")) +
  labs(x = "", y = "Trend of Appearances") +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


ggsave(file="D://yp_scrapes/sbc_res/sbc_ridges_full2.png", type = "cairo-png", width = 4, height = 2.5)


tidy %>% 
  filter(word == "colored" | word == "negro" | word == "african") %>% 
  mutate(word = recode(word, "'colored'= '  Colored    '; 'negro' = '  Negro     '; 'african' = '  African  '")) %>% 
  mutate(label = "SBC") %>% 
  ggplot(., aes(x=year, y = label)) +
  geom_density_ridges(aes(fill = factor(word)), size = .1, scale = 15.8, alpha = .8) +
  scale_fill_nord(palette = "victory_bonds") +
  labs(title = "SBC Resolution Regarding African-Americans", caption = "Data from SBC Resolutions (1845-2018)") +
  theme_minimal(base_family = "Oswald", base_size = 25) + 
  theme(legend.position="bottom") + theme(legend.title=element_blank()) +  theme(legend.margin=margin(t=-1.25, r=0, b=0, l=0, unit="cm")) +
  labs(x = "", y = "Trend of Appearances") +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

ggsave(file="D://yp_scrapes/sbc_res/sbc_ridges_black.png", type = "cairo-png", width = 4, height = 2.5)


count <- all_res %>% 
  group_by(year) %>% 
  count


count %>% 
  ggplot(., aes(x= year, y = n, fill = n)) +
  geom_col(color = "black") +
  theme_minimal() +
  scale_fill_gradient(low = "#6be585",  high = "#dd3e54") +
  theme(legend.position = "bottom") +
  guides(fill=FALSE) +
  labs(x= "Year", y = "Number of Resolutions", title = "SBC Resolution Passage Over Time", caption = "Data from SBC Resolutions (1845-2018)") +
  theme_minimal(base_family = "Oswald", base_size = 36) +
  ggsave("D://yp_scrapes/sbc_res/res_over_time.png")






