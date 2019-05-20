get_text <- function(url) {
  url %>%
    read_html() %>%
    html_nodes(xpath = '//*[@id="content-wrapper"]/div[8]/div/p[1]') %>% 
    html_text()
}

pages <- seq(2284,2299,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc18 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2018)

pages <- seq(2274,2283,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc17 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2017)

pages <- seq(2262,2273,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc16 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2016)

pages <- seq(2252, 2261,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc15 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2015)

pages <- seq(2242, 2251,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc14 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2014)

pages <- seq(1228, 1237,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc13 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2013)

pages <- seq(1239, 1241, by = 2)
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc13_2 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2013)
sbc13 <- bind_rows(sbc13, sbc13_2)

pages <- seq(1219, 1227,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc12 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2012)

pages <- seq(1211, 1218,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc11 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2011)

pages <- seq(1199, 1210,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc10 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2010)

sbc10 <- sbc10[-c(3,4,5,6,8),]
pages <- seq(1193, 1197,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)

dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc09 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2009)
pages <- seq(1184, 1192,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)

dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc08 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2008)
pages <- seq(1167, 1174,  by = 1) 

sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc07 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2007)

pages <- seq(1152, 1166,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc06 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2006)

pages <- seq(1142, 1151,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc05 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2005)

pages <- seq(1134, 1141,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc04 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2004)

pages <- seq(1125, 1132,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc03 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2003)

pages <- seq(1115, 1124,  by = 1) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc02 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2002)

pages <- c(274, 494, 556, 572, 637, 700, 712, 849, 962) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc01 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2001)

pages <- c(273, 289, 298, 299, 432, 525, 553, 626, 786, 961) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc00 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 2000)

pages <- c(272, 305, 314, 492, 524, 574, 617, 620, 703, 869, 877, 959, 1006, 1080) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc99 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1999)

pages <- c(149, 271, 315, 616, 699, 773, 1089) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc98 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1998)

pages <- c(270, 284, 436, 450, 479, 569, 571, 589, 615, 636, 795, 963) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc97 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1997)

pages <- c(26, 38, 269, 278, 435, 459, 478, 568, 614, 635, 655, 794, 868, 874) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc96 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1996)

pages <- c(37, 268, 555, 570, 790, 867, 899, 958) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc95 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1995)

pages <- c(25, 41, 267, 477, 481, 594, 634, 871, 964, 1010, 1011, 1074) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc94 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1994)

pages <- c(24, 266, 431, 613, 651, 866, 898, 1073, 1198) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc93 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1993)

pages <- c(265, 279, 328, 360, 430, 451, 493, 552, 573, 612, 687, 875, 957, 1005, 1070) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc92 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1992)

pages <- c(98, 146, 283, 302, 433, 476, 535, 590, 591, 618, 619, 956, 984) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc91 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1991)

pages <- c(309, 456) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc90 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1990)

pages <- c(23, 97, 264, 449, 642, 754, 792, 897, 1101, 1102) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc89 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1989)

pages <- c(95, 96, 263, 306, 331, 346, 446, 475, 534, 610, 716, 753, 755, 785, 791, 793, 865, 872, 873, 966) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc88 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1988)

pages <- c(22, 40, 94, 262, 308, 429, 440, 533, 567, 633, 752, 847, 981, 1008) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc87 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1987)

pages <- c(261, 282, 490, 554, 566, 604, 772, 846, 864, 980, 1007, 1058) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc86 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1986)

pages <- c(260, 428, 486, 523, 565, 588, 609, 751, 845, 863, 1057) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc85 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1985)

pages <- c(21, 93, 343, 522, 564, 750, 954, 969, 1067, 1072, 1088) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc84 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1984)

pages <- c(92, 259, 455, 489, 563, 715, 749, 771, 834, 844, 895, 900, 953, 977, 1084, 1093) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc83 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1983)

pages <- c(92, 259, 455, 489, 563, 715, 749, 771, 834, 844, 895, 900, 953, 977, 1084, 1093) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc83 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1983)

pages <- c(20, 91, 145, 258, 292, 365, 398, 458, 521, 532, 632, 650, 686, 748, 788, 789, 833, 862, 967, 1004, 1012) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc82 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1982)

pages <- c(90, 144, 257, 344, 520, 531, 587, 654, 705, 770, 798, 832, 843, 952, 968, 1003, 1079, 1092) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc81 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1981)

pages <- c(19, 143, 256, 397, 443, 530, 550, 608, 631, 746, 769, 787, 797, 831, 842, 861, 1091, 1105, 1106, 1107, 1108, 2260) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc80 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1980)

pages <- c(18, 89, 142, 255, 396, 474, 484, 529, 549, 630, 641, 706, 745, 768, 830, 841, 976, 1002, 1078) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc79 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1979)

pages <- c(17, 88, 141, 254, 275, 304, 395, 457, 528, 592, 623, 629, 674, 704, 744, 840, 892, 991, 1068, 1109, 1111, 1112) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc78 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1978)


pages <- c(16, 140, 253, 394, 454, 548, 607, 628, 743, 796, 951, 995, 1001, 1055, 1077, 1099, 1113) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc77 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1977)

pages <- c(15, 87, 139, 252, 393, 482, 606, 685, 742, 767, 950, 1009) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc76 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1976)

pages <- c(86, 138, 251, 291, 342, 391, 392, 439, 445, 473, 527, 627, 741, 949, 1076, 1114) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc75 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1975)

pages <- c(14, 85, 137, 250, 453, 472, 488, 547, 702, 740, 800, 829, 948, 1087) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc74 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1974)

pages <- c(39, 84, 136, 249, 390, 434, 487, 586, 684, 701, 828, 1090) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc73 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1973)

pages <- c(83, 135, 248, 326, 341, 364, 389, 585, 653, 739, 827, 860, 947, 1053, 1081, 1083) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc72 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1972)

pages <- c(13, 82, 134, 247, 471, 673, 826, 859, 870, 946) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc71 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1971)

pages <- c(133, 246, 427, 448, 452, 470, 519, 526, 672, 825, 889, 1042) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc70 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1970)

pages <- c(30, 132, 245, 325, 340, 824, 888, 903, 945, 978) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc69 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1969)

pages <- c(79, 131, 244, 330, 388, 518, 599, 671, 683, 823, 839, 944) 
sbc <- paste0("http://www.sbc.net/resolutions/",pages,"/", pages)
results <- sapply(sbc, get_text)
dfs <- lapply(results, data.frame, stringsAsFactors = FALSE)
sbc68 <- bind_rows(dfs) %>% as.tibble() %>% mutate(year = 1968)

sbc6877 <- bind_rows(sbc68, sbc69, sbc70, sbc71, sbc72, sbc73, sbc74, sbc75, sbc76, sbc77) %>% rename(text =  X..i..) 

sbc_first <- read_csv("D://yp_scrapes/sbc_1978_2018.csv")

first50 <- bind_rows(sbc6877, sbc_first)

write_csv(first50, "sbc_1968_2018.csv")

graph %>%
  ggplot(., aes(x=year, y=n, fil)) + geom_col(color = "black", fill = "darkorchid") +
  theme_jk(plot_title_size = 28, subtitle_size = 24, base_size = 20, caption_size = 12,  grid = "X") + 
  labs(x = "", y = "", title = "Number of SBC Resolutions")

ggsave(file="D://yp_scrapes/sbc_count.png", type = "cairo-png", width = 18, height = 15)

