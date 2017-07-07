library("tm")
library("SnowballC")
# http://fredgibbs.net/tutorials/document-similarity-with-r.html


songs <- Corpus(DirSource("/Users/jasmine/disney-princesses/solos"))
songs <- tm_map(songs, tolower)
# songs <- tm_map(songs, removePunctuation)

songs <- tm_map(songs, removeWords, stopwords("english"))
songs <- tm_map(songs, stemDocument)

tdm <- TermDocumentMatrix(songs)
inspect(tdm)

df <- as.data.frame(inspect(tdm))
scale <- scale(df)
d <- dist(scale, method="euclidean")
fit <- hclust(d, method="ward")
plot(fit)