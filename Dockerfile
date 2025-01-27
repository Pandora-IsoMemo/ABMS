FROM inwt/r-shiny:4.4.1

ADD . .

RUN installPackage

CMD ["Rscript", "-e", "library(ABMS);startApplication(3838)"]
