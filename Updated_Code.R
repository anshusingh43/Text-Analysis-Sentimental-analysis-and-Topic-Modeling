getwd()
setwd("C:/Users/anshu/Desktop/UNCC Courses/Advanced Business Analytics/Homework2 - Text analysis, topic modelling, sentimental analysis")

#install.packages("data.table") # to read file using fread
library("data.table")

data <- fread("psychcentral_data.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?"))
colnames(data)


install.packages("dplyr")
install.packages("tidytext")

library("tidytext")
library("dplyr") # %>% to work, dplyr is needed

row2 = data$q_subject
head(row2)

tidy_text <- data %>% 
  unnest_tokens(word, q_subject)#tokenization

#data(stop_words)

tidy_text <- tidy_text %>%
  anti_join(stop_words)#removing the stop words from tidy_text


tidy_text %>%
  count(word, sort = TRUE)#shows the frequency of the words.

library("ggplot2")


#visualizing word that appear more than 2000 times
tidy_text %>%
  count(word, sort = TRUE) %>%
  filter(n > 100) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n,word)) + # aes is used for visualizing x and y point try to exchange the x and y point and see the change in the visualization
  geom_bar(stat = "identity") +
  xlab("words")# +
#coord_flip()# it is used to flip horital to vertical and vice-a-versa

library("wordcloud")

tidy_text %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

library("SnowballC")
library("tidytext")
library("dplyr")

#stemming out words like friends and friend.
tidy_text <- data %>%
  unnest_tokens(word, q_subject) %>%
  mutate(word = wordStem(word))

#data(stop_words)

tidy_text <- tidy_text %>%
  anti_join(stop_words)

tidy_text %>%
  count(word, sort = TRUE)

library("ggplot2")
library("dplyr")
library("tidyverse")

#visualizing word that appear more than 4000 times
tidy_text %>%
  count(word, sort = TRUE) %>%
  filter(n > 100) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat = "identity") +
  xlab(NULL) +
  coord_flip()

#WORDCLOUD

library("wordcloud")

tidy_text %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

#COLOUR CODED WORDCLOUD
library("reshape2")


tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("#F8766D", "#00BFC4"),
                   max.words = 30) # if not running -> run library of dplyr and tidy_text

---------------------------------------------------------------------
tidy_text <- data %>% 
  unnest_tokens(word, q_content)#tokenization

#data(stop_words)

tidy_text <- tidy_text %>%
  anti_join(stop_words)#removing the stop words from tidy_text


tidy_text %>%
  count(word, sort = TRUE)#shows the frequency of the words.

install.packages("ggplot2")
library("ggplot2")


#visualizing word that appear more than 2000 times
tidy_text %>%
  count(word, sort = TRUE) %>%
  filter(n > 3000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n,word)) + # aes is used for visualizing x and y point try to exchange the x and y point and see the change in the visualization
  geom_bar(stat = "identity") +
  xlab("words")# +
  #coord_flip()# it is used to flip horital to vertical and vice-a-versa

head(tidy_text)

install.packages("SnowballC", repos = "https://cran.r-project.org")
library("SnowballC")

install.packages("tidytext")
library("tidytext")
install.packages("dplyr")
library("dplyr")

#stemming out words like friends and friend.
tidy_text <- data %>%
  unnest_tokens(word, q_content) %>%
  mutate(word = wordStem(word))

#data(stop_words)

tidy_text <- tidy_text %>%
  anti_join(stop_words)

tidy_text %>%
  count(word, sort = TRUE)


ggpinstall.packages("ggplot2")
library("ggplot2")
library("dplyr")
library("tidyverse")

#visualizing word that appear more than 4000 times
tidy_text %>%
  count(word, sort = TRUE) %>%
  filter(n > 4000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat = "identity") +
  xlab(NULL) +
  coord_flip()

#WORDCLOUD

install.packages("wordcloud")
library("wordcloud")

tidy_text %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 200))

#COLOUR CODED WORDCLOUD

install.packages("reshape2", repos = "https://cran.r-project.org")
library("reshape2")


tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("#F8766D", "#00BFC4"),
                   max.words = 100) # if not running -> run library of dplyr and tidy_text



#--------------------------------------------------------------------------------
  
 





#----------------------------------------------------------------------------

#FOR COLUMN "ANSWERS"

#text_df <- data_frame(line = 1:8360, text_content = data$answers)

#text_content = data$answers

#answers_data <- text_df %>%
  #unnest_tokens(word, text_content)#tokenization

#head(text_df)
#head(text_content)# why do we have 2 different variable for the same answers.

tidy_text <- data %>%
  unnest_tokens(word, answers)

data(stop_words)

tidy_text <- tidy_text %>%
  anti_join(stop_words)


tidy_text %>%
  count(word, sort = TRUE)

install.packages("ggplot2")
library("ggplot2")


#visualizing word that appear more than 2000 times
tidy_text %>%
  count(word, sort = TRUE) %>%
  filter(n > 4000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat = "identity") +
  xlab(NULL) +
  coord_flip()


install.packages("SnowballC", repos = "https://cran.r-project.org")
library("SnowballC")

install.packages("tidytext")
library("tidytext")
install.packages("dplyr")
library("dplyr")

#tidy_text <- data %>%
#  unnest_tokens(word, answers) %>%
#  mutate(word = wordStem(word)) 

#data(stop_words)

#tidy_text <- tidy_text %>%
#  anti_join(stop_words)

#tidy_text %>%
#  count(word, sort = TRUE)


install.packages("ggplot2")
#library("ggplot2")

library("dplyr")
library("tidyverse")

#visualizing word that appear more than 4000 times
# tidy_text %>%
#   count(word, sort = TRUE) %>%
#   filter(n > 6000) %>%
#   mutate(word = reorder(word, n)) %>%
#   ggplot(aes(word, n)) +
#   geom_bar(stat = "identity") +
#   xlab(NULL) +
#   coord_flip()

#counting the sentiments using lexicons
sentiment <- tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE)

head(sentiment)

#WORDCLOUD

install.packages("wordcloud")
library("wordcloud")

tidy_text %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 50))

#COLOUR CODED WORDCLOUD

install.packages("reshape2", repos = "https://cran.r-project.org")
library("reshape2")


tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("#F8766D", "#00BFC4"),
                   max.words = 100)

#Q6 STARTS HERE
#---------------------------------------------------------------
# LDA --> https://towardsdatascience.com/topic-modeling-and-latent-dirichlet-allocation-in-python-9bf156893c24


#install.packages("RTextTools",repos = "https://cran.rstudio.com/bin/windows/contrib/3.5/PACKAGES")

#install.packages("RTextTools", repos = "https://cran.r-project.org")
install.packages("tm", repos = "https://cran.r-project.org")
library(tm)
library(topicmodels)
library(slam)

install.packages("topicmodels", repos = "https://cran.r-project.org")
install.packages("slam", repos = "https://cran.r-project.org")
install.packages("wordcloud")

data <- data[1:1000,] # We perform LDA on the rows 1 through 1000 in the data.

corpus <- Corpus(VectorSource(data$q_content), readerControl=list(language="en"))#variable will be diff -- run tm library if throw eroor

dtm <- DocumentTermMatrix(corpus, control = list(stopwords = TRUE, minWordLength = 2, removeNumbers = TRUE, removePunctuation = TRUE,  stemDocument = TRUE))

rowTotals <- apply(dtm , 1, sum) #Find the sum of words in each Document
dtm.new   <- dtm[rowTotals> 0, ] #remove all docs without words

#finding best value for lda
library(ldatuning)
result <- FindTopicsNumber(
  dtm,
  topics = seq(from = 2, to = 22, by = 4),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 77),
  mc.cores = 2L,
  verbose = TRUE
)

FindTopicsNumber_plot(result)

lda <- LDA(dtm.new, k = 4) # k is the number of topics to be found.-- run topicmdel library if throws error


library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

lda <- LDA(dtm.new, k = 2) # k is the number of topics to be found.

#---------------------------------------
#FOR K=3
lda <- LDA(dtm.new, k = 3)
library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#---------------------------------------
#FOR K=4
lda <- LDA(dtm.new, k = 4)
library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#---------------------------------------
#FOR K=10
lda <- LDA(dtm.new, k = 10)
library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#-------------------------------------------------------
#FOR ANSWERS NOW, THE SAME THING WE DID ABOVE
library(tm)
library(wordcloud)
library(topicmodels)
library(slam)
data <- data[1:1000,] # We perform LDA on the rows 1 through 1000 in the data.
corpus <- Corpus(VectorSource(data$answers), readerControl=list(language="en"))
dtm <- DocumentTermMatrix(corpus, control = list(stopwords = TRUE, minWordLength = 2, removeNumbers = TRUE, removePunctuation = TRUE,  stemDocument = TRUE))
rowTotals <- apply(dtm , 1, sum) #Find the sum of words in each Document
dtm.new   <- dtm[rowTotals> 0, ] #remove all docs without words
lda <- LDA(dtm.new, k = 10) # k is the number of topics to be found.

library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#-------------------------------
#for K=2

lda <- LDA(dtm.new, k = 2) # k is the number of topics to be found.

library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#---------------------------------------
#for k=8
lda <- LDA(dtm.new, k = 8) # k is the number of topics to be found.

library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#---------------------------------------
#for k=11
lda <- LDA(dtm.new, k = 11) # k is the number of topics to be found.

library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

#---------------------------------------
#for k=14
lda <- LDA(dtm.new, k = 14) # k is the number of topics to be found.

library(tidytext)
lda_td <- tidy(lda)
lda_td

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()


































