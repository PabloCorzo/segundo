library("afex")
library("car")
library("emmeans")
# library("easystats") # carga performance y effectsize
library("tidyverse")

# options
theme_set(theme_bw())  # cambia el tema de ggplot

#' Implementa la fórmula de variaciones n! / (n - m)! de forma que sea numéricamente
#' estable
variaciones <- function(n, m) {
  exp(lgamma(n + 1L) - lgamma(n - m + 1L))
}


#' Integral doble que integra usando el orden dydx (primero dy, luego dx)
#' @param .f Función de dos variables. Los nombres de los argumentos deben ser,
#' necesariamente, x e y.
#' @param from_x Número indicando el límite inferior de la integral exterior (dx).
#' @param to_x Número indicando el límite superior de la integral exterior (dx).
#' @param from_y Función en x indicando el límite inferior de la integral interior (dx).
#' @param from_y Función en x indicando el límite superior de la integral interior (dx).
integrate2_dydx <- function(.f, from_x, to_x, from_y, to_y) {
  stopifnot(is.numeric(from_x) && is.numeric(to_x))
  stopifnot(is.function(from_y) && is.function(to_y))
  # integrate y
  inner_integral <- function(x) {
    sapply(
      x,
      function(xv) {
        integrate(.f, force(from_y(xv)), force(to_y(xv)), x = xv)$value
      }
    )
  }
  # integrate x
  integrate(inner_integral, from_x, to_x)
}

#' Integral doble que integra usando el orden dxdy (primero dx, luego dy)
#' @param .f Función de dos variables. Los nombres de los argumentos deben ser,
#' necesariamente, x e y.
#' @param from_x Función en y indicando el límite inferior de la integral interior (dx).
#' @param to_x Función en y indicando el límite superior de la integral interior (dx).
#' @param from_y Número indicando el límite inferior de la integral exterior (dy).
#' @param from_y Número indicando el límite superior de la integral interior (dy).
integrate2_dxdy <- function(.f, from_x, to_x, from_y, to_y) {
  stopifnot(is.function(from_x) && is.function(to_x))
  stopifnot(is.numeric(from_y) && is.numeric(to_y))
  # integrate x
  inner_integral <- function(y) {
    sapply(
      y,
      function(yv) {
        integrate(.f, force(from_x(yv)), force(to_x(yv)), y = yv)$value
      }
    )
  }
  # integrate y
  integrate(inner_integral, from_y, to_y)
}


#' Calcula la codificación para matrices de contrastes
#' @param my_contrats Matriz de contrastes especificando un contraste por fila.
#' Para un factor con n niveles, debería tener dimensión (n - 1) x n.
get_contrasts_coding <- function(my_contrasts) {
  if ((nrow(my_contrasts) != (ncol(my_contrasts) - 1))) {
    stop("Invalid dimensions for my_contrasts. For n levels of a factor should be (n - 1) x n")
  }

  my_contrasts <- rbind("constant" = 1 / ncol(my_contrasts), my_contrasts)
  solve(my_contrasts)[, -1]
}


#' Interpretación de coeficientes de regresión con transformaciones logarítmicas
#' @param coefficient Valor del coeficiente de regresión a interpretar
#' @param log_transformation Indica sobre qué variables se ha aplicado la transformación
#' logarítmica
#' @param percent_increase Incremento percentual en x para las transformaciones "both" y "predictor"
#' See: https://library.virginia.edu/data/articles/interpreting-log-transformations-in-a-linear-model
log_interpretation <- function(
    coefficient,
    log_transformation = c("both", "response", "predictor"),
    percent_increase = 1
) {
  log_transformation = match.arg(log_transformation)
  stopifnot((percent_increase > 0) && (percent_increase <= 100))
  switch(
    log_transformation,
    "response" = {
      increase = (exp(coefficient) - 1) * 100
      text = ifelse(increase > 0, "increase", "decrease")
      cat("A unit increase in x => ", abs(increase), "% ", text, " in y\n", sep = "")
    },
    "predictor" = {
      text = ifelse(coefficient > 0, "increases", "decreases")
      cat("A ", percent_increase, "% increase in x => ", "y ", text, " by ",
          abs(coefficient * log(1 + percent_increase / 100)), " units\n", sep = "")
    },
    "both" = {
      text = ifelse(coefficient > 0, "increase", "decrease")
      change = ((1  + percent_increase / 100) ^ coefficient - 1) * 100
      cat("A ", percent_increase, "% increase in x => ", abs(change), "% ", text, " in y\n", sep = "")
    }
  )
}
