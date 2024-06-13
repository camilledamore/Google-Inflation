rm(list=ls()) 
#packages 
library(tidyverse)
library(dplyr)
library(janitor)

#google search data

gtrend_data <- read_csv("google_trend_data_NOT_clean.csv") %>% 
  select(-...1, -...2)

#clean data

gtrend_data_clean1 <- gtrend_data %>%
  tidyr::extract(c(country.date), into = c("geo", "date"),
                 regex = ("(.+)\\:(.+)")) %>%
  mutate(geo = case_when(
    geo == "CA" ~ "canada",
    geo == "US" ~ "united states",
    geo == "ZA" ~ "south africa",
    geo == "MX" ~ "mexico")) %>%
  mutate(date = as.Date(date, format = "%m/%d/%Y"))


#4th column : parsing data for inflation, interest rate, market, job, trade. 

gtrend_data_clean2 <- gtrend_data_clean1 %>%
  tidyr::extract(c(google.search.rate),
                 into = c("inflation", "interest_rate", "market", "job", "trade"),
                 regex = ("(.+)\\-(.+)\\-(.+)\\-(.+)\\-(.+)")) %>%
  mutate(inflation = as.numeric(inflation),
         interest_rate = as.numeric(interest_rate),
         market = as.numeric(market),
         job = as.numeric(job),
         trade = as.numeric(trade))

# heatmap 

heatmap.2(as.matrix(correlation_data), 
          dendrogram = "none", 
          Rowv = FALSE,
          Colv = FALSE,
          scale = "none",
          col = colorRampPalette(c("blue", "white", "red"))(100),
          main = "Correlation Heatmap",
          xlab = list("Variables", cex = 0.8), 
          ylab = list("Countries", cex = 0.8)
)



###########

#more data cleaning for google data

gtrend_data_clean3 <- gtrend_data_clean2 %>% drop_na(value)



#Replace NA values with lagging values --- lag() function. 

gtrend_data_clean <- gtrend_data_clean3 %>% 
  mutate(
    inflation = ifelse(is.na(inflation), lag(inflation), inflation),
    interest_rate = ifelse(is.na(interest_rate), lag(interest_rate), interest_rate),
    market = ifelse(is.na(market), lag(market), market),
    job = ifelse(is.na(job), lag(job), job),
    trade = ifelse(is.na(trade), lag(trade), trade)
  )


##


US_inflation_by_year <- gtrend_data_clean3 %>%  
  filter(geo=="united states") %>%
#change date to year
  mutate(year_us = year(date)) %>% 
  group_by(year_us) %>% 
 summarize(avg_yearly_inflation_US = mean(value))



US_correlation_data <- gtrend_data_clean %>% 
  filter(geo=="united states") %>% 
  select(-date, -geo)

US_correlation <- cor(US_correlation_data, use = "pairwise.complete.obs") %>% 
  data.frame() %>% 
  select(value) 

#for report, change to US (or just type in idgaf) (see bottom of code)
  

# 
#  plot of the the actual inflation value and the Google search rate for "inflation" divided by 10 for the US. 

figure_1 <- gtrend_data_clean %>% filter(geo=="united states") %>%
  ggplot(aes(x = date)) +
  geom_line(aes( y= inflation/10 , col = "search for the word inflation")) +
  geom_line(aes( y= value , color = "inflation rate")) +
  scale_color_manual(values = c("inflation rate" = "red",
                                "search for the word inflation" = "black")) +
  guides(color=guide_legend("")) +
  theme_classic() +
  ylab("Rates") +
  geom_vline(aes(xintercept = lubridate::as_date("2020-03-01")), linetype = "dashed") +
  ggplot2::annotate("text", x = lubridate::as_date("2020-03-01") , y = 10 ,
                    label = "COVID-19", size = 3 , hjust = -0.1) +
  xlab("Date")

 print(figure_1)



#### PLOT!!!!
 
figure_2 <- gtrend_data_clean %>%
  ggplot(aes(x = date)) +
  geom_line(aes( y= inflation/10 , col = "search for the word inflation")) +
  geom_line(aes( y= value , color = "inflation rate")) +
  scale_color_manual(values = c("inflation rate" = "red",
                                "search for the word inflation" = "black")) +
  guides(color=guide_legend("")) +
  ylab("") +
  geom_vline(aes(xintercept = lubridate::as_date("2020-03-01")), linetype = "dashed") +
  ggplot2::annotate("text", x = lubridate::as_date("2020-03-01") , y = 10 ,
                    label = "COVID-19", size = 3 , hjust = -0.1) +
  xlab("Date") +
  facet_wrap(~geo)

print(figure_2)








##################


CA_correlation_data <- gtrend_data_clean %>%
  filter(geo=="united states") %>%
  select(-date, -geo)

CA_correlation <- cor(CA_correlation_data, use = "pairwise.complete.obs") %>%
  data.frame() %>%
  select(value)%>%
  rename("canada"=value)


MX_correlation_data <- gtrend_data_clean %>%
  filter(geo=="united states") %>%
  select(-date, -geo)

MX_correlation <- cor(MX_correlation_data, use = "pairwise.complete.obs") %>%
  data.frame() %>%
  select(value) %>%
  rename("mexico"=value)


SA_correlation_data <- gtrend_data_clean %>%
  filter(geo=="united states") %>%
  select(-date, -geo)

SA_correlation <- cor(SA_correlation_data, use = "pairwise.complete.obs") %>%
  data.frame() %>%
  select(value) %>%
rename("south africa"=value)

all_country_correlation <- cbind( US_correlation,
                                 CA_correlation,
                                 MX_correlation,
                                 SA_correlation)


