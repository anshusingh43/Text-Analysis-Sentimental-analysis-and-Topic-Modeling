# Text Analysis, Sentimental analysis and Topic Modeling
The data for this project has been collected from psychcentral.com. This website offers an online forum for posting questions and answers related to mental health. Please visit https://forums.psychcentral.com for more information. 

### Objective

My aims to identify the most important reasons for mental disorders. Whenever I think of mental disorder one questions pops up in my mind and that is - **Is this something inborn or people tend to suffer from this because of certain reasons or situations they have seen or faced in their lifetime?** Only to find my answers, I get the dataset from the site mentioned above and lets see if we can find out anything interesting!

*Here, I will be performing text analytics including creating word clouds, sentiment analysis and topic modeling.*

I am using RStudios as my IDE and I load my dataset and find the number of columns that is in my data. It comes out there are only 4 columns:
- rows
- q_subject
- q_content
- answers

<img width="568" alt="img1" src="https://user-images.githubusercontent.com/13045656/77357261-3a226300-6d1e-11ea-8635-9cd5d5657e5c.PNG">

The dataset has total of 8360 rows containing description of the patients. 

### Little bit about Text analytics

Before using our data for analysis, we need to preprocess it. The main goal of pre-processing the text documents is to prepare the text for Text Mining methods. Depending on the type of TM method that we want to deploy, there are different pre-processing steps that we should take to prepare our text data. The main steps include:

- Tokenization: Tokenization is the process of breaking a stream of text up into words, phrases, symbols, or other meaningful elements called tokens.

- Convert to lower case: After tokenization, we usually need to convert all of the tokens into lower (or upper) case. This way, the software would not assume any difference between “Family” and “family”.

- Stop-removal method: Another important pre-processing step is to remove stop-words from the text. Each language has its own list of stop-words. A comprehensive list of stop-words for many languages can be found here: http://www.ranks.nl/stopwords. Examples of stop-words include “a”, “an”, and “did”. Stop-words are basically a set of commonly used words in any language, not just English.

- Stemming and Lemmitization: There are certain words in text like car, car's, cars' which is same but is taken into consderation seperately. Stemming and Lemmitization helps us to group them under one word only.

### Let's begin digging into Text analytics

1. After tokeization and removing stop words, we found out our top tokens in the dataset.
![img2](https://user-images.githubusercontent.com/13045656/77357949-5ffc3780-6d1f-11ea-8587-ce0bccaaf2bf.png)

2. Let's use library “ggplot2” to create a visualization that shows the frequency of the tokens that appeared for at least 2000 times. 
![img4](https://user-images.githubusercontent.com/13045656/77358422-368fdb80-6d20-11ea-9eed-5d6f78188677.png)

3. Now, you can see that I have highlighted certains words in the above image. If you see clearly we have repeating words with either s or es added ( friend and friends ) and therefore we need ***stemming*** on this text. For that, I have used SnowballC package in R to stem q_content first.

After stemming, we again applied tokenization and what we observed is that top tokens after stemming the text changes. Now they are:
![img6](https://user-images.githubusercontent.com/13045656/77364680-2a5d4b80-6d2b-11ea-8817-c89718cce0e1.png)

4. I use library “wordcloud” to create a word cloud with the 200 most used tokens to see if there is any word that stands out in their discription.

![wordcloud](https://user-images.githubusercontent.com/13045656/77364821-65f81580-6d2b-11ea-853f-fbb0df14729e.png)

Things were not clear by just looking at these words. So i thought to segregate them on the basis of sentiment with color-coded words - Red for negative and blue for positive. For getting the sentiments, I use ***get_sentiments("bing")*** which has predefined sets of words for positive and negative meaning and after generating my word cloud again, I saw complete disntiguished pattern.

![coloredwordcloud](https://user-images.githubusercontent.com/13045656/77365094-e159c700-6d2b-11ea-9367-767317aa93af.png)

Words like scared, hate, depressed, wrong and bad are very common among people who suffer mental disability and also words like comfort, respect, love, trust and support are very much clear in this wordcloud.

5. I repeat same for the ***answer*** column and found out most used words by the patients.

![coloredwordcloud2](https://user-images.githubusercontent.com/13045656/77365295-401f4080-6d2c-11ea-9954-43ba8c298b4a.png)

Here, words like love, trust, support, strong, hurt, wrong, pain and afraid are clear.


### Why did I topic modeling when I already have my words?




































       
