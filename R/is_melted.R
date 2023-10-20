is_melted <- function(dat){
    all(c("Method","PP","CS") %in% names(dat))
}