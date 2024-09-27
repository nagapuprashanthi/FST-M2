-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/praha/input.txt' AS (line);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
totalCount = FOREACH grpd GENERATE $0 As word, count($1) AS countOfWords;
--Remove the old results folder
rmf hdfs:///user/praha/PigResult;
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/praha/PigResult';
