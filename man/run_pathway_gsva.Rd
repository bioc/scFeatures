% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_scfeatures.R
\name{run_pathway_gsva}
\alias{run_pathway_gsva}
\title{Generate pathway score using gene set enrichement analysis}
\usage{
run_pathway_gsva(
  data,
  method = "ssgsea",
  geneset = NULL,
  species = "Homo sapiens",
  type = "scrna",
  subsample = TRUE,
  ncores = 1
)
}
\arguments{
\item{data}{A list object containing \code{data} matrix and \code{celltype} and \code{sample} vector.}

\item{method}{Type of pathway analysis method, currently support \code{ssgsea}
and \code{aucell}}

\item{geneset}{By default (when the \code{geneset} argument is not specified),
we use the 50 hallmark gene set from msigdb.
The users can also provide their geneset of interest in a list format, with
each list entry containing a vector of the names of genes in a gene set.
eg, geneset <- list("pathway_a" = c("CAPN1", ...), "pathway_b" = c("PEX6"))}

\item{species}{Whether the species is "Homo sapiens" or "Mus musculus".
Default is "Homo sapiens".}

\item{type}{The type of dataset, either "scrna", "spatial_t", or "spatial_p".}

\item{subsample}{Whether to subsample, either TRUE or FALSE. For larger datasets
(eg, over 30,000 cells), the subsample function can be used to increase
speed.}

\item{ncores}{Number of cores for parallel processing.}
}
\value{
a dataframe of samples x features
The features are in the form of pathway 1 celltype a, pathway 2 celltype b ...
etc, with the number representing the gene set enrichment score of a given
pathway in cells from a given celltype.
}
\description{
This function calculates pathway scores for a given input
dataset and gene set using gene set enrichment analysis (GSVA).
It supports scRNA-seq, spatial proteomics and spatial transcriptomics.
It currently supports two pathway analysis methods: ssgsea and aucell.
By default, it uses the 50 hallmark gene sets from msigdb.
Alternatively, users can provide their own gene sets of interest
in a list format.
}
\examples{

utils::data("example_scrnaseq" , package = "scFeatures")
data <- example_scrnaseq[, 1:20]
celltype <- data$celltype
sample <- data$sample
data <- data@assays$RNA@data

alldata <- scFeatures:::formatData(data = data, celltype = celltype, sample = sample )

feature_pathway_gsva <- run_pathway_gsva(
    alldata,
    geneset = NULL, species = "Homo sapiens",
    type = "scrna", subsample = FALSE, ncores = 1
 )

}
