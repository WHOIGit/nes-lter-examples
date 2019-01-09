library(tidyverse)

BASE.URL <- 'https://raw.githubusercontent.com/WHOIGit/nes-lter-examples/master/data/'

csv.url <- paste(BASE.URL, 'neslter_sosik_chl.csv', sep='')

# read the data from GitHub
df <- read.csv(csv.url)

# now select just EN608 WSW replicates
df <- df %>%
  filter(cruise == 'EN608') %>%
  filter(filter_mesh_size == '>0')

# split each replicate into its own dataframe
rep.a = df %>% filter(replicate == 'a')
rep.b = df %>% filter(replicate == 'b')

# now convert to wide form for plotting purposes
merged <- merge(rep.a, rep.b, by=c('cruise','cast','niskin'))

chl.x = merged['chl.x']
chl.y = merged['chl.y']

# make a scatter plot of replicate a against replicate b
p <- ggplot(merged, aes(x=chl.x, y=chl.y)) + geom_point() +
  xlab('Replicate A') +
  ylab('Replicate B')

print(p)
