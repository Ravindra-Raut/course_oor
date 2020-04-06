############################################################################

# psychometrics

# just in case, clear the workspace

rm(list=ls())

# read in data

load("data_survey_edit.rdata")

head(dat)

# install (if necessary) the 'psych' package and load it

if (!require(psych)) install.packages("psych")

library(psych)

# install (if necessary) the 'GPArotation' package

if (!require(GPArotation)) install.packages("GPArotation")

# Cronbach's alpha

names(dat)
grep("lotr", names(dat))
grep("lotr[0-9]", names(dat))

alpha(dat[grep("lotr[0-9]", names(dat))])
alpha(dat[grep("mastery[0-9]", names(dat))])
alpha(dat[grep("pss[0-9]", names(dat))])
alpha(dat[grep("rses[0-9]", names(dat))])

alpha(dat[c("panas1", "panas4", "panas6", "panas7", "panas9", "panas12", "panas13", "panas15", "panas17", "panas18")])
alpha(dat[c("panas2", "panas3", "panas5", "panas8", "panas10", "panas11", "panas14", "panas16", "panas19", "panas20")])

# scree plot

sub <- dat[grep("pss[0-9]", names(dat))]

scree(sub, factors=FALSE)

# parallel analysis

fa.parallel(sub, fa="pc", n.iter=1000, sim=FALSE)

# PCA

principal(sub, nfactors=2, rotate="oblimin")

# EFA using principal axis factoring (PAF)

fa(sub, nfactors=2, rotate="oblimin", fm="pa")

############################################################################

# heatmaps

rm(list=ls())

# install (if necessary) the 'viridis' package and load it

if (!require(viridis)) install.packages("viridis")

library(viridis)

# read in data

load("data_survey_edit.rdata")

# create a dataset like you might have

mat <- cor(dat[c("age", "lotr", "mastery", "pss", "rses", "posaff", "negaff")],
           use = "complete.obs")
mat
dat <- as.data.frame(mat)
rownames(dat) <- 1:nrow(dat)
dat <- cbind(var=colnames(dat), dat)
dat

# remove first column

dat[2:8]
dat[-1]

dat[-c(1:2)]

# a basic heatmap

heatmap(dat[-1])

# heatmap doesn't take data frames as input; need to supply a matrix

heatmap(as.matrix(dat[-1]))

# add row names based on 'var' variable

heatmap(as.matrix(dat[-1]), labRow=dat$var)

# switch to viridis color scheme

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var)

# reverse the order of the columns

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var, revC=TRUE)

# no dendograms

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var, revC=TRUE,
        Rowv=NA, Colv=NA)

# more space for margins (default is c(5,5))

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var, revC=TRUE,
        Rowv=NA, Colv=NA, margins=c(7,7))

# don't rescale

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var, revC=TRUE,
        Rowv=NA, Colv=NA, margins=c(7,7), scale="none")

# add a legend (manually)

heatmap(as.matrix(dat[-1]), col=viridis(50), labRow=dat$var, revC=TRUE,
        Rowv=NA, Colv=NA, margins=c(7,16), scale="none")

legend("right", fill=viridis(21), legend=round(seq(min(dat[-1]),max(dat[-1]),length=21), 2))

# install (if necessary) the 'pheatmap' package and load it

if (!require(pheatmap)) install.packages("pheatmap")

library(pheatmap)

pheatmap(as.matrix(dat[-1]), col=viridis(50), labels_row=dat$var)

pheatmap(as.matrix(dat[-1]), col=viridis(50),
         labels_row=dat$var, fontsize=16)

pheatmap(as.matrix(dat[-1]), col=viridis(50), fontsize=16,
         labels_row=paste(" ", dat$var, "    "),
         labels_col=paste(" ", dat$var, "    "))

pheatmap(as.matrix(dat[-1]), col=viridis(50), fontsize=16,
         labels_row=paste(" ", dat$var, "    "),
         labels_col=paste(" ", dat$var, "    "),
         cluster_rows=FALSE, cluster_col=FALSE)

# install (if necessary) the 'heatmaply' package and load it

if (!require(heatmaply)) install.packages("heatmaply")

library(heatmaply)

heatmaply(dat[-1])
ggheatmap(dat[-1])

############################################################################

# plot of intensity at x and y coordinates

set.seed(1234)
n <- 200
dat <- data.frame(x = runif(n), y = runif(n))
dat$intensity <- 0.55 - 1 * (dat$x-0.7)^2 + 1 * (dat$y-0.2)^3 + rnorm(n, 0, .04)
head(dat)
range(dat$intensity)

# install (if necessary) the 'akima' package and load it

if (!require(akima)) install.packages("akima")

library(akima)

# interpolate points

res <- interp(dat$x, dat$y, dat$intensity)

filled.contour(res, color=hcl.colors, xlab="x", ylab="y")

res$z[is.na(res$z)] <- 0

filled.contour(res, color=hcl.colors, xlab="x", ylab="y")

filled.contour(res, color=hcl.colors, xlab="x", ylab="y", nlevels=100)

# something really fancy

if (!require(plotly)) install.packages("plotly")

library(plotly)

plot_ly(x = ~ res$x, y = ~ res$y, z = ~ res$z) %>%
add_surface(
   contours = list(
      z = list(
         show = TRUE,
         usecolormap = TRUE,
         highlightcolor = "#ff0000",
         project = list(z=TRUE)
      )
   )
) %>%
layout(
   scene = list(
      camera = list(
         eye = list(x=1.87, y=0.88, z=-0.64)
      )
   )
)

############################################################################

# just in case, clear the workspace

rm(list=ls())

# merge two datasets by a common id

dat1 <- data.frame(id  = c(1, 3, 4, 5, 7),
                   age = c(30, 34, 28, 21, 29),
                   sex = c("f", "m", "m", "f", "m"))

dat2 <- data.frame(id = c(1, 2, 4, 5, 6),
                   pss = c(29, 22, 19, 31, 27))

dat1
dat2

dat <- merge(dat1, dat2, by="id")
dat

dat <- merge(dat1, dat2, by="id", all.x=TRUE)
dat

dat <- merge(dat1, dat2, by="id", all=TRUE)
dat

############################################################################

# restructure a dataset from wide to long format

dat.wide <- data.frame(subj = 1:5,
                       y1 = c(5,3,6,7,3),
                       y2 = c(4,NA,6,5,4),
                       y3 = c(2,3,4,4,1))
dat.wide

dat.long <- reshape(dat.wide, direction="long", varying=list(2:4),
                    v.names="y", timevar="week", idvar="id")
dat.long

dat.long <- dat.long[order(dat.long$id),]
dat.long

dat.long$id <- NULL
rownames(dat.long) <- 1:nrow(dat.long)
dat.long

# restructure a dataset from long to wide format

reshape(dat.long, direction="wide", idvar="subj", timevar="week",
        v.names = "y", sep="")

############################################################################

# per-group operations in long format datasets

dat.long

# get the mean of y for each subject

aggregate(dat.long$y, by=list(dat.long$subj), FUN=mean)

aggregate(dat.long$y, by=list(dat.long$subj), FUN=mean, na.rm=TRUE)

by(dat.long$y, dat.long$subj, mean)
c(by(dat.long$y, dat.long$subj, mean, na.rm=TRUE))

# add the mean of y for each subject to the dataset

dat.long$ym <- ave(dat.long$y, dat.long$subj, FUN=mean)
dat.long

dat.long$ym <- ave(dat.long$y, dat.long$subj,
                   FUN = function(x) mean(x, na.rm=TRUE))
dat.long

############################################################################

rm(list=ls())

# read in data

load("data_survey_edit.rdata")

# dichotomize a variable

dat$highpa <- ifelse(dat$posaff > median(dat$posaff), 1, 0)

head(dat)

# categorizing a quantitative variable

dat$pss
table(dat$pss)

dat$pss.lvl <- ifelse(dat$pss > 25, 1, 0)
table(dat$pss.lvl)

dat$pss.lvl <- cut(dat$pss, breaks=c(0, 20, 30, 40, 50))
table(dat$pss.lvl)

# (0,20] means 'just above 0 to 20 inclusive'

dat$pss.lvl <- cut(dat$pss, breaks=c(0, 20, 30, 40, 50), labels=1:4)
table(dat$pss.lvl)

# collapse some levels of a categorical variable

dat$stress <- dat$source
table(dat$stress)

dat$stress <- ifelse(dat$stress == "children",       "interpers", dat$stress)
dat$stress <- ifelse(dat$stress == "family",         "interpers", dat$stress)
dat$stress <- ifelse(dat$stress == "friendships",    "interpers", dat$stress)
dat$stress <- ifelse(dat$stress == "spouse/partner", "interpers", dat$stress)

table(dat$stress)

############################################################################

# string manipulation

id <- c("DB1965", "PL1967", "ES1975")
id

substr(id, start=3, stop=6)

as.numeric(substr(id, start=3, stop=6))

id <- c("DB1965", "PLK1967", "ES1975")
id

as.numeric(substr(id, start=3, stop=6))

nchar(id)

substr(id, start=nchar(id)-3, stop=nchar(id))
as.numeric(substr(id, start=nchar(id)-3, stop=nchar(id)))

############################################################################

# multilevel / mixed-effects modeling

# nlme package:
# - older, no further development
# - only for general linear mixed-effects models
# - handles serial correlation & heteroscedastic errors
#
# lme4 package:
# - newer, still under active development
# - handles large data sets more efficiently
# - general and generalized linear models
# - handles crossed random effects more easily
#
# both also handle non-linear models
# (there are other packages, but these are most popular)

library(nlme)

data(Orthodont)
Orthodont

res <- lme(distance ~ age * Sex, random = ~ age | Subject, data=Orthodont)
summary(res)

############################################################################

# survival analysis

rm(list=ls())

library(survival)
data(leukemia)
head(leukemia)

# Kaplan-Meier estimator

res <- survfit(Surv(time, status) ~ x, data = leukemia)
summary(res)

# Kaplan-Meier plot with 95% CI

plot(res, lty = c("dotted", "dashed"), lwd=3)
legend("topright", inset=.02, c("Maintained","Nonmaintained"),
       lty = c("dotted","dashed"), lwd=3)

# Kaplan-Meier plot with 95% CI

plot(res, lty = c("dotted", "dashed"), lwd=3)
lines(res, conf.int=TRUE, col=c("blue","red"), lty="dotted") # add confidence intervals
legend("topright", inset=.02, c("Maintained","Nonmaintained"),
       lty = c("dotted","dashed"), lwd=3)

# log-rank test

survdiff(Surv(time, status) ~ x, data=leukemia)

# Cox proportional hazards regression model

res <- coxph(Surv(time, status) ~ x, data=leukemia)
summary(res)

# predicted survivor function

newdat <- data.frame(x=c("Maintained","Nonmaintained"))
pred <- summary(survfit(res, newdata=newdat))
pred

plot(pred$surv[,1] ~ pred$time, ylim=c(0,1), type="s", col="blue")
lines(pred$surv[,2] ~ pred$time, type="s", col="red")
legend("topright", legend=c("Maintained","Nonmaintained"),
       lty="solid", col=c("blue","red"), inset=.02)

# testing the proportional hazards assumption

cox.zph(res)

############################################################################

# multiple imputation

rm(list=ls())

if (!require(mice)) install.packages("mice")

library(mice)

load("data_survey_edit.rdata")

sub <- dat[c("pss", "age", "smoke", "rses")]

# lm() does listwise deletion when there are missing values

res <- lm(pss ~ age + smoke + rses, data=sub)
summary(res)

# set up predictor matrix

predMatrix <- make.predictorMatrix(sub)
predMatrix

# set up imputation methods vector

impMethod <- make.method(sub)
impMethod

# run mice

imp <- mice(sub, method = impMethod, predictorMatrix = predMatrix, seed = 12345)

# fit model in each imputed dataset

fit <- with(imp, lm(pss ~ age + smoke + rses))

# pool results

pool <- pool(fit)
summary(pool)

# https://stefvanbuuren.name/fimd/

############################################################################

# some other techniques/packages/functions:
# - generalized estimating equations: gee, geepack
# - time series: ts(), arima()
# - bootstrapping: boot, bootstrap
# - CFA/SEM: sem, lavaan
# - machine learning: nnet, rpart, lasso2, lars, glmnet, elasticnet, randomForest, ...
#
# non-parametric methods:
# - cor() with arguments method="kendall" or method="spearman"
# - wilcox.test() – Wilcoxon rank sum and signed rank tests
# - kruskal.test() – Kruskal-Wallis rank sum test
# - friedman.test() – Friedman rank sum test

############################################################################
