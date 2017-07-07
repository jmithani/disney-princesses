library(mallet)
library(tm)

df <- mallet.read.dir("/Users/jasmine/disney-princesses/solos")

mallet.instances <- mallet.import(df$id, df$text, "/Users/jasmine/disney-princesses/stop.txt")

topic.model <- MalletLDA(num.topics=3)

topic.model$loadDocuments(mallet.instances)
dd <- mallet.word.freqs(topic.model)
topic.words <- mallet.topic.words(topic.model)
topics <- mallet.topic.labels(topic.model, topic.words, 1000)

# dd <- dd[with(dd, order(-term.freq)), ]
# head(dd)

mallet.top.words(topic.model, topic.words[1,])
mallet.top.words(topic.model, topic.words[2,])
mallet.top.words(topic.model, topic.words[3,])
#mallet.top.words(topic.model, topic.words[4,])
#mallet.top.words(topic.model, topic.words[5,])