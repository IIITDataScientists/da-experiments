# class
# unique(sslc.subset$NRC_CLASS)
sslc.subset$NRC_CLASS <- sapply(sslc.subset$NRC_CLASS, as.character)
sslc.subset$NRC_CLASS[sslc.subset$NRC_CLASS == "D   "] <- "Distinction"
sslc.subset$NRC_CLASS[sslc.subset$NRC_CLASS == "1"] <- "First"
sslc.subset$NRC_CLASS[sslc.subset$NRC_CLASS == "2"] <- "Second"
sslc.subset$NRC_CLASS[sslc.subset$NRC_CLASS == "PASS"] <- "Pass"
sslc.subset$NRC_CLASS[sslc.subset$NRC_CLASS == "FAIL"] <- "Fail"
sslc.subset$NRC_CLASS <- as.factor(sslc.subset$NRC_CLASS)

# school type
# unique(sslc.subset$SCHOOL_TYPE)
sslc.subset$SCHOOL_TYPE <- sapply(sslc.subset$SCHOOL_TYPE, as.character)
sslc.subset$SCHOOL_TYPE[sslc.subset$SCHOOL_TYPE == "U"] <- "Unaided"
sslc.subset$SCHOOL_TYPE[sslc.subset$SCHOOL_TYPE == "A"] <- "Aided"
sslc.subset$SCHOOL_TYPE[sslc.subset$SCHOOL_TYPE == "G"] <- "Government"
sslc.subset$SCHOOL_TYPE <- as.factor(sslc.subset$SCHOOL_TYPE)

# urban rural 
# unique(sslc.subset$URBAN_RURAL)
sslc.subset$URBAN_RURAL <- sapply(sslc.subset$URBAN_RURAL, as.character)
sslc.subset$URBAN_RURAL[sslc.subset$URBAN_RURAL == "U"] <- "Urban"
sslc.subset$URBAN_RURAL[sslc.subset$URBAN_RURAL == "R"] <- "Rural"
sslc.subset$URBAN_RURAL <- as.factor(sslc.subset$URBAN_RURAL)

# caste codes
# unique(sslc.subset$NRC_CASTE_CODE)
sslc.subset$NRC_CASTE_CODE[sslc.subset$NRC_CASTE_CODE == 1] <- "SC"
sslc.subset$NRC_CASTE_CODE[sslc.subset$NRC_CASTE_CODE == 2] <- "ST"
sslc.subset$NRC_CASTE_CODE[sslc.subset$NRC_CASTE_CODE == 3] <- "Category 1"
sslc.subset$NRC_CASTE_CODE[sslc.subset$NRC_CASTE_CODE == 4] <- "General"
sslc.subset$NRC_CASTE_CODE <- as.factor(sslc.subset$NRC_CASTE_CODE)

# gender type
# unique(sslc.subset$NRC_GENDER_CODE)
sslc.subset$NRC_GENDER_CODE <- sapply(sslc.subset$NRC_GENDER_CODE, as.character)
sslc.subset$NRC_GENDER_CODE[sslc.subset$NRC_GENDER_CODE == "B"] <- "Boy"
sslc.subset$NRC_GENDER_CODE[sslc.subset$NRC_GENDER_CODE == "G"] <- "Girl"
sslc.subset$NRC_GENDER_CODE <- as.factor(sslc.subset$NRC_GENDER_CODE)

# medium
# unique(sslc.subset$NRC_MEDIUM)
sslc.subset$NRC_MEDIUM <- sapply(sslc.subset$NRC_MEDIUM, as.character)
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "E"] <- "English"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "K"] <- "Kannada"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "L"] <- "Telegu"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "T"] <- "Tamil"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "U"] <- "Urdu"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "H"] <- "Hindi"
sslc.subset$NRC_MEDIUM[sslc.subset$NRC_MEDIUM == "M"] <- "Marathi"
sslc.subset$NRC_MEDIUM <- as.factor(sslc.subset$NRC_MEDIUM)

# physical condition
# unique(sslc.subset$NRC_PHYSICAL_CONDITION)
sslc.subset$NRC_PHYSICAL_CONDITION <- sapply(sslc.subset$NRC_PHYSICAL_CONDITION, as.character)
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "N"] <- "Normal"
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "B"] <- "Blind"
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "D"] <- "Dumb"
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "H"] <- "Hearing impaired"
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "P"] <- "Physically handicapped"
sslc.subset$NRC_PHYSICAL_CONDITION[sslc.subset$NRC_PHYSICAL_CONDITION == "S"] <- "Spastic / dyslexia"
sslc.subset$NRC_PHYSICAL_CONDITION <- as.factor(sslc.subset$NRC_PHYSICAL_CONDITION)

# candidate type
# unique(sslc.subset$CANDIDATE_TYPE)
sslc.subset$CANDIDATE_TYPE <- sapply(sslc.subset$CANDIDATE_TYPE, as.character)
sslc.subset$CANDIDATE_TYPE[sslc.subset$CANDIDATE_TYPE == "RF"] <- "Regular Fresher"
sslc.subset$CANDIDATE_TYPE[sslc.subset$CANDIDATE_TYPE == "PF"] <- "Private Fresher"
sslc.subset$CANDIDATE_TYPE <- as.factor(sslc.subset$CANDIDATE_TYPE)


# l1
# unique(sslc.subset$L1_RESULT)
sslc.subset$L1_RESULT <- sapply(sslc.subset$L1_RESULT, as.character)
sslc.subset$L1_RESULT[sslc.subset$L1_RESULT == "A"] <- "Absent"
sslc.subset$L1_RESULT[sslc.subset$L1_RESULT == "F"] <- "Fail"
sslc.subset$L1_RESULT[sslc.subset$L1_RESULT == "P"] <- "Pass"
sslc.subset$L1_RESULT <- as.factor(sslc.subset$L1_RESULT)

# l2
# unique(sslc.subset$L2_RESULT)
sslc.subset$L2_RESULT <- sapply(sslc.subset$L2_RESULT, as.character)
sslc.subset$L2_RESULT[sslc.subset$L2_RESULT == "A"] <- "Absent"
sslc.subset$L2_RESULT[sslc.subset$L2_RESULT == "F"] <- "Fail"
sslc.subset$L2_RESULT[sslc.subset$L2_RESULT == "P"] <- "Pass"
sslc.subset$L2_RESULT <- as.factor(sslc.subset$L2_RESULT)

# l3
# unique(sslc.subset$L3_RESULT)
sslc.subset$L3_RESULT <- sapply(sslc.subset$L3_RESULT, as.character)
sslc.subset$L3_RESULT[sslc.subset$L3_RESULT == "A"] <- "Absent"
sslc.subset$L3_RESULT[sslc.subset$L3_RESULT == "F"] <- "Fail"
sslc.subset$L3_RESULT[sslc.subset$L3_RESULT == "P"] <- "Pass"
sslc.subset$L3_RESULT <- as.factor(sslc.subset$L3_RESULT)

# s1
# unique(sslc.subset$S1_RESULT)
sslc.subset$S1_RESULT <- sapply(sslc.subset$S1_RESULT, as.character)
sslc.subset$S1_RESULT[sslc.subset$S1_RESULT == "A"] <- "Absent"
sslc.subset$S1_RESULT[sslc.subset$S1_RESULT == "F"] <- "Fail"
sslc.subset$S1_RESULT[sslc.subset$S1_RESULT == "P"] <- "Pass"
sslc.subset$S1_RESULT <- as.factor(sslc.subset$S1_RESULT)

# s2
# unique(sslc.subset$S2_RESULT)
sslc.subset$S2_RESULT <- sapply(sslc.subset$S2_RESULT, as.character)
sslc.subset$S2_RESULT[sslc.subset$S2_RESULT == "A"] <- "Absent"
sslc.subset$S2_RESULT[sslc.subset$S2_RESULT == "F"] <- "Fail"
sslc.subset$S2_RESULT[sslc.subset$S2_RESULT == "P"] <- "Pass"
sslc.subset$S2_RESULT <- as.factor(sslc.subset$S2_RESULT)

# s3
# unique(sslc.subset$S3_RESULT)
sslc.subset$S3_RESULT <- sapply(sslc.subset$S3_RESULT, as.character)
sslc.subset$S3_RESULT[sslc.subset$S3_RESULT == "A"] <- "Absent"
sslc.subset$S3_RESULT[sslc.subset$S3_RESULT == "F"] <- "Fail"
sslc.subset$S3_RESULT[sslc.subset$S3_RESULT == "P"] <- "Pass"
sslc.subset$S3_RESULT <- as.factor(sslc.subset$S3_RESULT)

