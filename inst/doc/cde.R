## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----cran-installation, eval = FALSE-------------------------------------
#  install.packages("cde")

## ----gh-installation, eval = FALSE---------------------------------------
#  # if you have not done so already
#  # install.packages("remotes")
#  remotes::install_github("ropensci/cde")

## ----load and search, eval = TRUE----------------------------------------
# load the package
library(cde)

# search for waterbodies containing the name "Lark"
lark_wb<-search_names(string="Lark", column="name")

## ----show lark_wb content,eval=TRUE--------------------------------------
# show the top 6 rows of the 'name' column
head(lark_wb$name)

## ----lark search, eval=TRUE----------------------------------------------
lark_oc<-search_names(string="Lark", column="OC")

## ----status data, eval=TRUE----------------------------------------------
# extract overall waterbody status classification data for a single 
# waterbody in all years

# first decide which waterbody, we can use one from the first search 
# above (need the WBID information)
head(lark_wb)

# we will get data for the first waterbody here (WBID: GB105033042920, 
# name: Lark (US Hawstead))
lark_hawstead<-get_status(ea_name="GB105033042920", column="WBID")

# the dataframe returned contains all of the data for this site in all 
# years (we did not specify year/year range).
lark_hawstead

# just a quick look at the actual status data
table(lark_hawstead$status)

## ----lark river,eval=TRUE------------------------------------------------
# download status data for a given year range and type of waterbody
lark_OC_rivers<-get_status(ea_name="Lark", column="OC", startyr=2013, endyr=2015, type="River")
# print out the results
lark_OC_rivers

## ----lark rivers chem, eval=TRUE-----------------------------------------
# download Chemical status for rivers in all years
lark_OC_rivers_chem<-get_status(ea_name="Lark", column="OC", type="River", level="Chemical")

## ----lark plot, fig.height=4, fig.width=6.5, fig.align="center", eval=TRUE----
# get overall waterbody status information for the Lark OC between 2013 and 2015
lark_OC_2013_15 <- get_status(ea_name="Lark", column="OC", startyr=2013, endyr=2015)
# plot the data
plot(lark_OC_2013_15)

## ----lark riverplot wfd,fig.height=4, fig.width=6.5, fig.align="center", eval=TRUE----
# get the overall waterbody status information for rivers in the Lark OC in 2015
lark_OC_rivers_2015 <- get_status(ea_name="Lark", column="OC", startyr=2015, type="River")
# plot these data, using WFD colour scheme
plot(lark_OC_rivers_2015, scheme="wfd")

## ----RNAG in Lark, eval=TRUE---------------------------------------------
# what are the RNAG for the Lark OC between 2013 and 2015
lark_OC_RNAG_2013_15<-get_rnag(ea_name="Lark", column="OC", startyr=2013, endyr=2015)

## ----lark RNAG plot,fig.height=4, fig.width=6.5, fig.align="center", eval=TRUE----
# plot RNAG data for the Lark OC, between 2013 and 2015
plot(lark_OC_RNAG_2013_15)

## ----lark obj, eval=TRUE-------------------------------------------------
# download the objectives set for 2015 for the Lark Operational Catchment
lark_OC_obj_2015<-get_objectives(ea_name="Lark", column="OC", year=2015)

## ----lark obj plot,fig.height=4, fig.width=6.5, fig.align="center", eval=TRUE----
# plot the objectives for the Lark OC in 2015
plot(lark_OC_obj_2015)

## ----lark PA, eval=TRUE--------------------------------------------------
# get details of the protected areas within the Lark Operational Catchment
lark_OC_pa<-get_pa(ea_name="Lark", column="OC")

## ----lark pa plot,fig.height=4, fig.width=6.5, fig.align="center", eval=TRUE----
plot(lark_OC_pa)

## ----lark measures, eval=FALSE-------------------------------------------
#  # what measures are there for the Lark Operational Catchment?
#  lark_OC_meas<-get_measures(ea_name="Lark", column="OC")

