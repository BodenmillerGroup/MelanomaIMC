# helper function to aggregate the data over selected cell populations.

calculateSummary <- function(x, split_by = NULL, exprs_values = "counts"){
  # Check if x is SingleCellExpriment
  .sceCheck(x)

  # Check if assay entry exits
  .assayCheck(x, exprs_values)

  # Check if selected variable exists
  entries <- colnames(colData(x))
  if(!is.null(split_by) & sum(split_by %in% entries) < length(split_by)){
    stop("The entry for split_by is not in the colData slots of the object.")
  }

  # Compute the summary statistics
  if(length(split_by) == 1){
    cur_factor <- list(colData(x)[,split_by])
  }
  else{
    cur_factor <- as.list(colData(x)[,split_by])
  }

  if(!is.null(split_by)){
    # Calculate mean
    cur_mean <- aggregate(t(assay(x, exprs_values)), cur_factor, mean)

    # Calculate median
    cur_median <- aggregate(t(assay(x, exprs_values)), cur_factor, median)

    # Calculate variance
    cur_var <- aggregate(t(assay(x, exprs_values)), cur_factor, var)

    # Create colData slot
    col_data <- DataFrame(cur_mean[,1:length(split_by)])
    colnames(col_data) <- split_by

    # Remove factor columns and transpose
    cur_mean <- t(cur_mean[,rownames(assay(x, exprs_values))])
    cur_median <- t(cur_median[,rownames(assay(x, exprs_values))])
    cur_var <- t(cur_var[,rownames(assay(x, exprs_values))])
  }
  else{
    # Calculate mean
    cur_mean <- as.matrix(rowMeans(assay(x, exprs_values)))

    # Calculate median
    cur_median <- as.matrix(matrixStats::rowMedians(assay(x, exprs_values)))

    # Calculate variance
    cur_var <- as.matrix(matrixStats::rowVars(assay(x, exprs_values)))
  }

  # Prepare SingleCellExperiment for output
  sce_out <- SingleCellExperiment::SingleCellExperiment(
    assays = SimpleList(meanCounts = cur_mean,
                        medianCounts = cur_median,
                        varCounts = cur_var))

  # Save rowData and colData
  if(!is.null(split_by)){
    colData(sce_out) <- S4Vectors::DataFrame(col_data)
  }

  rowData(sce_out) <- rowData(x)

  return(sce_out)

}
