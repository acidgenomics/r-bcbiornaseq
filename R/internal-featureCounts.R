#' Load up the featureCounts aligned counts matrix
#'
#' @details
#' Use the genes argument to dynamically resize the matrix. This is necessary
#' when slotting this data into assays along with pseudoaligned counts.
#'
#' @note Updated 2020-12-03.
#' @noRd
.featureCounts <-
    function(projectDir, samples, genes = NULL) {
        assert(
            isADirectory(projectDir),
            isCharacter(samples),
            isCharacter(genes, nullOK = TRUE)
        )
        alert("Importing aligned counts from {.pkg featureCounts}.")
        ## Locate the counts file. This file path was reorganized to include a
        ## 'featureCounts' subdirectory in bcbio v1.2.4.
        if (isAFile(
            file.path(projectDir, "featureCounts", "combined.counts")
        )) {
            file <- file.path(projectDir, "featureCounts", "combined.counts")
        } else if (isAFile(
            file.path(projectDir, "combined.counts")
        )) {
            file <- file.path(projectDir, "combined.counts")
        } else {
            stop("Failed to locate featureCounts matrix.")
        }
        counts <- import(file = file)
        assert(is.matrix(counts))
        colnames(counts) <- makeNames(colnames(counts))
        assert(isSubset(samples, colnames(counts)))
        counts <- counts[, samples, drop = FALSE]
        ## We have to coerce to data frame to resize the matrix by row names.
        ## You can't do this on a matrix directly, otherwise you'll hit a
        ## "subscript out of bounds" error.
        if (is.character(genes)) {
            counts <- as.data.frame(counts)
            counts <- counts[genes, , drop = FALSE]
            rownames(counts) <- genes
            counts <- as.matrix(counts)
        }
        mode(counts) <- "integer"
        counts
    }
