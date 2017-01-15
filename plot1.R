df<-read.table("household_power_consumption.txt", header=FALSE, sep=";")
d<-df[df$V1=="1/2/2007" | df$V1=="2/2/2007",]
d$V1<-as.Date(d$V1,"%d/%m/%Y")
d$V1<-format(d$V1,"%a %m %d")
head(d)
d$V2<-strptime(d$V2,format = "%H:%M:%S")
d$V2<-format(d$V2,format = "%H:%M:%S")
head(d)
d$V3<-as.numeric(as.matrix(d$V3))
hist(d$V3 , col = "red", border = NULL,
     main = paste("Global Active Power"),
     axes = TRUE, plot = TRUE, labels = FALSE,
     nclass = NULL, warn.unused = TRUE, xlab="Global Active Power (in kilowatts)", ylab="Frequency")
dev.copy(png,'plot1.png')
dev.off()
