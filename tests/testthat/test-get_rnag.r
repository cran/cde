library(cde)
context("testing RNAG issue downloads")

test_that("get_rnag returns a dataframe (as cde_df class)", {
  # retrieve data for specific waterbody
  testframe<-get_rnag("GB112071065700", "WBID")
  # check that it outputs a dataframe object
  expect_true(is.data.frame(testframe))
})

test_that("invalid column specified returns an error", {
  # retrieve data for column "Aardvark"
  expect_error(get_rnag("Avon Warwickshire", "Aardvark"))
})

test_that("incorrect arguments returns an error", {
  # left out column value to search on
  expect_error(get_rnag("Avon Hampshire", startyr=2013))
})

test_that("invalid string returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(get_rnag("Aardvark", "WBID"))
})

test_that("invalid type returns an error", {
  # retrieve data for type "Aardvark"
  expect_error(get_rnag("Avon Hampshire", "MC", startyr=2013, type="Aardvark"))
})

test_that("start date before 2013 range returns an error", {
  # retrieve data for year 1900
  expect_error(get_rnag("Avon Hampshire", "MC", startyr=2012))
})

test_that("end date before start date returns an error", {
  # retrieve data for impossible year range
  expect_error(get_rnag("Avon Hampshire", "MC", startyr=2014, endyr=1900))
})

test_that("end date outside available range returns a message", {
  # retrieve data for years outside possible range
  expect_message(get_rnag("Avon Hampshire", "MC", startyr=2014, endyr=2100))
})

test_that("start date outside available range returns a message", {
  # retrieve data for years outside possible range
  expect_message(get_rnag("Avon Hampshire", "MC", startyr=2100))
})

test_that("incorrect level returns a error", {
  # retrieve data for level that does not exist
  expect_error(get_rnag("Avon Hampshire", "MC", level="Aaardvark", 
                        startyr=2015))
})

test_that("specifying type for WB download returns a message", {
  # retrieve data for level that does not exist
  expect_message(get_rnag("GB112071065700", "WBID", type="River"))
})

test_that("downloading empty dataframe (no RNAG) returns a message", {
  # retrieve data for OC without RNAG
  expect_message(get_rnag("Cornwall North Coastal", "OC", startyr = 2016))
})
