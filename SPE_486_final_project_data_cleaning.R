# SP&E 486 Final Project Data Cleaning Script

# Author: Alfredo Lorenzo Mendiola

# Last Edited: 06 DEC 2023



# *****************************************************************************
# *****************************************************************************
# ********************* DO NOT TOUCH CODE BELOW THIS LINE *********************
# *****************************************************************************
# *****************************************************************************



# load libraries
library(tidyverse)
library(readr)
library(dplyr)
library(tidyr)
library(waldo)



# set directory to pull original data from
setwd("C:\\Users\\amend\\Documents\\School\\SPE_486_predictive_analytics_and_machine_learning\\SPE_486_final_project\\SPE_486_final_project_data_og")



# read in original data to dfs/arrays

# non-hits
non_hits <- read_csv("SPE_486_final_project_datapull_kaggle.csv")

# 'Top Hits of XXXX' Playlists
p_2011 <- readRDS("top_2011_playlist.rds")
p_2012 <- readRDS("top_2012_playlist.rds")
p_2013 <- readRDS("top_2013_playlist.rds")
p_2014 <- readRDS("top_2014_playlist.rds")
p_2015 <- readRDS("top_2015_playlist.rds")
p_2016 <- readRDS("top_2016_playlist.rds")
p_2017 <- readRDS("top_2017_playlist.rds")
p_2018 <- readRDS("top_2018_playlist.rds")
p_2019 <- readRDS("top_2019_playlist.rds")
p_2020 <- readRDS("top_2020_playlist.rds")
p_2021 <- readRDS("top_2021_playlist.rds")
p_2022 <- readRDS("top_2022_playlist.rds")

# Track attributes
t_2011 <- read_csv("top_2011_track_attributes.csv")
t_2012 <- read_csv("top_2012_track_attributes.csv")
t_2013 <- read_csv("top_2013_track_attributes.csv")
t_2014 <- read_csv("top_2014_track_attributes.csv")
t_2015 <- read_csv("top_2015_track_attributes.csv")
t_2016 <- read_csv("top_2016_track_attributes.csv")
t_2017 <- read_csv("top_2017_track_attributes.csv")
t_2018 <- read_csv("top_2018_track_attributes.csv")
t_2019 <- read_csv("top_2019_track_attributes.csv")
t_2020 <- read_csv("top_2020_track_attributes.csv")
t_2021 <- read_csv("top_2021_track_attributes.csv")
t_2022 <- read_csv("top_2022_track_attributes.csv")



# remove data that won't be used from non-hits and tracks only

# non-hits
non_hits <- non_hits %>% select(-'release_date')

# tracks
t_2011 <- t_2011 %>% select(-c('type','uri','track_href','analysis_url'))
t_2012 <- t_2012 %>% select(-c('type','uri','track_href','analysis_url'))
t_2013 <- t_2013 %>% select(-c('type','uri','track_href','analysis_url'))
t_2014 <- t_2014 %>% select(-c('type','uri','track_href','analysis_url'))
t_2015 <- t_2015 %>% select(-c('type','uri','track_href','analysis_url'))
t_2016 <- t_2016 %>% select(-c('type','uri','track_href','analysis_url'))
t_2017 <- t_2017 %>% select(-c('type','uri','track_href','analysis_url'))
t_2018 <- t_2018 %>% select(-c('type','uri','track_href','analysis_url'))
t_2019 <- t_2019 %>% select(-c('type','uri','track_href','analysis_url'))
t_2020 <- t_2020 %>% select(-c('type','uri','track_href','analysis_url'))
t_2021 <- t_2021 %>% select(-c('type','uri','track_href','analysis_url'))
t_2022 <- t_2022 %>% select(-c('type','uri','track_href','analysis_url'))



# separate out p_XXXX$track.artists and merge artists and artists_ids into new columns

# 2011
df_temp <- p_2011 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2011 <- merge(p_2011, df_temp, by='track.id')
rm(df_temp)

# 2012
df_temp <- p_2012 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2012 <- merge(p_2012, df_temp, by='track.id')
rm(df_temp)

# 2013
df_temp <- p_2013 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2013 <- merge(p_2013, df_temp, by='track.id')
rm(df_temp)

# 2014
df_temp <- p_2014 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2014 <- merge(p_2014, df_temp, by='track.id')
rm(df_temp)

# 2015
df_temp <- p_2015 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2015 <- merge(p_2015, df_temp, by='track.id')
rm(df_temp)

# 2016
df_temp <- p_2016 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2016 <- merge(p_2016, df_temp, by='track.id')
rm(df_temp)

# 2017
df_temp <- p_2017 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2017 <- merge(p_2017, df_temp, by='track.id')
rm(df_temp)

# 2018
df_temp <- p_2018 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2018 <- merge(p_2018, df_temp, by='track.id')
rm(df_temp)

# 2019
df_temp <- p_2019 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2019 <- merge(p_2019, df_temp, by='track.id')
rm(df_temp)

# 2020
df_temp <- p_2020 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2020 <- merge(p_2020, df_temp, by='track.id')
rm(df_temp)

# 2021
df_temp <- p_2021 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2021 <- merge(p_2021, df_temp, by='track.id')
rm(df_temp)

# 2022
df_temp <- p_2022 %>%
    select(c(track.id, track.artists)) %>%
    unnest(track.artists) %>%
    select(c(track.id, id, name))

df_temp <- df_temp %>%
    group_by(track.id) %>%
    summarize(
        artist_ids = paste(id, collapse = ", "),
        artists = paste(name, collapse = ", ")
    )

p_2022 <- merge(p_2022, df_temp, by='track.id')
rm(df_temp)



# merge and rename certain columns from p_XXXX into t_XXXX using track ids

# 2011
df_temp <- p_2011 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2011 <- merge(t_2011, df_temp, by='id')
rm(df_temp, p_2011)

# 2012
df_temp <- p_2012 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2012 <- merge(t_2012, df_temp, by='id')
rm(df_temp, p_2012)

# 2013
df_temp <- p_2013 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2013 <- merge(t_2013, df_temp, by='id')
rm(df_temp, p_2013)

# 2014
df_temp <- p_2014 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2014 <- merge(t_2014, df_temp, by='id')
rm(df_temp, p_2014)

# 2015
df_temp <- p_2015 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2015 <- merge(t_2015, df_temp, by='id')
rm(df_temp, p_2015)

# 2016
df_temp <- p_2016 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2016 <- merge(t_2016, df_temp, by='id')
rm(df_temp, p_2016)

# 2017
df_temp <- p_2017 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2017 <- merge(t_2017, df_temp, by='id')
rm(df_temp, p_2017)

# 2018
df_temp <- p_2018 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2018 <- merge(t_2018, df_temp, by='id')
rm(df_temp, p_2018)

# 2019
df_temp <- p_2019 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2019 <- merge(t_2019, df_temp, by='id')
rm(df_temp, p_2019)

# 2020
df_temp <- p_2020 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2020 <- merge(t_2020, df_temp, by='id')
rm(df_temp, p_2020)

# 2021
df_temp <- p_2021 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2021 <- merge(t_2021, df_temp, by='id')
rm(df_temp, p_2021)

# 2022
df_temp <- p_2022 %>%
    select(
        c(
            artists, 
            artist_ids, 
            track.explicit, 
            track.name, 
            track.disc_number, 
            track.track_number, 
            track.album.id, 
            track.album.name, 
            track.album.release_date,
            track.id
        )
    ) %>%
    rename(
        id = track.id,
        explicit = track.explicit,
        name = track.name,
        disc_number = track.disc_number,
        track_number = track.track_number,
        album_id = track.album.id,
        album = track.album.name,
        year = track.album.release_date
    )
t_2022 <- merge(t_2022, df_temp, by='id')
rm(df_temp, p_2022)



# add indicator for year the tracks were hits in new column
t_2011 <- cbind(t_2011, "year_hit"=2011)
t_2012 <- cbind(t_2012, "year_hit"=2012)
t_2013 <- cbind(t_2013, "year_hit"=2013)
t_2014 <- cbind(t_2014, "year_hit"=2014)
t_2015 <- cbind(t_2015, "year_hit"=2015)
t_2016 <- cbind(t_2016, "year_hit"=2016)
t_2017 <- cbind(t_2017, "year_hit"=2017)
t_2018 <- cbind(t_2018, "year_hit"=2018)
t_2019 <- cbind(t_2019, "year_hit"=2019)
t_2020 <- cbind(t_2020, "year_hit"=2020)
t_2021 <- cbind(t_2021, "year_hit"=2021)
t_2022 <- cbind(t_2022, "year_hit"=2022)



# merge t_XXXX to get hits df
hits <- rbind(
    t_2011,
    t_2012,
    t_2013,
    t_2014,
    t_2015,
    t_2016,
    t_2017,
    t_2018,
    t_2019,
    t_2020,
    t_2021,
    t_2022
)
rm(t_2011,
   t_2012,
   t_2013,
   t_2014,
   t_2015,
   t_2016,
   t_2017,
   t_2018,
   t_2019,
   t_2020,
   t_2021,
   t_2022
)



# add hit indicators to data (1 - hit, 0 - non hit)
hits <- cbind(hits, "hit"=1)
non_hits <- cbind(non_hits, "hit"=0)



# reorder hits columns to match non_hits for easier analyzing
hits <- hits[, c(
            "id",
            "name",
            "album",
            "album_id",
            "artists",
            "artist_ids",
            "track_number",
            "disc_number",
            "explicit",
            "danceability",
            "energy",
            "key",
            "loudness",
            "mode",
            "speechiness",
            "acousticness",
            "instrumentalness",
            "liveness",
            "valence",
            "tempo",
            "duration_ms",
            "time_signature",
            "year",
            "hit",
            "year_hit"
            )
]



# remove duplicates that are hits from non-hits
dups <- non_hits$id %in% hits$id
non_hits <- non_hits[!dups, ]
rm(dups)



# fix format of columns to match ([, {, ., _, ', etc.)

# non_hits
non_hits$artists <- gsub("\\[|\\]", "", non_hits$artists)
non_hits$artists <- gsub("'", "", non_hits$artists)

non_hits$artist_ids <- gsub("\\[|\\]", "", non_hits$artist_ids)
non_hits$artist_ids <- gsub("'", "", non_hits$artist_ids)

# hits
hits$year <- as.numeric(substr(hits$year, 1, 4))



# look for issues in data using console and fix here
non_hits$year[non_hits$year == 0] <- 2018 #2018 per spotify using album ID



# set directory to save cleaned data for project
setwd("C:\\Users\\amend\\Documents\\School\\SPE_486_predictive_analytics_and_machine_learning\\SPE_486_final_project\\SPE_486_final_project_data_clean")



# save hits and non-hits
write_csv(hits,
          "hits.csv"
)
write_csv(non_hits,
          "non_hits.csv"
)



# *****************************************************************************
# *****************************************************************************
# ********************* DO NOT TOUCH CODE ABOVE THIS LINE *********************
# *****************************************************************************
# *****************************************************************************



# *****************************************************************************
# ********* BELOW AREA TO TEST USING TEMPS BEFORE MOVING CODE UPWARDS *********
# *****************************************************************************




# *****************************************************************************
# ********* ABOVE AREA TO TEST USING TEMPS BEFORE MOVING CODE UPWARDS *********
# *****************************************************************************



# *****************************************************************************
# *************************** NOTES AND TO-DO BELOW ***************************
# *****************************************************************************
