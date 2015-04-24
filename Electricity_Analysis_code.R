# set working directiory 
setwd("C:/xampp/htdocs/Github/Ghana-Electricity")
list.files()

exportData= read.csv("Exploratory_Data_Analysis/Total_Electricity_Exports_(Billion_Kilowatthours).csv",header=TRUE,row.names="country", na.strings="--")
generationData= read.csv("Exploratory_Data_Analysis/Total_Electricity_Net_Generation_(Billion_Kilowatthours).csv",header=TRUE,row.names="country", na.strings="--")
consumptionData= read.csv("Exploratory_Data_Analysis/Total_Electricity_Net_Consumption_(Billion_Kilowatthours).csv",header=TRUE,row.names="country", na.strings="--")
importData= read.csv("Exploratory_Data_Analysis/Total_Electricity_Imports_(Billion_Kilowatthours).csv",header=TRUE,row.names="country", na.strings="--")

#obtaining electricity  data for Ghana
GhanaGenerationData=generationData[dimnames(generationData)[[1]]=="Ghana",]
generationvalues=as.numeric(GhanaGenerationData)
GhanaConsumptionData=consumptionData[dimnames(consumptionData)[[1]]=="Ghana",]
consumptionvalues=as.numeric(GhanaConsumptionData)
GhanaImportData=importData[dimnames(importData)[[1]]=="Ghana",]
importvalues=as.numeric(GhanaImportData)
GhanaexportData=exportData[dimnames(exportData)[[1]]=="Ghana",]
exportvalues=as.numeric(GhanaexportData)

#obtaining electricity data for Nigeria
NigeriaImportData=importData[dimnames(importData)[[1]]=="Nigeria",]
NGimportvalues=as.numeric(NigeriaImportData)
NigeriaexportData=exportData[dimnames(exportData)[[1]]=="Nigeria",]
Ngexportvalues=as.numeric(NigeriaexportData)
NigeriaConsumptionData=consumptionData[dimnames(consumptionData)[[1]]=="Nigeria",]
NGconsumptionvalues=as.numeric(NigeriaConsumptionData)

#obtaining electricity Importation data for Benin
BeninImportData=importData[dimnames(importData)[[1]]=="Benin",]
BNimportvalues=as.numeric(BeninImportData)
BeninexportData=exportData[dimnames(exportData)[[1]]=="Benin",]
Bnexportvalues=as.numeric(BeninexportData)
BeninConsumptionData=consumptionData[dimnames(consumptionData)[[1]]=="Benin",]
BNconsumptionvalues=as.numeric(BeninConsumptionData)

#obtaining electricity Importation data for Togo
TogoImportData=importData[dimnames(importData)[[1]]=="Togo",]
Tgimportvalues=as.numeric(TogoImportData)
TogoexportData=exportData[dimnames(exportData)[[1]]=="Togo",]
Tgexportvalues=as.numeric(TogoexportData)
TogoConsumptionData=consumptionData[dimnames(consumptionData)[[1]]=="Togo",]
TGconsumptionvalues=as.numeric(TogoConsumptionData)

#obtaining electricity Importation data for Ivory coast
IvoryCoastImportData=importData[dimnames(importData)[[1]]=="Cote dIvoire (IvoryCoast)",]
ICimportvalues=as.numeric(IvoryCoastImportData)
IvoryCoastexportData=exportData[dimnames(exportData)[[1]]=="Cote dIvoire (IvoryCoast)",]
ICexportvalues=as.numeric(IvoryCoastexportData)
IvoryCoastConsumptionData=consumptionData[dimnames(consumptionData)[[1]]=="Cote dIvoire (IvoryCoast)",]
ICconsumptionvalues=as.numeric(IvoryCoastConsumptionData)


electricityConsumedToGeneration   <- cbind(generationvalues, consumptionvalues)
electricityimportToExport   <- cbind(importvalues, exportvalues)
WestAfricaElectricityImport  <- cbind(importvalues, NGimportvalues, BNimportvalues,  Tgimportvalues, ICimportvalues )
WestAfricaElectricityExport  <- cbind(exportvalues, Ngexportvalues, Bnexportvalues,  Tgexportvalues, ICexportvalues )
WestAfricaElectricityConsumption  <-  cbind(exportvalues, NGconsumptionvalues, BNconsumptionvalues,  TGconsumptionvalues, ICconsumptionvalues )

#Barplot of Electricity generation Vs consumption
barplot(t(electricityConsumedToGeneration), main="Electricity Generated Vs Electricity consumed", ylab="Billion Killowatthours", xlab="Years (2005 - 2012)", legend = rownames(electricityConsumedToGeneration),
col=c("darkblue","red"), names.arg=c("2005", "2006", "2007","2008", "2009", "2010","2011", "2012"), beside=TRUE)
box(bty="l")

#Barplot of Electricity Imported Vs Exported
barplot(t(electricityimportToExport), main="Electricity Imported Vs Electricity Exported", beside=T, ylab="Billion Killowatthours", xlab="Years (2005 - 2012)", legend = rownames(electricityimportToExport),
col=c("darkblue","red"), names.arg=c("2005", "2006", "2007","2008", "2009", "2010","2011", "2012"))
box(bty="l")

#Barplot of west africa electricity importation
barplot(t(WestAfricaElectricityImport), main="West Africa Electricty Importation", beside=T, ylab="Billion Killowatthours", xlab="Years (2005 - 2012)", legend = rownames(WestAfricaElectricityImport),
col=c("red","green","yellow","brown","blue"), names.arg=c("2005", "2006", "2007","2008", "2009", "2010","2011", "2012"))
box(bty="l")

#Barplot of west africa electricity exportation
barplot(t(WestAfricaElectricityExport), main="West Africa Electricty Exportation", beside=T, ylab="Billion Killowatthours", xlab="Years (2005 - 2012)", legend = rownames(WestAfricaElectricityExport),
col=c("red","green","yellow","brown","blue"), names.arg=c("2005", "2006", "2007","2008", "2009", "2010","2011", "2012"))
box(bty="l")

#Barplot of west africa electricity consumption
barplot(t(WestAfricaElectricityConsumption), main="West Africa Electricty Consumption", beside=T, ylab="Billion Killowatthours", xlab="Years (2005 - 2012)", legend = rownames(WestAfricaElectricityConsumption),
col=c("red","green","yellow","brown","blue"), names.arg=c("2005", "2006", "2007","2008", "2009", "2010","2011", "2012"))
box(bty="l")

#Download and Install package forecast()
library(forecast)

# Automated forecasting of electricity consumption in Ghana using an exponential model
fit <- HoltWinters(consumptionvalues, beta=FALSE, gamma=FALSE)
fit <- HoltWinters(consumptionvalues, gamma=FALSE)
accuracy(fit)
forecast(fit, 2)
plot(forecast(fit, 2))

# Automated forecasting of electricity consumption in Ghana using time series model
Electricity_consumption <- ts(consumptionvalues, start=c(2013), end=c(2020), frequency=12) 
Electricity_consumption_Ghana<- window(Electricity_consumption, start=c(2013), end=c(2020)) 
plot(Electricity_consumption)
plot(Electricity_consumption_Ghana)

# Automated forecasting of electricity consumption in Ghana using an ARIMA model
fit <- auto.arima(consumptionvalues)
