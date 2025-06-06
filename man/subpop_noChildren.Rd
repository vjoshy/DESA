% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subpop_noChildren.R
\name{subpop_noChildren}
\alias{subpop_noChildren}
\title{Simulate households without children}
\usage{
subpop_noChildren(
  df,
  df2,
  prop_house_size = NULL,
  prop_house_Children = NULL,
  house_size = NULL,
  interactive = FALSE
)
}
\arguments{
\item{df}{simulated output data frame from subpop_children function}

\item{df2}{simulated output data frame from elementary_pop function}

\item{prop_house_size}{vector of proportions for households with 1, 2, 3, 4, 5+ members (optional)}

\item{prop_house_Children}{proportion of households with children (optional)}

\item{house_size}{vector of random numbers for household size simulation (optional)}

\item{interactive}{logical if TRUE and parameters are NULL, prompt for input, default = FALSE}
}
\value{
A data frame representing the simulated population of households without children, including:
\item{catchID}{Catchment area ID}
\item{houseID}{Unique identifier for each household}
\item{num_people}{Number of people in the household}
\item{schoolPop}{Total population of elementary school assigned for the household}
\item{xStart}{Starting X-coordindate for assigned catchment}
\item{xEnd}{End X-coordindate for assigned catchment}
\item{yStart}{Starting Y-coordindate for assigned catchment}
\item{yEnd}{End Y-coordindate for assigned catchment}
}
\description{
Simulation of households without children using data frames from elementary_pop() and subpop_children() functions.
}
\details{
This function can be used interactively or with pre-specified parameters.
If proportions are not provided, the user will be prompted to enter them.
The function calculates the number of households without children for each catchment area
based on the proportion of households with children.
}
\examples{
# Simulate catchment areas
catch_df <- catchment_sim(4, 5, shape = 2.5, rate = 1.8)

# Simulate elementary schools using default gamma distribution
elementary_df <- elementary_pop(catch_df, shape = 3.1, rate = 0.015)

# Simulate households with children
house_children <- subpop_children(elementary_df, n = 3,
                                  prop_parent_couple = 0.7,
                                  prop_children_couple = c(0.3, 0.5, 0.2),
                                  prop_children_lone = c(0.4, 0.4, 0.2),
                                  prop_elem_age = 0.6)

# Simulate households without children using pre-specified proportions
house_noChild <- subpop_noChildren(house_children, elementary_df,
                                   prop_house_size = c(0.2, 0.3, 0.25, 0.15, 0.1),
                                   prop_house_Children = 0.3)

}
