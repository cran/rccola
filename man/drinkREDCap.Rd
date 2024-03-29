% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drinkREDCap.R
\name{drinkREDCap}
\alias{drinkREDCap}
\alias{loadFromRedcap}
\title{Provide API_KEYs to function (defaults to load from REDCap) and load
data into memory.}
\usage{
drinkREDCap(
  variables,
  keyring = NULL,
  envir = NULL,
  forms = NULL,
  FUN = sipREDCap,
  config = "auto",
  assign = TRUE,
  passwordFUN = getPass::getPass,
  ...
)

loadFromRedcap(
  variables,
  keyring = NULL,
  envir = NULL,
  forms = NULL,
  FUN = sipREDCap,
  config = "auto",
  assign = TRUE,
  passwordFUN = getPass::getPass,
  ...
)
}
\arguments{
\item{variables}{character vector. A list of strings that define the variables with associated API_KEYs to load into memory.}

\item{keyring}{character. Potential keyring, not used by default.}

\item{envir}{environment. The target environment for the data. Defaults to .Global}

\item{forms}{list. A list of forms. Keys are the variable(api_key), each key can contain a vector of forms.
The output variable is now the <variable>.<form>}

\item{FUN}{function. the function to call. It must have a key argument. If forms are used it should have a forms argument as well.
The default is to call sipREDCap which is a proxy for \code{\link[redcapAPI]{exportRecords}}.}

\item{config}{string. Defaults to 'auto'. If set to NULL no configuration file is searched for. If set to anything
but 'auto', that will be the config file override that is used if it exists instead of
searching for the ../<basename>.yml.}

\item{assign}{logical. Does the function write back the variable to envir or not. Defaults to TRUE.}

\item{passwordFUN}{function. Function to get the password for the keyring. Defaults to getPass::getPass().}

\item{\dots}{Additional arguments passed to FUN.}
}
\value{
Nothing
}
\description{
The first thing it does is check for a yaml config file of
the same name as the current directory with a .yml extension
one level above. This is intended for production environments
where the API_KEY must be stored in a file. If this yaml exists, then it expects this file
to contain `apiUrl` and `apiKeys`. `apiUrl` should be a
string with the URL of the REDCap instance. `apiKeys` should
be a list of variable name keys with values that are their
actual REDCap API_KEY. \cr\cr
Next it will use an api environment in memory to keep api_keys.
If one is knitting with parameters, it will request and store these
keys in memory. Otherwise it will request the user enter
each key using getPass and store it in memory.\cr\cr
IMPORTANT: Make sure that R is set to NEVER save workspace to .RData
as this is the equivalent of writing the API_KEY to a local
file in clear text.
}
\details{
An older loadFromRedcap function maps to this for backward compatibility.
}
\examples{
\dontrun{
  drinkREDCap("database", "myproject")
}

}
